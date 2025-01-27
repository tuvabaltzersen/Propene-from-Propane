# 🔥 Propane to Propylene: Process Optimization and Economic Analysis

## 📌 Overview

Welcome to this repository! This was originally a group-project from a course in process chemistry but I thought it was a intresting subject and wanted to analyze our work a bit futher and present it here. The original project is much longer and includes more heavy math and coding but here I would like to focus on the softer parts and try to go into depth a bit more. Hopefully this will give us a good understanding on how designing a process-system works and what parameters to look out for. 

The goal with the system is to **converse propane to propylene** with a target output of **25,000 tons of propylene per year**. We explore the **chemical kinetics**, **thermodynamics**, and **economic feasibility** of the process while optimizing **reactors, heat exchangers, separation units, and overall plant efficiency**. The repository contains **Matlab** code to calculate values and optimize. 


## 🧪 The Chemistry Behind It
The chemistry behind the process is not complex and it will here be assumed that we have a basic knowledge of chemistry and therefore understands what is presented below without futher explanations. 
The core reaction driving the process is the **dehydrogenation of propane**:

$$
\text{C}_3\text{H}_8 \rightleftharpoons \text{C}_3\text{H}_6 + \text{H}_2
$$

This is an **endothermic reaction**, meaning it requires heat to happen correctly. The equilibrium conversion depends on **temperature, pressure, and reactor design**. The goal is to **maximize propylene yield** while minimizing costs and energy consumption.

## 🚀 The Process Flow
This is the big challange in the project. To come up with the set-up that is presented here we have to go back and forth comparing different designs and the outcome they give. This is the most time-consuming part of the project but also the most important. It is also here we have to decide what key-factors we would like to focus on. We want it to produce a certain amount every year but we can choose to do that in a environmentally friendly way which may cost more or we can do it in a less costly way. The design that that was choosen is showcased below. 

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

### **4️⃣ Cost Analysis: What Does It Cost?**
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

### ⚖️ **Discussion**
To design a process-system is an important skill of a chemical-engineer. Here we have observed that it is not as simply as one might think. To optimise every step of the process and weight them against each-other is not an easy task. To decide what is important for the project is a great way to start. As a future engineer the environment should be a big priority. Your employer will probobly have the cost as a key-factor. Here it is our job as engineers to be able to combine these two factors without sacrifice either. 

To show the complexity of weighting factors against one another we will discuss the impact of material choices. Let's take the heat exchangers as an exemple: we can choose to make them in a material that is costly but the material is made in a way that has little impact on the environment. So it is good maaterial from the environmental prospective but not a great one from the economical prospective. With futher inspection we realises that the material is not good at keeping the energy so it lets out a lot of it. This means that we will have to spend more energy on keeping the heat-exchanger at the right temperature which will cost us more money and is not good for the environment. Its large need of energy and the big cost of both investing and running makes this material a no go. We will have to continue weighting like this until we find a material that has both a low environmental effect and cost. We could aslo try to compensate the big energy-need with a good energy-source sush as solar-energy but theese those sometimes cost more then "dirty" energy. 

Another challenge is to make a system that meets the demand. Here we want a large production with a high conversion percentage which puts pressuare on the the design-team. To solve the problem here we did three reactors in a series but this does have to be the right solution for every chemical reaction. In this step is it important the analyze the properties of the reaction and investigate how the different design choices effect the conversion. The level of purity of the product is also something that that will effect the design. What method to use depends on the characteristics of the reaction, reagent and product. The level of purity decides how many times the seperation-process needs to be repeated. All of these steps costs money and once again we need to weight the factors and find a good middle ground. 



## 🔧 MATLAB Implementation
The codes given in this repository is not the whole code for the design we did but the fundamental parts to create a system like that. 
- Sorel's method
- Find the bubblepoint for a mixture
- profit for heat exchangers
- 

