# About the project

This project involves the creation of self-replicating programs, also known as quines, in C, Assembly, an another chosen language for the bonus (Python in my case).
The objective is to explore the concept of self-reproduction in programming and the challenges that arise from it.
The project is seen as an introduction to more complex projects, including those related to malware development.

The traditional method for creating a self-displaying program involves these two steps:

- Initialize a string variable, incorporating a placeholder for interpolation.
- Display the string, replacing the placeholder with the actual string content.

The operation of a quine is ultimately quite similar to the self-replication process of a cell.
There is an active part, involving the program's instructions, and a data part, the string, which allows for reconstructing the active part of the code, much like DNA.

In this project, each of the programs has a distinct objective :

`Colleen` : A program that generates a copy of itself in a separate file.

`Grace` : A program that generates an exact copy of its own source code into a separate file.

`Sully` : A program that generates modified versions of itself as source files, compiles, and executes them.
The program's execution and file generation are based on an evolving integer parameter, initially set to 5.

Some resources here : 

- https://cs.lmu.edu/~ray/notes/quineprograms/
- https://scienceetonnante.com/2012/03/19/les-quines-des-programmes-informatiques-auto-replicateurs/
- https://fr.wikipedia.org/wiki/Quine_(informatique)
- http://www.madore.org/~david/computers/quine.html
