<div align="center">

# OpenRefine-pyjar

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

</div>

Openrefine-pyjar permet d'installer et d'utiliser des librairies java et python dans OpenRefine.

## Prérequis

Pour fonctionner OpenRefine-pyjar requiert :
* [docker](https://docs.docker.com/get-docker/)
* [docker-compose](https://docs.docker.com/compose/install/)

## Installation

```sh
git clone https://github.com/eonm-abes/openrefine-pyjar # récupération du code source depuis Github
cd openrefine-pyjar # on entre dans le dossier openrefine-pyjar
docker-compose up --build # création et lancement du contenur docker
```
## Libraries installées par défaut

**Java**

* [commons-text](https://commons.apache.org/proper/commons-text/javadocs/api-release/index.html) (string similarity/diff algorithm) :
  * CosineDistance
  * CosineSimilarity
  * EditDistanceFrom
  * FuzzyScore
  * HammingDistance
  * IntersectionResult
  * IntersectionSimilarity
  * JaccardDistance
  * JaccardSimilarity
  * JaroWinklerDistance
  * JaroWinklerSimilarity
  * LevenshteinDetailedDistance
  * LevenshteinDistance
  * LevenshteinResults
  * LongestCommonSubsequence
  * LongestCommonSubsequenceDistance
  * SimilarityScoreFrom

* [isbn-check](https://mvnrepository.com/artifact/info.knigoed.isbn/isbn-check)

**Python**

* [unidecode](https://pypi.org/project/Unidecode/)

### Ajout de nouvelles libraries

Les libraries python doivent être ajoutées au fichier [requierments.txt](./requierments.txt). Les libraries java doivent être ajoutées dans le fichier [Dockerfile](./Dockerfile#L14) en utilisant la dirrective `ADD`.

```Dockerfile
ADD https://repo1.maven.org/maven2/org/apache/commons/commons-text/1.8/commons-text-1.8.jar ./webapp/WEB-INF/lib/
```

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
