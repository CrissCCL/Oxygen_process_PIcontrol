# 🧪⚙️ Closed-Loop Identification & PI Control  
## Oxygen Transfer Rate (VTO) — Industrial Process Control Case Study

---

## 📖 Overview
This repository documents a **practical industrial workflow** for **system identification and PI control**
applied to a **pilot-scale biochemical process**, where oxygen dynamics directly impact the **Oxygen Transfer Rate (VTO)**.

Instead of forcing a purely theoretical model, the controller was engineered using **real commissioning steps**:

- Open-loop identification (inconsistent models under disturbances / nonlinearities)
- Stabilizing PI tuning via exhaustive search
- Closed-loop identification with the plant stabilized
- Final PI refinement and experimental validation

---

## 📂 Content
- `matlab/` → identification + PI tuning scripts

---

# 🏭 Experimental Setup (Pilot Plant)

<table align="center">
  <tr>
    <td align="center">
      <img alt="Experimental Setup - Photo 1"
           src="https://github.com/user-attachments/assets/02acd3c3-50b7-4b46-a6ba-3499929461fc"
           width="420">
    </td>
    <td align="center">
      <img alt="Experimental Setup - Photo 2"
           src="https://github.com/user-attachments/assets/dda5f5d8-98d0-4261-b384-82c357023dc4"
           width="420">
    </td>
  </tr>
</table>

---

# 🔧 System Architecture & Control Loop

<table align="center">
  <tr>
    <td align="center">
      <img alt="System Architecture"
           src="https://github.com/user-attachments/assets/b234a6c8-6c1f-448c-9c28-111485143da5"
           width="500">
    </td>
    <td align="center">
      <img alt="Closed-Loop Control Block Diagram"
           src="https://github.com/user-attachments/assets/58d6d27b-4262-4d46-a56c-e4c57da95afd"
           width="500">
    </td>
  </tr>
</table>

---

# 🛠 Methodology

## 1️⃣ Open-loop identification (OL)
Step-response experiments and linear model estimation  
→ inconsistent parameters due to disturbances / drift

<p align="center">
  <img alt="Open loop identification"
       src="https://github.com/user-attachments/assets/60b10e27-f751-4fac-8049-6bbd12661fe0"
       width="550">
</p>

---

## 2️⃣ Stabilizing PI (robust-first strategy)
PI tuned for disturbance rejection and safe regulation.

<table align="center">
  <tr>
    <td align="center">
      <img alt="Disturbance rejection"
           src="https://github.com/user-attachments/assets/f1a91a3f-1270-4a5b-8e8f-913b8e6ee9df"
           width="520">
    </td>
    <td align="center">
      <img alt="Disturbance rejection zoom"
           src="https://github.com/user-attachments/assets/de49aa52-9f62-4b3a-bd31-7227cd918ddc"
           width="520">
    </td>
  </tr>
</table>

---

## 3️⃣ Closed-loop identification (CL)
Identification performed with the process stabilized  
→ improved SNR and consistent model estimate

<p align="center">
  <img alt="Closed Loop identification"
       src="https://github.com/user-attachments/assets/4e6a0499-229b-49f7-935b-5e4aa87bdd07"
       width="550">
</p>

---

## 4️⃣ Final PI design + validation
Refined PI designed using the CL model  
→ reduced overshoot and improved VTO stability

---

# 📊 Results (experimental)

| Metric | Initial PI | Final PI |
|--------|-----------:|---------:|
| Overshoot | 33% | **7.5%** |
| Settling time | 210 s | 288 s |
| VTO stabilization | ~20 min | **~10 min** |
| Model fit (closed-loop) | – | **≈ 95%** |

<table align="center">
  <tr>
    <td align="center">
      <img alt="Initial PI response"
           src="INITIAL_PI_IMAGE_URL"
           width="520">
    </td>
    <td align="center">
      <img alt="Final PI response"
           src="FINAL_PI_IMAGE_URL"
           width="520">
    </td>
  </tr>
</table>

---

# 🧠 Skills Demonstrated
- System identification (open & closed loop)
- PI controller design and tuning
- Robust control under uncertainty
- Experimental validation
- MATLAB (System Identification / Control)
- Industrial commissioning workflow
- HMI/SCADA integration (LabVIEW)

---

# 📚 Related Publication
Castro et al., *Automatic Control for the Production of Alginate by Azotobacter Vinelandii*, IEEE  
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
