# Hypothesis Testing On SAS 

Hypothesis testing in the context of multivariate data is more complex then in ordinary univariate case. The number of parameters may be staggering and in statistics is vital to be able to make solid inference about a population, to test our inference we use a method know as hypothesis testing. In hypothesis testing, we use our sample statisitcs to support or discredit a prior hypothesis, or speculation, about the true value of the population parameter.  

************
![image](https://user-images.githubusercontent.com/45861503/76158013-001e5380-60c6-11ea-8fbb-6ac8f12a7b6a.png)![image](https://user-images.githubusercontent.com/45861503/76158081-c0a43700-60c6-11ea-9e09-866a0caa2701.png)

<br/>
<br/>

<img src="https://render.githubusercontent.com/render/math?math=

$$\mathbf{Y} = \left[\begin{array}
{rrr}
3 & 10 \\
6 & 12  \\
5 & 14  \\
10 & 9 
\end{array}\right] $$ 

$$ \text{Test } H_0: \mu'= (6,11)$$>

With this sample data of population mean vectors, we tasked with the question "Wheter or not our sample mean vector equate to the true population mean?". In order to answer this question we need to measure the distance between our true population mean and our averaged vector means. Then we must determined if the distance between the sample mean and the population mean is far. Now the quest becomes, how far is far? In order to determine this we perform a hypothesis test. Our null hypothesis is that there is no statistical significance between our averaged mean vector and our population mean. Alternatievly we pose an alternative hypothesis that claims that there is indeed atleast one statistically significant relationship between the averaged mean vector and our true population mean. 

```math
$$ H_0:  \mu' = (6,11) $$
$$ H_1: \mu'  ≠ (6,11) $$
```

The hypothesis testing tool that we will use to test if there is a statistical signifiance is the Hottelings $\ T^2 \text{-test}$ which measures if the distance is statistically significant and comes from a hottelings $\ T^2$ distribution with degrees of freedom equal to (n-1). If our sample mean vectors proves to not be far from the population mean then we will accept the null hypothesis. Given the case that $\ T^2 \ge T^2_{a,p,n-1}$, we will then reject our null hypothesis because its greater than or equal to our t-criticial value. 

```math
$$T^2 = n (\bar{y} - mu_0)'S^-1(\bar{y}-mu_0)$$
```

**According to our SAS computation found below. We accept the null hypothesis becasue our $\ T^2 \text{ value of 0.61}$ is smaller than our t-critical value of $\ T^2_{0.05,2,4} = 25.472$. Which concludes that our sample mean vector is an unbiased estimator of our population mean vector. Thus implying that the computed difference between the sample mean vector is not statisitcally significant.** 


*****

