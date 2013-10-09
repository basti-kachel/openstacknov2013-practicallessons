# Practical Lessons from Building a Highly Available OpenStack Private Cloud

Sebastian Kachel, Florian Haas

Presented at the November 2013 OpenStack Summit, Hong Kong, Hong Kong SAR.

This presentation is under the Creative Commons Attribution ShareAlike
3.0 Unported License. You are free to share and use this presentation
for both commercial and non-commercial purposes provided that you
properly attribute your source, and distribute your work under a
similar license. Please see
http://creativecommons.org/licenses/by-sa/3.0/ for details on the
license.

## Presentation Format

We have built this presentation in the Markdown language, using Pandoc
to produce slides with HTML Slidy.

Images are in the SVG format for vector graphics, and PNG for photos
and raster images.

## Prerequisites

To build this presentation, you'll require
[Pandoc](http://johnmacfarlane.net/pandoc/) and, to make it simple,
[GNU Make](https://www.gnu.org/software/make/).

If you want to build PDF presentations, you'll also need [the LaTeX
`beamer` class](https://bitbucket.org/rivanvx/beamer/wiki/Home).

To install all this at once, on a Debian/Ubuntu based platform, run
the following command:

    apt-get install make pandoc latex-beamer

On Ubuntu, you'll need to enable the `universe` repository to be able
to install the packages.

## Building and Displaying

To create an HTML Slidy slide show from the Markdown sources, simply run

    make

in the top-level directory and then invoke your favorite browser to
open `index.html`.

For a PDF, run

    make pdf

in the top-level directory, and then open `index.pdf` with a PDF
reader.
