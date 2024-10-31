import random
import math


def generate_random_numbers(size):
    """Generate a list of random unsigned numbers between 0 and 65535."""
    return [random.randint(0, 65535) for _ in range(size)]


def calculate_gcd_list(list1, list2):
    """Calculate the GCD of corresponding elements from two lists."""
    return [math.gcd(a, b) for a, b in zip(list1, list2)]


def generate_strings(size):
    """Generate three strings containing two sets of random numbers and their GCDs."""
    list1 = generate_random_numbers(size)
    list2 = generate_random_numbers(size)
    gcd_list = calculate_gcd_list(list1, list2)

    # Convert lists to string format
    string1 = f"({', '.join(map(str, list1))});"
    string2 = f"({', '.join(map(str, list2))});"
    string3 = f"({', '.join(map(str, gcd_list))});"

    return string1, string2, string3


# Generate strings with 5 elements as per your example
string1, string2, string3 = generate_strings(1000)

# Print the generated strings
print(string1)
print(string2)
print(string3)
