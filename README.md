# Robot-Motion-Planning-with-Potential-Field-Approach
  The Motion Planing in 2D space is done using potential field approach.
  Special Thanks : Atul Thakur Sir(From IIT Patna)

  The Approach taken:
	The same code for Brushfire algorithm is used which was given.

	The Attractive Potential Function are made as :
 
       Image Courtesy : ref[1] 
The norm function is used to find the d(q,q_goal) i.e the euclidean distance.
The ζ is a tunable parameter and curently its set to 2.

	The Repulsive Potential Function are made as : 
   
Image Courtesy : ref[2]

The Dq parameter is expected to state the distance from the obstacle so it is assigned equal to the value of the world matrix which was made from the brushfire algorithm.
And for ∇Dq is the taken from the gradient of the world matrix.


	The repulsive and additive gradient and potential are then added :
U=U_att+ U_rep
∇U=∇U_att+∇U_rep

	Q_start is defined.
The Gradient Descent Algorithm:
	while ∇U(q_i) > ϵ
		q= q- α∇U(q)
                        i=i+1
                        p(i,:)= q
            End

Here, p stores all the q points and hence is further used to plot the path.

	The Quiver function is used the plot the gradient. And along with the path (p) is also plotted.


List of all the tuneable parameters:
1	d^*
2	Q^*
3	ζ
4	 η 
5	ϵ
6	α








d^* : this Parameter is responsible for distance from goal at which the conic potential changes to quadratic potential. 
 
d^*=3
 
d^*=10
The size of the arrow increased as d_star increases. This is because the gradient of conic and quadratic potential are now close.

Q^* ∶ This parameter can be also called the sphere of influence for the obstacles.
 
Q^*= 3
 
Q^*=10
The Gradient near the obstacle weakens as Q_star Increases.
ζ∶ This Parameter is responsible for increasing the attractive potential and gradient.
 
ζ =2
 
ζ =10
The length of the arrows have increased.
η ∶ This Parameter is responsible for increasing the repulsive potential and gradient.
 
η=20
 
η=60
The arrows near the obstacle grows as this param increases.
ϵ∶ This parameters control how much far is the from goal,the path should he stop.
 
ϵ=0.1
 
ϵ=20

α∶ This determines the number of path points.

 
α=0.1
 
α=0.3

