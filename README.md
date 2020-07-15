# Overview

This project contains the configuration files for my Emacs setup.

I use the [`use-package`](https://github.com/jwiegley/use-package)
package to manage dependencies. To mitigate some dependency on
ELPA/MELPA/Marmalade, I clone the
[`emacs-elpa`](https://github.com/prsteele/emacs-elpa) repository to
the `elpa/` directory. (I clone directly instead of using `git
submodule` so that package update operations modify an actual Git
repository, which makes committing new changes easy.)
