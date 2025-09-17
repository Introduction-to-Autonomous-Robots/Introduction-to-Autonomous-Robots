Introduction-to-Autonomous-Robots
=================================

An open textbook focusing on computational principles of autonomous robots. The source-code is released under Creative Commons 4.0 (CC-BY-NC-ND), whereas the print version is copyrighted by MIT Press. You are therefore permitted to use images and content from the book for non-commercial purposes (including teaching) with proper attribution, but you cannot post compiled versions of the book online. 

The book is available on Amazon [Introduction to Autonomous Robots](https://www.amazon.com/Introduction-Autonomous-Robots-Mechanisms-Algorithms/dp/0262047551), you can also review it and/or rate it there. 

## How to compile

Due to copyright issues, we are not allowed to have a freely available PDF version of this book online. 
However, you can create one yourself if you so choose! 
In order to compile a PDF of this book yourself, you either need a working implementation of Latex on your computer or use the online Latex editor overleaf.com. 

### Overleaf compilation

On overleaf, you can either upload a zip file of the source code ("download ZIP" option underneath the green "Code" button on this page), or fork the project into your Github account and import it directly into Overleaf from there. 

### Latex Compilation

#### Prerequisites
- LaTeX installation with `pdflatex` and `bibtex`
- ImageMagick (for converting missing figures)

#### Compilation Steps

   ```bash
   pdflatex -interaction=nonstopmode book.tex
   bibtex book
   pdflatex -interaction=nonstopmode book.tex
   pdflatex -interaction=nonstopmode book.tex
   ```

The final PDF will be generated as `book.pdf`.

#### Notes
- The `-interaction=nonstopmode` flag allows compilation to continue past non-fatal errors
- Multiple pdflatex runs are needed to resolve cross-references and citations
- Some warnings about overfull boxes are normal and don't affect the final output

## Citation

This book can be cited as follows:

 > Nikolaus Correll, Bradley Hayes, Christoffer Heckman and Alessandro Roncone. Introduction to Autonomous Robots: Mechanisms, Sensors, Actuators, and Algorithms, MIT Press, 2022 (forthcoming). 

```
@book{correll2022introduction,
  title={ Introduction to Autonomous Robots: Mechanisms, Sensors, Actuators, and Algorithms},
  author={Correll, Nikolaus and Hayes, Bradley, and Heckman, Christoffer, and Roncone, Alessandro},
  year={2022},
  edition={1st},
  publisher={MIT Press, Cambridge, MA}
}
```
