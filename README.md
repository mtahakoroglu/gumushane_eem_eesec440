# EESEC 440 English for EEE on DL
## I. Artificial Neural Networks
Artificial neural networks (ANN) are powerful tools used for building complex nonlinear mathematical relationship between input-output data. The increment in computational power provided by the new generation Graphical Processing Units (GPU) in the last decade enabled ANN to solve many engineering problems in various fields of study (e.g., Computer Vision, speech recognition, Natural Language Processing, power transfer [1], etc). There are different flavors of ANN designed for different applications depending on the needs. Multi-layer Perceptron (MLP) is one of the most preferred type of network commonly employed in regression and classification problems, which are two major functions of a ANN.
### A. Multi-layer Perceptron
We will look at MLP doing regression and classification, both supervised learning. Please see Fig. 1 for an example MLP network.

<img src="https://www.researchgate.net/profile/Mohamed-Zahran-16/publication/303875065/figure/fig4/AS:371118507610123@1465492955561/A-hypothetical-example-of-Multilayer-Perceptron-Network.png" alt="A multiple input single output MLP." height="240"/>

*Fig. 1: A multi input single output MLP.*

#### Exclusive OR (XOR) Problem
<img src="figure/xor_problem_smaller.jpg" alt="MLP network is going to learn XOR problem." height="200"/>

*Fig. 2:* MLP network is going to learn XOR problem.

<img src="figure/xor_MLP.jpg" alt="For the XOR problem, we use a MLP with one hidden layer consisting of sixteen neurons." height="360"/>

*Fig. 3:* For the XOR problem, we use a MLP with one hidden layer consisting of sixteen neurons.

<img src="figure/ANN_MLP_flow_chart.jpg" alt="Error back-propogation algorithm is used to update the network parameters." height="360"/>

*Fig. 4:* Error back-propogation algorithm is used to update the network parameters.

### B. Convolutional Neural Network (CNN)
In weeks X-Y-Z, we will look at a classification example on images. Cats-dogs image repository on Kaggle. We will follow the tutorial given in [2]. Please see Figures 5 and 6 for classification of cat and dog images via CNN. 

<img src="figure/cats_dogs_cnn.png" alt="Cats and dogs classification via CNN." height="240"/>

*Fig. 5: Classification of cat & dog images via CNN.*

<img src="figure/cats_dogs_classification.gif" alt="Cats and dogs classification with deep learning." height="240"/>

*Fig. 6: Cats and dogs classification with deep learning.*


## References
[1] T. Guillod, P. Papamanolis and J. W. Kolar, "Artificial Neural Network (ANN) Based Fast and Accurate Inductor Modeling and Design," in IEEE Open Journal of Power Electronics, vol. 1, pp. 284-299, 2020, doi: 10.1109/OJPEL.2020.3012777.</br>
[2] "How to classify photos of dogs and cats (with 97% accuracy)." https://machinelearningmastery.com/how-to-develop-a-convolutional-neural-network-to-classify-photos-of-dogs-and-cats/. Accessed: 2021-3-10.</br>
