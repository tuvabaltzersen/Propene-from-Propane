# 🔥 Propane to Propylene: Process Optimization and Economic Analysis

## 📌 Overview
This repository contains MATLAB code and a detailed chemical engineering study on the **conversion of propane to propylene**. The project focuses on designing and optimizing an **industrial-scale** production process with a target output of **25,000 tons of propylene per year**. 

We explore the **chemical kinetics**, **thermodynamics**, and **economic feasibility** of the process while optimizing **reactors, heat exchangers, separation units, and overall plant efficiency**.

## 🧪 The Chemistry Behind It
The core reaction driving the process is the **dehydrogenation of propane**:

$$
\text{C}_3\text{H}_8 \rightleftharpoons \text{C}_3\text{H}_6 + \text{H}_2
$$

This is an **endothermic reaction**, meaning it **requires heat** to proceed efficiently. The equilibrium conversion depends on **temperature, pressure, and reactor design**. The goal is to **maximize propylene yield** while minimizing costs and energy consumption.

## 🚀 The Process Flow
The process is broken down into several key steps:

### **1️⃣ Reactors: The Heart of the Process**
- Three **packed bed reactors (PFRs)** in **series**, each designed for optimal conversion.
- **Catalyst choice** and **temperature control** are critical.
- **Reaction kinetics** solved using **ODE solvers** in MATLAB.

📈 **Key mathematical model:**
The design follows the **ideal plug flow reactor model**:

$$
\frac{dX}{dW} = \frac{r_A}{F_A}
$$

where:
- \(X\) = conversion of propane,
- \(W\) = catalyst mass,
- \(r_A\) = reaction rate,
- \(F_A\) = molar flow rate of propane.

👉 **Optimization challenge:** Achieving **85% conversion** over three reactors while balancing energy requirements.

### **2️⃣ Heat Exchangers: Managing Energy Efficiently**
- **Six heat exchangers** in **series** cool and preheat streams efficiently.
- **Energy recovery** from reactor effluent to reduce fuel consumption.
- Heat transfer modeled using:

$$
q = U A \Delta T_{lm}
$$

where:
- \( q \) = heat duty,
- \( U \) = overall heat transfer coefficient,
- \( A \) = heat exchanger area,
- $\Delta T_{lm}$ = log mean temperature difference.

🔥 **Opportunity:** Waste heat recovery could significantly **lower energy costs**!

### **3️⃣ Separation Units: Purifying the Product**
To achieve **high-purity propylene**, we use:
- **Two flash drums** (removing H₂ and H₂O).
- **A large distillation column** with **91 trays** to separate propane and propylene.

📊 **Mathematical approach:**
Separation efficiency modeled using **Sorel’s method** and **McCabe-Thiele analysis**:

$$
\alpha = \frac{y_1 / x_1}{y_2 / x_2}
$$

where \( \alpha \) is the relative volatility, crucial for **optimizing column efficiency**.

### **4️⃣ Cost Analysis: What Does It Take?**
Building and operating this plant is **not cheap**. Here’s a breakdown:

💰 **Investment Cost:**
- **Total plant investment**: **217 million SEK**
- **Reactor cost**: **66069 USD**
- **Distillation column**: **2.36 million USD**

⚡ **Annual Operational Costs:**
- **Energy cost (heat exchangers & furnaces):** **~80 million SEK per year**
- **Total 10-year operating cost:** **~1.01 billion SEK**

📈 **Key insights:**
- The **biggest cost drivers** are **heating and separation**.
- Energy integration (e.g., using recovered heat) could **reduce costs** significantly.

---

## 📊 Results and Figures
### **Reaction Performance**
- **85% propane conversion** achieved using three reactors.
- **Temperature control** was crucial due to the endothermic nature.

![Reaction Conversion](path_to_reactor_conversion_plot.png)

### **Distillation Separation**
- **91 trays** required for **99% purity** of propylene.
- Optimization based on **minimum reflux ratio** to balance **cost and efficiency**.

![Distillation Profile](path_to_distillation_plot.png)

---

## 🔧 MATLAB Implementation
All **MATLAB scripts** are included in this repository, covering:
✔ **Reactor design** (`reactor_model.m`)  
✔ **Heat exchanger calculations** (`heat_exchange.m`)  
✔ **Flash separation** (`flash_calcs.m`)  
✔ **Distillation design** (`distillation_model.m`)  
✔ **Economic analysis** (`cost_analysis.m`)  

👉 **How to run the code:**
1. Clone the repository:  
