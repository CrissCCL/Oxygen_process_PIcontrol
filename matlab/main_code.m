%% main_sopdt_deadtime_cl.m
% SOPDT (2 poles) + dead time identification (NO zeros)
% Input  : o_in
% Output : o_out
%
% - Segment selection (time window or indices)
% - Normalization using baseline 0..300 s (within segment)
% - Optional SG filtering
% - tfest: 2 poles, 0 zeros, delay sweep
% - Validation: compare(), predict(1), sim()
%
% Toolboxes: System Identification + Control System Toolbox

clear; close all; clc;

%% 1) Data loading
load("dataOX");  % must contain o_in, o_out
assert(exist('o_in','var')==1,  'dataOX must contain variable o_in');
assert(exist('o_out','var')==1, 'dataOX must contain variable o_out');

o_in  = o_in(:);
o_out = o_out(:);

%% 2) Sampling and time vector
Ts = 1;  % <-- set your real Ts
N  = min(length(o_in), length(o_out));
o_in  = o_in(1:N);
o_out = o_out(1:N);

t = (0:N-1)'*Ts;

%% 3) Select ONLY the closed-loop identification segment
use_time_window = true;

if use_time_window
    t_start = 1200;   % <-- edit
    t_end   = 2200;   % <-- edit
    idx = (t >= t_start) & (t <= t_end);
else
    i0 = 1200;        % <-- edit
    i1 = 2200;        % <-- edit
    idx = false(size(t));
    idx(i0:i1) = true;
end

y_raw = o_out(idx);
u_raw = o_in(idx);

% local time inside segment (starts at 0)
t_seg = (0:length(y_raw)-1)'*Ts;

assert(numel(y_raw) > 50, 'Selected segment too short. Increase window.');

%% 4) Quick visualization (segment)
figure('Name','Raw signals (selected segment)');
subplot(2,1,1)
plot(t_seg, y_raw, 'LineWidth', 1.0);
ylabel('Output y (o\_out)'); grid on; xlabel('Time in segment (s)');
legend('Measured');

subplot(2,1,2)
plot(t_seg, u_raw, 'LineWidth', 1.0);
ylabel('Input u (o\_in)'); grid on; xlabel('Time in segment (s)');

%% 5) Normalization using FIXED baseline 0..300 s (within the segment)
t_base_end = 300;                 % seconds
k_base_end = min(length(t_seg), floor(t_base_end/Ts) + 1);

assert(k_base_end >= 10, 'Baseline window too short. Check Ts or segment length.');

y0 = mean(y_raw(1:k_base_end));
u0 = mean(u_raw(1:k_base_end));

y_n = y_raw - y0;
u_n = u_raw - u0;

%% 6) Optional SG filtering (keep mild to preserve underdamped shape)
do_sg = true;

if do_sg
    sgolay_order = 3;
    sgolay_frame = 11; % must be odd; try 7/9/11 depending on noise
    sgolay_frame = min(sgolay_frame, 2*floor((numel(y_n)-1)/2)+1);
    if sgolay_frame < 5, sgolay_frame = 5; end

    y_f = sgolayfilt(y_n, sgolay_order, sgolay_frame);
    u_f = sgolayfilt(u_n, sgolay_order, sgolay_frame);
else
    y_f = y_n;
    u_f = u_n;
end

figure('Name','Filtered + normalized (segment)');
subplot(2,1,1)
plot(t_seg, y_f, 'LineWidth', 1.0); grid on;
ylabel('y (normalized)'); xlabel('Time in segment (s)');
title(sprintf('Baseline: 0..%ds', t_base_end));

subplot(2,1,2)
plot(t_seg, u_f, 'LineWidth', 1.0); grid on;
ylabel('u (normalized)'); xlabel('Time in segment (s)');

%% 7) Build iddata
z = iddata(y_f, u_f, Ts, 'TimeUnit','seconds');

%% 8) Model estimation: 2 poles, 0 zeros, delay sweep (tfest)
np = 2;
nz = 0;

opt = tfestOptions('Display','off','InitializeMethod','all');
opt.Focus = 'simulation';

L_min  = 0;
L_max  = 60;      % adjust if needed
L_step = Ts;

bestFit = -inf;
bestG   = [];
bestL   = NaN;

for Ltest = L_min:L_step:L_max
    Lk = max(0, round(Ltest/Ts));
    try
        Gtest = tfest(z, np, nz, Lk, opt);

        ysim = sim(Gtest, z);
        den = norm(z.y - mean(z.y));
        fit = 100*(1 - norm(z.y - ysim.y)/den);

        if isfinite(fit) && fit > bestFit
            bestFit = fit;
            bestG   = Gtest;
            bestL   = Ltest;
        end
    catch
        % ignore failed runs
    end
end

assert(~isempty(bestG), 'tfest failed for all delays. Expand delay range or check data.');

G = bestG;

fprintf('\nBaseline used: 0..%d s (k=1..%d)\n', t_base_end, k_base_end);
fprintf('Best delay found: %.3f s | Simulation fit: %.2f %%\n', bestL, bestFit);
present(G);

%% 9) Validation (compare)
copt = compareOptions;
copt.InitialCondition = 'fixed';

figure('Name','Validation: compare()');
compare(z, G, copt);
grid on;
title(sprintf('compare() - 2nd order + dead time (best L=%.2fs)', bestL));

%% 10) Validation: 1-step prediction vs free-run simulation
yp = predict(G, z, 1);
ys = sim(G, z);

y_meas = z.y;
t0 = (0:length(y_meas)-1)'*Ts;

den = norm(y_meas - mean(y_meas));
fit_pred = 100*(1 - norm(y_meas - yp.y)/den);
fit_sim  = 100*(1 - norm(y_meas - ys.y)/den);

figure('Name','Validation: 1-step vs free-run');
plot(t0, y_meas, 'k', 'LineWidth', 1.2); hold on;
plot(t0, yp.y,   'LineWidth', 1.2);
plot(t0, ys.y,   'LineWidth', 1.2);
grid on; xlabel('Time in segment (s)'); ylabel('Output (normalized)');
legend( ...
    'Measured', ...
    sprintf('1-step predict (%.2f%%)', fit_pred), ...
    sprintf('Free-run sim (%.2f%%)',   fit_sim), ...
    'Location','best');
title('Prediction vs Simulation');

%% 11) Export figures for README (optional)
outdir = 'output';
if ~exist(outdir,'dir'); mkdir(outdir); end

exportgraphics(findobj('Type','figure','Name','Raw signals (selected segment)'), ...
    fullfile(outdir,'raw_segment.png'), 'Resolution', 180);

exportgraphics(findobj('Type','figure','Name','Filtered + normalized (segment)'), ...
    fullfile(outdir,'filtered_segment.png'), 'Resolution', 180);

exportgraphics(findobj('Type','figure','Name','Validation: compare()'), ...
    fullfile(outdir,'compare_fit.png'), 'Resolution', 180);

exportgraphics(findobj('Type','figure','Name','Validation: 1-step vs free-run'), ...
    fullfile(outdir,'predict_vs_sim.png'), 'Resolution', 180);

fprintf('\nFigures exported to ./%s\nDone.\n', outdir);




%% 10) Robust PI design on identified model (simple & reportable)
% Goal: plant-friendly robust PI via target phase margin
Mp_target = 7.5;     % percent overshoot
Ts_target = 288;     % settling time (2%) in seconds

% Initial guess (helps convergence)
try
    topts = pidtuneOptions('PhaseMargin',60);
    C0 = pidtune(G,'PI',topts);
catch
    C0 = pidtune(G,'PI');
end

Kp0 = C0.Kp;
Ti0 = C0.Kp / max(C0.Ki, 1e-12);   % since Ki = Kp/Ti

% Optimize in log-space to enforce positivity
x0 = log([max(Kp0,1e-6), max(Ti0,1e-6)]);

% Weighting (tune if needed)
wMp = 1.0;    % overshoot weight
wTs = 1.0;    % settling time weight
wBad = 50.0;  % penalty weight for invalid/unsettled/unstable

opts = optimset('Display','iter','MaxIter',200,'TolX',1e-6,'TolFun',1e-6);

objfun = @(x) pi_obj(x, G, Mp_target, Ts_target, wMp, wTs, wBad);

xopt = fminsearch(objfun, x0, opts);

Kp = exp(xopt(1));
Ti = exp(xopt(2));

Cpi = pid(Kp, Kp/Ti);   % Ki = Kp/Ti

% Evaluate final performance
Tcl = feedback(Cpi*G, 1);
info = stepinfo(Tcl, 'SettlingTimeThreshold', 0.02);

fprintf('\n=== Final PI (model-based) ===\n');
fprintf('Kp = %.6g\n', Kp);
fprintf('Ti = %.6g s\n', Ti);
fprintf('Overshoot = %.3f %%\n', info.Overshoot);
fprintf('SettlingTime(2%%) = %.3f s\n', info.SettlingTime);

% Plots for README
figure('Name','PI tuned: margins');
margin(Cpi*G); grid on;
title('PI tuned: margins');

figure('Name','PI tuned: closed-loop step');
step(Tcl); grid on;
title(sprintf('CL step | Mp=%.2f%%, Ts=%.1fs', info.Overshoot, info.SettlingTime));

%% ---- local objective function ----
function J = pi_obj(x, G, Mp_target, Ts_target, wMp, wTs, wBad)
    Kp = exp(x(1));
    Ti = exp(x(2));
    Ki = Kp / Ti;

    C = pid(Kp, Ki);
    Tcl = feedback(C*G, 1);

    % Penalize unstable
    try
        if ~isstable(Tcl)
            J = wBad * 1e3;
            return;
        end
    catch
        % if isstable fails for some model types
    end

    % Step response info
    try
        info = stepinfo(Tcl, 'SettlingTimeThreshold', 0.02);
    catch
        J = wBad * 1e3;
        return;
    end

    % Penalize if not settling / NaNs
    if any(~isfinite([info.Overshoot, info.SettlingTime])) || info.SettlingTime<=0
        J = wBad * 1e3;
        return;
    end

    % Core error terms
    eMp = (info.Overshoot - Mp_target);
    eTs = (info.SettlingTime - Ts_target);

    J = wMp*(eMp/Mp_target)^2 + wTs*(eTs/Ts_target)^2;

    % Soft penalties to avoid silly controllers (optional)
    if Kp > 1e4 || Ki > 1e4 || Ti > 1e6
        J = J + wBad;
    end
end