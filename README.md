<div align="center">

# OpenRefine-pyjar

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

</div>

Openrefine-pyjar permet d'installer et d'utiliser des librairies java et python dans OpenRefine.

## Installation

```sh
git clone https://github.com/eonm-abes/openrefine-pyjar
cd openrefine-pyjar
docker-compose up --build
```
## Libraries installées par défaut

**Java**

* [commons-text](https://commons.apache.org/proper/commons-text/javadocs/api-release/index.html)

**Python**

* [unidecode](https://pypi.org/project/Unidecode/)

## Usage

__Utilisation des librairies java dans OpenRefine__

Un guide complet sur l'utilisation des librairies java dans OpenRefine est disponible sur le [wiki](https://github.com/OpenRefine/OpenRefine/wiki/Jython#tutorial---working-with-phone-numbers-using-java-libraries-inside-python) d'OpenRefine.

```py
# language python/jython
from org.apache.commons.text.similarity import JaroWinklerDistance
jaro = JaroWinklerDistance()

return jaro.apply(value, "foo bar")
```

__Utilisation des librairies python dans OpenRefine__

Un guide complet sur l'utilisation des librairies python dans OpenRefine est disponible sur le [wiki](https://github.com/OpenRefine/OpenRefine/wiki/Extending-Jython-with-pypi-modules) d'OpenRefine.

```py
# language python/jython
import sys
sys.path.append("/app/jython/Lib/site-packages")
from unidecode import unidecode
return unidecode(value)
```
