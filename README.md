# 🧪⚙️ Closed-Loop Identification & PI Control  

## Oxygen Transfer Rate (VTO) — Industrial Process Control Case Study

## 📖 Overview
This project presents an **industrial-style commissioning workflow** for system identification and PI control
applied to a **pilot-scale biochemical process**.

Instead of relying on purely theoretical models, the controller was developed directly from **plant tests and field data**.

The work followed a practical engineering sequence:

- Plant step tests and open-loop identification
- Stabilizing PI tuning to ensure safe operation
- Closed-loop data collection under real disturbances
- Final controller refinement and on-plant validation

This approach reflects **real industrial control practice**, where robustness and operability are prioritized over ideal models.

## 👤 My Role & Responsibilities

This project was developed collaboratively with a biochemical engineering team.

My responsibility focused specifically on the **instrumentation, modeling, and control engineering aspects**, including:

- Process instrumentation and signal acquisition
- Dynamic characterization of the oxygen transfer process
- System identification (open-loop and closed-loop)
- PI controller design and tuning
- Disturbance rejection strategy
- Experimental validation and commissioning
- Integration with the supervisory HMI (LabVIEW)

All biochemical operation and process chemistry tasks were handled by the bioengineering team.


## 📂 Content
- `matlab/` → identification + PI tuning scripts

---

# 🏭 Experimental Setup (Pilot Plant)

Real pilot-plant installation used during identification and controller validation.

<table align="center">
  <tr>
    <td align="center">
      <img alt="Experimental Setup - Photo 1"
           src="https://github.com/user-attachments/assets/02acd3c3-50b7-4b46-a6ba-3499929461fc"
           width="400">
    </td>
    <td align="center">
      <img alt="Experimental Setup - Photo 2"
           src="https://github.com/user-attachments/assets/dda5f5d8-98d0-4261-b384-82c357023dc4"
           width="420">
    </td>
  </tr>
</table>



# 🔧 System Architecture & Control Loop

High-level supervisory architecture and closed-loop control structure.

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
           width="500">
    </td>
  </tr>
</table>


# 🛠 Methodology

## 1️⃣ Open-loop identification (OL)

Step tests were executed directly on the pilot plant to obtain an initial dynamic characterization of the oxygen process.

However, different tests produced **significantly different models**, revealing:

- sensitivity to disturbances  
- nonlinear behavior  
- poor repeatability  

These results indicated that **open-loop tuning was not reliable for this process**.


<p align="center">
  <img alt="Open loop identification"
       src="https://github.com/user-attachments/assets/60b10e27-f751-4fac-8049-6bbd12661fe0"
       width="550">
</p>


## 2️⃣ Stabilizing PI (robust-first strategy)

Before pursuing accurate modeling, a conservative PI controller was tuned to:

- guarantee stable operation  
- protect the process  
- reject disturbances  
- enable clean measurements  

The goal was **operability first, modeling second**, following standard commissioning practice.

During operation, a disturbance was intentionally introduced (air drying silica replacement).  
The controller recovered the process within ~280 s (2% criterion), demonstrating adequate robustness for closed-loop testing.



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



## 3️⃣ Closed-loop identification (CL)

With the process stabilized, identification was repeated under closed-loop operation.

This provided:

- improved signal-to-noise ratio  
- reduced disturbance impact  
- consistent parameter estimates  
- a more realistic plant model  

Closed-loop data proved significantly more reliable for controller design than open-loop experiments.


<p align="center">
  <img alt="Closed Loop identification"
       src="https://github.com/user-attachments/assets/4e6a0499-229b-49f7-935b-5e4aa87bdd07"
       width="550">
</p>



## 4️⃣ Final PI design + validation

Using the refined model, the PI controller was re-tuned and validated directly on the plant.

The final tuning achieved:

- lower overshoot  
- improved disturbance rejection  
- faster stabilization of VTO  
- smoother operation for operators  

Performance was confirmed through repeated on-plant tests.



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
           src="https://github.com/user-attachments/assets/3e1c0d56-78c7-4a8e-a7a6-f63e982623fb"
           width="520">
    </td>
    <td align="center">
      <img alt="Final PI response"
           src="https://github.com/user-attachments/assets/3e1c0d56-78c7-4a8e-a7a6-f63e982623fb"
           width="520">
    </td>
  </tr>
</table>

## 🧠 Skills Demonstrated
- Industrial instrumentation
- Process data acquisition
- Dynamic modeling
- System identification (OL/CL)
- Practical PI tuning
- Disturbance rejection design
- Control system commissioning
- MATLAB & LabVIEW integration



# 📚 Related Publication
Castro et al., *Automatic Control for the Production of Alginate by Azotobacter Vinelandii*, IEEE  
https://ieeexplore.ieee.org/document/8905995




## 🔒 Data availability
Real experimental data is not included due to confidentiality and collaborative research constraints.
The repository provides a fully reproducible workflow; to run it, place your local `dataOX.mat`
containing `o_in` and `o_out` in the project root (ignored by git).

## ⚠️ Disclaimer
This repository is a portfolio-style case study focused on modeling, identification, and control.
All sensitive or proprietary information has been removed. No plant/HMI software or confidential datasets are distributed.


## 🤝 Support Projects

Support my work on Patreon:  
https://www.patreon.com/c/CrissCCL


## 📜 License

MIT License
