# (id_adresse, nom_adresse, id_ville)
def get_adresses(nb_adresses, nb_villes):
    adresses = []

    id_adresses = [i for i in range(1, nb_adresses + 1)]
    nom_adresses = get_nom(nb_adresses)
    id_villes = get_villes(nb_adresses, nb_villes)

    for i in range(nb_adresses):
        adresses.append([id_adresses[i], nom_adresses[i], id_villes[i]])

    return adresses

def get_nom(nb_adresses):
    import random
    street_names = [
        'rue de la Paix', 'avenue des Champs-Élysées', 'boulevard Haussmann', 'place Vendôme',
        'rue du Faubourg Saint-Honoré', 'rue Saint-Antoine', 'rue de Rivoli', 'rue de Vaugirard',
        'rue de Sèvres', 'rue Montmartre', 'rue de la Roquette', 'rue de Belleville', 'rue des Martyrs',
        'rue de Charonne', 'rue de la Pompe', 'avenue Montaigne', 'avenue George V', 'avenue Marceau',
        'avenue Foch', 'avenue Victor Hugo', 'rue de la Convention', 'rue de la République',
        'rue de Dunkerque', 'rue des Petits Champs', 'rue de Turenne', 'rue de la Trémoille',
        'rue de la Grange-aux-Belles', "rue dEnghien", 'rue du Cherche-Midi', 'rue de Montreuil',
        'avenue de la Grande Armée', 'avenue Hoche', 'avenue de la Porte de Champerret', 'rue de Passy',
        'rue de la Tour-Maubourg', 'rue de la Bienfaisance', 'rue de Solférino', 'rue de Rennes',
        'rue des Archives', 'rue des Francs-Bourgeois', 'rue Saint-Honoré', "rue de lÉcole de Médecine",
        "rue de lOdéon", 'rue des Écoles', 'rue de Seine', 'rue de Grenelle', 'rue de Babylone',
        'rue Saint-Dominique', 'rue du Bac', 'rue de Verneuil', 'rue des Rosiers', 'rue Vieille-du-Temple',
        'rue des Archives', 'rue des Francs-Bourgeois', 'rue Charlot', 'rue de Bretagne', 'rue de la Roquette',
        'rue Oberkampf', 'rue Saint-Maur', 'rue de Belleville', 'rue de Ménilmontant', 'rue de Bagnolet',
        'rue de la Chapelle', 'rue de Clignancourt', 'rue Marx Dormoy', 'boulevard de la Chapelle',
        'boulevard Barbès', 'boulevard de Clichy', 'boulevard Haussmann', 'boulevard des Batignolles',
        'boulevard Malesherbes', 'boulevard Pereire', 'boulevard Berthier', 'boulevard Victor',
        'boulevard Saint-Germain'
    ]
    adresses = []

    for i in range(nb_adresses):
        adresses.append(f'{random.randint(1, 200)} {random.choice(street_names)}')

    return adresses

def get_villes(nb_adresses, nb_villes):
    import random
    villes = [random.randint(1,nb_villes) for i in range(1, nb_adresses + 1)]
    return villes
