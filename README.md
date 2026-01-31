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
           width="450">
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
           width="520">
    </td>
    <td align="center">
      <img alt="Closed-Loop Control Block Diagram"
           src="https://github.com/user-attachments/assets/58d6d27b-4262-4d46-a56c-e4c57da95afd"
           width="520">
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

> ✅ Place plot at: `docs/open_loop_identification.png` (Fig 1.3 OR Fig 1.4)

![Open-loop identification](docs/open_loop_identification.png)

---

### 2️⃣ Stabilizing PI (robust-first strategy)
PI tuned via exhaustive search  
→ safe regulation and plant-friendly behavior (clean data capture)

---

### 3️⃣ Closed-loop identification (CL)
Identification performed with the process stabilized  
→ improved SNR and consistent model estimate

> ✅ Place plot at: `docs/closed_loop_identification.png` (Fig 3.2)

![Closed-loop identification](docs/closed_loop_identification.png)

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
