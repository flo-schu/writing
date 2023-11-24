  
## Short Abstract
The productivity of the chemical industry and release of novel substances into environment warrants a predictive risk assessment across-substances that relies on extrapolation from simple experiments.
Immense knowledge about cellular processes is available [@Yosef.2011], Howe.2013,  (*other more general gene expression literature*).
However, making quantiative predictions is still difficult, because models are not capable of integrating dynamic 'omics data and the availability of temporally resolved data are limited
This work tries to overcome this by developing a mechanistic model of ZFE gene-expression after toxicant exposure, which serves as a proxy for toxicodynamic damage in established TKTD models
In the cellular stress response to chemical exposure, NRF2 has been identified as a master regulator of the detoxification process.
In this work we propose a dynamic TKTD model, which describes the key processes in the NRF2 signalling pathway and links the gene expression level of NRF2 to lethality.
We fit the model on time series of internal concentrations, NRF2 gene-expression and lethality observed in ZFE exposed to **Diuron, Diclofenac and Naproxen**
We were able to mechanistically model successful and unsuccessful detoxification dependent on the toxicant concentration **and type**
The work shows that NRF2 as a master regulator can serve as a proxy for lethality after exposure to different substances. And, more importantly, that it is possible to integrate OMICS data into established TKTD for quantitiative prediction of toxicity **across compounds**.
## Extended Abstract
### Introduction
The productivity of the chemical industry and release of novel substances into environment warrants a predictive risk assessment across-substances that relies on extrapolation from simple experiments.
Demand for better models particular interest in the integration of OMICS [@EuropeanFoodSafetyAuthority.2021, @Aguilera.2018, @Cote.2016]
Cross substance extrapolation can be unlocked by mechanistically understanding the cellular processes that lead to damage induced after toxicant exposure (Ankley, Murphey), Cross species (?) Spurgeon
Immense knowledge about cellular processes is available [@Yosef.2011], Howe.2013,  (*other more general gene expression literature*).
However, making quantiative predictions is still difficult, because models are not capable of integrating dynamic 'omics data and the availability of temporally resolved data are limited
However, [@Stevenson.2023, @Cerdergreen.2017] showed that TKTD models are able to integrate molecular data into TKTD models
But, dynamic data have not been used so far
And to my knowledge no dynamic model has so far been described to mechanistically model the response of omics data in ZFE after exposure to toxicants and fit such a model on emprical data
This work tries to overcome this by developing a mechanistic model of ZFE gene-expression after toxicant exposure, which serves as a proxy for toxicodynamic damage in established TKTD models
### Theory
In the cellular stress response to chemical exposure, NRF2 has been identified as a master regulator of the detoxification process.
The signalling pathway of NRF2 has been extensively described [@Kobayashi.2004, @Zhao.2006, @He.2020, @Li.2019, @Raghunath.2018],
NRF2 activation is tightly linked to oxidative ([KEAP1] pathway) and chemical stress ([AhR] pathway)) in organisms.
On activation, NRF2 transcription factor dissociate into the nucleus and activate [ARE] genes, which are associated with stress repair and detoxification.
Thus, explicitly modelling the, NRF2 expression state
### Model
In this work we propose a dynamic TKTD model, which describes the key processes in the NRF2 signalling pathway and links the gene expression level of NRF2 to lethality.
We fit the model on time series of internal concentrations, NRF2 gene-expression and lethality observed in ZFE exposed to **Diuron, Diclofenac and Naproxen**
### Results
We were able to mechanistically model successful and unsuccessful detoxification dependent on the toxicant concentration **and type**
![image.png](../assets/image_1700745859498_0.png)
![image.png](../assets/image_1700746668433_0.png)
NRF2-expression turns out to be a good predictor of lethality for the chemicals naproxen and diuron. In contrast to existing models, pulse like expression in combination with a threshold model for survival can also capture the "step-like" time dynamic of observed mortality in ZFE.
NRF2-expression was no good predictor for lethality after diclofenac exposure. The reason is that diclofenac induces an early and a late expression pulse, why can be connected to different activation pathways.
By circumventing internal concentrations as a predictor for lethality, substances have highly similar threshold $$z$$ and killing rate $$k_k$$ parameters, which opens the door for cross-substance extrapolation.
The work shows that NRF2 as a master regulator can serve as a proxy for lethality after exposure to different substances. And, more importantly, that it is possible to integrate OMICS data into established TKTD for quantitiative prediction of toxicity **across compounds**.
