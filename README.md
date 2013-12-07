# Naive Bayes classifier

I'll show an example of [Naive Bayes classifier](http://en.wikipedia.org/wiki/Naive_Bayes_classifier) (NBC). From my point of view there is a lot of theories on this subject, but hard enough to find practical examples that show that NBC works in real life (and does it well enough).

## A bit of theory

![alt tag](http://mathurl.com/43ldwqj.png)

Find P (C | O) can use the formula Bayes.

![alt tag](http://mathurl.com/42khnaa.png)

I want to draw your attention to the fact that we are looking for the maximum, so the denominator can be removed (it will just be a constant value, which essentially does not change anything). OK, then we get the following (simplified) formula.

![alt tag](http://mathurl.com/leacfcx.png)


Where P(O|C) is

![alt tag](http://mathurl.com/ovdb6dz.png)



The final formula will be:

![alt tag](http://mathurl.com/3g3cwb9.png)

## What does this mean in practice
In order to understand the mathematical formulas, let's solve the puzzle. Suppose we have a list of names, and we need to determine the base name is it male or female. For example, **Jan** - it's a **male** name, and **Karolina** - a **female** name. 

How to implement it?

Let us approximate the mathematical world to the intuitive world (what can be seen, not even knowing the difficult mathematics formulas).

Each name - it is an object. Which has certain features. For instance, those features can be: the **first letter** of the name, the **last letter** of the name, name **length**, etc.

Each name can be **male** or **female** (this is our classifiers, there'a two in this case: 'male' or 'female').

To learn how to determine the gender of the name belongs to, we needed data on which we learn. Data it's n-th number of rows (records), each row will have two values **name** and **gender**. For example:

| Name    | Gender|
| --------|------:|
| Abdon   | m     |
| Abel    | m     |
| Ada     | f     |


Let the list of names, which is n. Number of classes to which it objects attribute m (recall in this case two classes: male and female). Then P (C) is equal to:

![alt tag](http://mathurl.com/lb8j58c.png)

