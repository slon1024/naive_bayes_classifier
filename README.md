# Naive Bayes classifier

I'll show an example of [Naive Bayes classifier](http://en.wikipedia.org/wiki/Naive_Bayes_classifier) (NBC). From my point of view there is a lot of theories on this subject, but hard enough to find practical examples that show that NBC works in real life (and does it well enough).

## A bit of theory

![P(C|O)](http://mathurl.com/43ldwqj.png)

Find P(C|O) can use the formula Bayes.

![Bayes](http://mathurl.com/42khnaa.png)

I want to draw your attention to the fact that we are looking for the maximum, so the denominator can be removed (it will just be a constant value, which essentially does not change anything). OK, then we get the following (simplified) formula.

![simplified](http://mathurl.com/leacfcx.png)


O (object) consists of features so that P(O|C) is equal to:

![P(O|C)](http://mathurl.com/mexxzzc.png)



### The final formula will be:

![final formula](http://mathurl.com/mle49sz.png)

## What does this mean in practice?
In order to understand the mathematical formulas, let's solve the puzzle. Suppose we have a list of names, and we need to determine the base name is it male or female. For example, **Adam** - it's a **male** name, and **Julia** - a **female** name. 


Let us approximate the mathematical world to the intuitive world (what can be seen, not even knowing the difficult mathematics formulas).

Each name - it is an object. Which has certain features. For instance, those features can be: the **first letter** of the name, the **last letter** of the name, name **length**, etc.

Each name can be **male** or **female** (this is our classifiers, there'a two in this case: 'male' or 'female').

To learn how to determine the gender of the name belongs to, we needed data on which we learn. Data it's n-th number of rows (records), each row will have two values **name** and **gender**. For example:

| Name    | Gender|
| --------|------:|
| Abdon   | m     |
| Abel    | m     |
| Ada     | f     |


Let the list of names, which is n. Number of classes to which it objects attribute m (recall in this case two classes: male and female). Then P(C) is equal to:

![P(C)](http://mathurl.com/lb8j58c.png)

We assume that our *object* (name) has two *features* (ie, each name has two features), namely: the first letter and last letter. For example, "**Adam**", has two features: "**A**" (*first letter*) and "**m**" (*last letter*). Furthermore, we know that this *object* ("Adam") is a **male** name (*classifier* "m" - male). Knowing how often a male name has first letter is "A", we can assume that if it is a male or female name. Determine the name (male or female) only one letter is very difficult (for example, there are many names as female and male, which begin with the letter "A"). Therefore, we look at another feature (the last letter), in practice this is already quite enough (charts below).

###Example 
We have **n** names (of which *male* names - **k**, and *female* - **l**, ie, **n = k + l**), and also we know about **r** when in the male name was the first letter **A**. Then the probability that name is male which begins with the letter "A" is equal to:

![P(f1|c)](http://mathurl.com/kla3qpb.png)  
*where*  
**f1** - the first letter of the object (feature)  
**с** - the classifier "m"  (ie, that the name is male)  
**r** - the number of times the first letter in the male names was "A"  
**k** - how many were male names


Let will examine the case when object has two features (eg the first letter and the last letter), then the total probability that the name is a male will be equal to:

![P(O|c)](http://mathurl.com/lk8ygqo.png)  
*where*  
**s** - how many times the last letter (in the name of "Adam" this "m") appeared among the male names.

## Training and testing
We have a total of n names. And we need to take part names to learn, and another part, in order to test the effectiveness (how well we define - classify).
Example. We can divide a list of names by half. The first part of training - a training set, and the second part of the test - a test set. Intuitively, it is not clear exactly why on half? Let us conduct experimentation and look at the charts that we succeed.

### In order to be sure, I performed 200 times (from my point of view, it is sufficient for this task). A set of names in each of experiment were mixed.


## The testing set includes of all the names
In other words, a set of training set (in this case, we increase it) and test set constant (full list of names.)

The x-axis, are **experiments** (200 pieces), y-axis - **accuracy** (ie how many replies from all were correct. The ideal - 100%).

### train_set.length == 1
![1](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to0_all.png)

### train_set.length == 5
![5](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to5_all.png)

### train_set.length == 10
![10](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to10_all.png)

### train_set.length == 50
![50](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to50_all.png)

### train_set.length == 100
![100](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to100_all.png)

### train_set.length == 300
![300](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to300_all.png)

### train_set.length == 500
![500](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to500_all.png)

### train_set.length == 1000
![1000](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to1000_all.png)

## The testing set includes what is not included in the training set

In other words, a list of names of (n), is divided into two groups for the training set and testing set.


### train_set.length == 1
![1](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to0_from0.png)

### train_set.length == 5
![5](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to5_from5.png)

### train_set.length == 10
![10](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to10_from10.png)

### train_set.length == 50
![50](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to50_from50.png)

### train_set.length == 300
![300](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to300_from300.png)

### train_set.length == 500
![500](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to500_from500.png)

### train_set.length == 1000
![1000](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_to1000_from1000.png)


## Some conclusions
Set of names (population) was in **1712**. In the case when training set included **1000** names, names of testing was **712** (41.59%). It is also *enough* quantity to be able to trust him.

What evident in all the graphs that the quality of sample size increases, ie, we have not yet reached the level [*overfitting*](http://en.wikipedia.org/wiki/Overfitting).

## Final chart
Let's build another chart, which was quite difficult to compute (long), but it will show us in detail both by decreasing the number of rising quality (accuracy).
![final chart](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_avg_from0_to1500.png)


The graph consists of **1501** points. Each of which computed **200** times and took the average of them (each experiment names mixed up).

Let's look to the graph (how to change the accuracy of these intervals). I propose to divide it into seven intervals.

| interval | from   | to     | diff   |
| ---------|:------:|:------:|:-------|
| 0..50    | 49.57% | 67.06% | 17.49% |
| 50..100  | 67.06% | 77.85% | 10.79% |
| 100..200 | 77.85% | 86.40% | 8.55%  |
| 200..300 | 86.40% | 89.55% | 3.15%  |
| 300..400 | 89.55% | 90.94% | 1.39%  |
| 400..600 | 90.94% | 92.31% | 1.37%  |
| 600..1500| 92.31% | 93.68% | 1.37%  |


The table is very clear that in the interval from 0 to 200, the accuracy was improved by **36.83%** (reaching 86.40%), and the interval from 200 to 1500 improved to **7.28%** (reaching 93.68%).


Maximum accuracy which managed to get this: **93.97**% *(which appeared at 1496)*. 


You can see this chart in more detail. I divided it into three intervals: from 0 to 200, from 200 to 1500 and 1000 to 1500.

### from 0 to 200
![0-200](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_avg_from0_to200.png)

### from 200 to 1500
![200-1500](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_avg_from200_to1500.png)

### from 1000 to 1500
![1000-1500](https://raw.github.com/slon1024/naive_bayes_classifier/master/chart/test_avg_from1000_to1500.png)


At the last (from 1000 to 1500), though it seems "hard" oscillate, the oscillation amplitude is very small (on average about 0.2%)



## Conclusion

In order to determine the name of the male or female with an accuracy greater than 90% is enough to make the following:  
1. Each name will have three feature (the first letter in the middle of the beech and the last letter ).  
2. Need at least 200 names to be close to 90% accuracy.  
3. But even if the names will be much more difficult to be a very "hard" to improve significantly the result (in our case it was a maximum of 3%). So if 90% is not enough, you need also use additional another method.


**Naive Bayes classifier**, despite its simplicity, but  it's very practical . At first glance (based on theory) , it's very difficult to imagine that knowing only some of the letters in the name, it can be argued ( with a fairly high degree of accuracy ) it is male or female. But is it really this classifier so naive? If longer think about it then intuitively begin to understand why this happens, and then everything falls into place.

