# 🧪⚙️ Closed-Loop Identification & PI Control  
## Oxygen Transfer Rate (VTO) — Industrial Process Control Case Study

## 📖 Overview
This project documents the **modeling, system identification, and PI control implementation**
of a **pilot-scale biochemical production process**, where oxygen dynamics directly impact
the Oxygen Transfer Rate (VTO).

The work follows a **practical industrial workflow**, not a purely academic approach:

- Open-loop identification showed inconsistent models due to disturbances and nonlinear behavior
- A stabilizing PI controller was tuned via exhaustive search
- The process was operated in closed-loop
- Closed-loop identification produced a consistent low-noise model
- A refined PI controller was designed and experimentally validated

This approach mirrors **real commissioning practice in industrial plants**.

---

## 🎯 Engineering Challenges
- Noisy measurements  
- Nonlinear biological dynamics  
- Parameter drift during long experiments  
- Open-loop models not consistent  

---

## 🛠 Methodology

### 1️⃣ Open-loop identification
Step experiments and linear model estimation  
→ inconsistent parameters between tests

### 2️⃣ Stabilizing PI (robust control first)
Simple PI tuned for safe and smooth regulation

### 3️⃣ Closed-loop identification
Identification performed with the process stabilized  
→ reduced disturbances and improved model consistency

### 4️⃣ Final PI design
Controller redesigned using the refined model  
→ improved overshoot and faster VTO stabilization

---

## 📊 Results (experimental)

| Metric | Initial PI | Final PI |
|--------|-----------|-----------|
| Overshoot | 33% | **7.5%** |
| Settling time | 210 s | 288 s |
| VTO stabilization | ~20 min | **~10 min** |
| Model fit (CL) | – | **≈ 95%** |

---

## 🧠 Skills Demonstrated
- System identification (OL & CL)
- Robust PI design
- Process control engineering
- Experimental validation
- MATLAB Control Toolbox
- Industrial commissioning workflow
- HMI/SCADA integration (LabVIEW)

---

## 📂 Repository Structure

