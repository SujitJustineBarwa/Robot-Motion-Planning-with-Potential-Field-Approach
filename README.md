# Robot-Motion-Planning-with-Potential-Field-Approach
  The Motion Planing in 2D space is done using potential field approach.
  Special Thanks : Atul Thakur Sir(From IIT Patna)

  The Approach taken:
  
	1.The Brushfire algorithm divides the picture into n*n pixels and assigns each pixel a value according to its distance from the wall or obstacle.
	  The Attractive Potential Function are made as :
<p align="center">
  <img src="https://raw.githubusercontent.com/SujitJustineBarwa/Robot-Motion-Planning-with-Potential-Field-Approach/main/Images/img1.PNG" />
</p>
 
The norm function is used to find the d(q,q_goal) i.e the euclidean distance.
The ζ is a tunable parameter and curently its set to 2.

	2.The Repulsive Potential Function are made as : 
<p align="center">
  <img src="https://raw.githubusercontent.com/SujitJustineBarwa/Robot-Motion-Planning-with-Potential-Field-Approach/main/Images/img2.PNG" />
</p>

The Dq parameter is expected to state the distance from the obstacle so it is assigned equal to the value of the world matrix which was made from the brushfire algorithm.
And for ∇Dq is the taken from the gradient of the world matrix.


	3.The repulsive and additive gradient and potential are then added :

<p align="center">
  <img src="https://raw.githubusercontent.com/SujitJustineBarwa/Robot-Motion-Planning-with-Potential-Field-Approach/main/Images/img3.PNG" />
</p>

	4.Q_start is defined.
<p align="center">
  <img src="https://raw.githubusercontent.com/SujitJustineBarwa/Robot-Motion-Planning-with-Potential-Field-Approach/main/Images/img4.PNG" />
</p>

Here, p stores all the q points and hence is further used to plot the path.

	5.The Quiver function is used the plot the gradient. And along with the path (p) is also plotted.


**List of all the tuneable parameters:**
<table>
<tbody>
<tr>
<td width="399">
<p>1</p>
</td>
<td width="399">&nbsp;d*</td>
</tr>
<tr>
<td width="399">
<p>2</p>
</td>
<td width="399">&nbsp;Q*</td>
</tr>
<tr>
<td width="399">
<p>3</p>
</td>
<td width="399">&nbsp;ζ</td>
</tr>
<tr>
<td width="399">
<p>4</p>
</td>
<td width="399">&nbsp;η</td>
</tr>
<tr>
<td width="399">
<p>5</p>
</td>
<td width="399">&nbsp;ϵ</td>
</tr>
<tr>
<td width="399">
<p>6</p>
</td>
<td width="399">&nbsp;α</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>





d* : this Parameter is responsible for distance from goal at which the conic potential changes to quadratic potential. 
<p align="center">
  <img src="https://raw.githubusercontent.com/SujitJustineBarwa/Robot-Motion-Planning-with-Potential-Field-Approach/main/Images/img5.PNG" />
</p>
 
The size of the arrow increased as d_star increases. This is because the gradient of conic and quadratic potential are now close.

Q* ∶ This parameter can be also called the sphere of influence for the obstacles.The Gradient near the obstacle weakens as Q_star Increases.
 
<p align="center">
  <img src="https://raw.githubusercontent.com/SujitJustineBarwa/Robot-Motion-Planning-with-Potential-Field-Approach/main/Images/img6.PNG" />
</p>

ζ∶ This Parameter is responsible for increasing the attractive potential and gradient.
The length of the arrows have increased.
<p align="center">
  <img src="https://raw.githubusercontent.com/SujitJustineBarwa/Robot-Motion-Planning-with-Potential-Field-Approach/main/Images/img7.PNG" />
</p>

η ∶ This Parameter is responsible for increasing the repulsive potential and gradient.The arrows near the obstacle grows as this param increases.
 
<p align="center">
  <img src="https://raw.githubusercontent.com/SujitJustineBarwa/Robot-Motion-Planning-with-Potential-Field-Approach/main/Images/img8.PNG" />
</p>


ϵ∶ This parameters control how much far is the from goal,the path should he stop.
 
<p align="center">
  <img src="https://raw.githubusercontent.com/SujitJustineBarwa/Robot-Motion-Planning-with-Potential-Field-Approach/main/Images/img9.PNG" />
</p>

α∶ This determines the number of path points.

<p align="center">
  <img src="https://raw.githubusercontent.com/SujitJustineBarwa/Robot-Motion-Planning-with-Potential-Field-Approach/main/Images/img10.PNG" />
</p>

