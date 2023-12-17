# (id_client, id_adresse)
# Minimum une adresse par client et 50% suivants
def get_habiter(nb_clients, nb_adresses, rate):
    habiter = []

    id_clients = [i for i in range(1, nb_clients + 1)]
    id_adresses = get_random_adresses(nb_clients, nb_adresses, rate)

    for i in range(nb_clients):
        for j in range(len(id_adresses[i])):
            habiter.append([id_clients[i], id_adresses[i][j]])

    return habiter

def get_random_adresses(nb_clients, nb_adresses, rate):
    import random

    id_adresses = [i for i in range(1, nb_adresses + 1)]
    to_return = []

    for i in range(nb_clients):
        to_return.append([random.choice(id_adresses)])
        while(random.random() < rate):
            address = random.choice(id_adresses)
            if address not in to_return[i]:
                to_return[i].append(address)

    return to_return