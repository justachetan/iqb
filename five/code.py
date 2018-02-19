import random
import matplotlib.pyplot as plt

def generate_data(n, p_oc, p_co):

    """
        This function is for generating a random array
        that will denote the state of the ion channel
        for the number of iterations provided as input
    """

    # Variable to denote state of the channel
    # 1 => Channel is open
    # 0 => Channel is closed
    state = 0

    # List to store values in all iterations
    trials = [state]

    for i in range(n - 1):

        trial = random.uniform(0, 1)
        if state == 1:

            if trial < p_oc:

                state = 0

        elif state == 0:

            if trial < p_co:

                state = 1

        trials.append(state)

    return trials


def plot_graph(trials):

    plt.plot(trials, linewidth=0.8)
    plt.xlabel("Time (in ms)")
    plt.ylabel("Current (in pA)")
    plt.show()



p_oc = 2/5
p_co = 1/5
n = 100

val = generate_data(n, p_oc, p_co)

open_t = sum(val)
p_open = open_t/n
p_close = 1 - p_open

print("P_open =", p_open)
print("P_close =", p_close)
print("P_open / P_close =", p_open/p_close)

plot_graph(val)

