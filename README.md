# texmf


<p align="center">
<a href="https://mybinder.org/v2/gh/BrianChevalier/texmf/master?urlpath=lab" target="_blank"><img src="https://mybinder.org/badge_logo.svg" alt="Binder URL Badge" /></a>
<img src="https://img.shields.io/npm/l/express.svg" alt="MIT License Badge">
</p>


These are a collection of LaTeX class, style, etc. files I use in my work as well as template files used with `nbconvert`.

## Jupyter Notebooks and nbconvert

Example usage to convert all notebooks in current working directory:

```bash
jupyter nbconvert *.ipynb --to pdf --template ~/.jupyter/templates/KDHnotes.tplx
```

Note: This assumes you have installed `KDHnotes.cls` in your TeX tree and `KDHnotes.tplx` in `~/.jupyter/templates`.

The following metadata should be added to the notebook metadata for using `KDHnotes.cls` with nbconvert and jupyter notebooks.

```json
"latex_metadata": {
        "author": "Brian Chevalier",
        "coursenum": "CEE212",
        "coursetitle": "Engineering Dynamics",
        "title": "Rigid Body Dynamics",
        "subtitle": "",
        "university": "gitMechanics"
    }
```

Notebooks can also choose to hide all cell inputs if code blocks should be ignored for the pdf output. Add the following notebook metadata:

```json
"hide_input": true
```


Some input cells can be ignored by adding the following *cell* metadata:

```json
"hide_input": true
```
