# 🧪⚙️ Closed-Loop Identification & PI Control  
## Oxygen Transfer Rate (VTO) — Industrial Process Control Case Study

## 📖 Overview
This repository documents a **practical industrial workflow** for **system identification and PI control**
applied to a **pilot-scale biochemical process**, where oxygen dynamics directly impact the **Oxygen Transfer Rate (VTO)**.

Instead of forcing a single open-loop model, the controller was engineered using robust steps aligned with real plant commissioning:
- **Open-loop identification** produced inconsistent models (disturbances + nonlinear behavior)
- A **stabilizing PI** was tuned via **exhaustive search**
- With the process stabilized, **closed-loop identification** yielded a consistent low-noise model
- A **final PI** was designed and validated experimentally

## 🎯 Engineering Challenges
- Noisy measurements
- Nonlinear biological dynamics
- Parameter drift over long experiments
- Open-loop models not consistent
- Slow process dynamics (long time constants)

## 🛠 Methodology
### 1️⃣ Open-loop identification (OL)
Step-response experiments and linear model estimation  
→ inconsistent parameters due to disturbances / drift

### 2️⃣ Stabilizing PI (robust-first strategy)
PI tuned via exhaustive search for safe and smooth regulation  
→ enables plant-friendly operation and clean data capture

### 3️⃣ Closed-loop identification (CL)
Identification with the plant stabilized  
→ improved SNR and consistent model estimate

### 4️⃣ Final PI design + validation
Refined PI designed using the CL model  
→ reduced overshoot and improved VTO stability

## 📊 Results (experimental)
| Metric | Initial PI | Final PI |
|--------|-----------:|---------:|
| Overshoot | 33% | **7.5%** |
| Settling time | 210 s | 288 s |
| VTO stabilization | ~20 min | **~10 min** |
| Model fit (closed-loop) | – | **≈ 95%** |


## 🧠 Skills Demonstrated
- System identification (open & closed loop)
- PI controller design and tuning
- Robust control under uncertainty
- Experimental validation
- MATLAB (System Identification / Control)
- Industrial commissioning workflow
- HMI/SCADA integration (LabVIEW)


## 📚 Related Publication
This project resulted in a peer-reviewed publication (link only; paper not redistributed here):

- **Castro et al.**, *Automatic Control for the Production of Alginate by Azotobacter Vinelandii*, IEEE.  
 [IEEExplore](https://ieeexplore.ieee.org/document/8905995) 


## ⚠️ Disclaimer

This repository is shared as a **portfolio-style case study** derived from a real pilot-scale control project.

- Sensitive, proprietary, or identifying information has been removed or anonymized.
- If any dataset is included, it should be **sanitized** or **synthetic**.
- The repository demonstrates the engineering workflow:
  open-loop identification issues → stabilizing PI tuning → closed-loop identification → final PI design.

No confidential plant data or proprietary software is distributed.


## 🤝 Support Projects

Support my work on Patreon:  
https://www.patreon.com/c/CrissCCL


## 📜 License

MIT License
