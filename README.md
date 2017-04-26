# virtuailes-buildroot
Buildroot setup environment with buildroot external for VirtuAiles

Pour démarrer:

Récupérer le contenu de ce dépôt
```shell
git clone https://github.com/Inounx/virtuailes-buildroot.git virtuailes-buildroot
```

Lancer ensuite le script d'initialisation:
```
cd virtuailes-buildroot
chmod +x initBuildroot.sh
./initBuildroot.sh
```

Une fois l'initialisation terminée, compiler buildroot (peut prendre un certain temps!)
```
cd buildroot
make
```

