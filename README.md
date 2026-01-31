# 🧪⚙️ Closed-Loop Identification & PI Control  
## Oxygen Transfer Rate (VTO) — Industrial Process Control Case Study

---

## 📖 Overview
This repository documents a **practical industrial workflow** for **system identification and PI control**
applied to a **pilot-scale biochemical process**, where oxygen dynamics directly impact the **Oxygen Transfer Rate (VTO)**.

Instead of forcing a single theoretical model, the controller was engineered using robust commissioning steps:
- Open-loop identification (inconsistent models under disturbances / nonlinearities)
- Stabilizing PI tuning via exhaustive search
- Closed-loop identification with the plant stabilized
- Final PI refinement and experimental validation

## 📂 Content
- `matlab/` → identification + PI tuning scripts


## 🏭 Experimental Setup (Pilot Plant)

<table align="center">
  <tr>
    <td align="center">
      <img alt="Experimental Setup - Photo 1"
           src="https://github.com/user-attachments/assets/02acd3c3-50b7-4b46-a6ba-3499929461fc"
           width="300">
    </td>
    <td align="center">
      <img alt="Experimental Setup - Photo 2"
           src="https://github.com/user-attachments/assets/dda5f5d8-98d0-4261-b384-82c357023dc4"
           width="450">
    </td>
  </tr>
</table>

## 🔧 System Architecture & Control Loop

<table align="center">
  <tr>
    <td align="center">
      <img alt="System Architecture"
           src="https://github.com/user-attachments/assets/b234a6c8-6c1f-448c-9c28-111485143da5"
           width="250">
    </td>
    <td align="center">
      <img alt="Closed-Loop Control Block Diagram"
           src="https://github.com/user-attachments/assets/58d6d27b-4262-4d46-a56c-e4c57da95afd"
           width="600">
    </td>
  </tr>
</table>

## 🎯 Engineering Challenges
- Noisy measurements  
- Nonlinear biological dynamics  
- Parameter drift over long experiments  
- Inconsistent open-loop models  
- Slow process dynamics  


## 🛠 Methodology

### 1️⃣ Open-loop identification (OL)
Step-response experiments and linear model estimation  
→ inconsistent parameters due to disturbances / drift

<p align="center">
  <img alt="Open loop identification" src="https://github.com/user-attachments/assets/60b10e27-f751-4fac-8049-6bbd12661fe0" width="550">
</p>

---

### 2️⃣ Stabilizing PI (robust-first strategy)
PI tuned for disturbance rejection
→ safe regulation and plant-friendly behavior (clean data capture)
As shown, at 30.62 hours the system is disturbed due to the change in silica, which is responsible for drying the air. The system stabilizes at approximately 30.7 hours, considering a 2% tolerance, which implies that the system reaches a steady state in approximately 280 seconds, corresponding to the apparent settling time.

<table align="center">
  <tr>
    <td align="center">
      <img lt="Disturabance rejection"
           src="https://github.com/user-attachments/assets/f1a91a3f-1270-4a5b-8e8f-913b8e6ee9df"
           width="550">
    </td>
    <td align="center">
      <img alt="Disturabance rejection zoom"
           src="https://github.com/user-attachments/assets/de49aa52-9f62-4b3a-bd31-7227cd918ddc"
           width="550">
    </td>
  </tr>
</table>


---

### 3️⃣ Closed-loop identification (CL)
Identification performed with the process stabilized  
→ improved SNR and consistent model estimate

<p align="center">
  <img alt="Closed Loop identification" src="https://github.com/user-attachments/assets/4e6a0499-229b-49f7-935b-5e4aa87bdd07" width="550">
</p>
---

### 4️⃣ Final PI design + validation
Refined PI designed using the CL model  
→ reduced overshoot and improved VTO stability

---

## 📊 Results (experimental)

| Metric | Initial PI | Final PI |
|--------|-----------:|---------:|
| Overshoot | 33% | **7.5%** |
| Settling time | 210 s | 288 s |
| VTO stabilization | ~20 min | **~10 min** |
| Model fit (closed-loop) | – | **≈ 95%** |

<table align="center">
  <tr>
    <td align="center">
      <img alt="Initial PI"
           src="https://github.com/user-attachments/assets/3e1c0d56-78c7-4a8e-a7a6-f63e982623fb"
           width="520">
    </td>
    <td align="center">
      <img alt="Final PI"
           src="https://github.com/user-attachments/assets/3e1c0d56-78c7-4a8e-a7a6-f63e982623fb"
           width="520">
    </td>
  </tr>
</table>

---

## 🧠 Skills Demonstrated
- System identification (open & closed loop)
- PI controller design and tuning
- Robust control under uncertainty
- Experimental validation
- MATLAB (System Identification / Control)
- Industrial commissioning workflow
- HMI/SCADA integration (LabVIEW)

---


---

## 📚 Related Publication
This project resulted in a peer-reviewed publication (link only; paper not redistributed here):

- **Castro et al.**, *Automatic Control for the Production of Alginate by Azotobacter Vinelandii*, IEEE.  
  https://ieeexplore.ieee.org/document/8905995


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
