# Lista de instrucciones
instructions = [
    "la a0",
    "la a0",
    "la a1",
    "la a1",
    "la a2",
    "la a2",
    "jal",
    "lw",
    "lw",
    "lw",
    "lw",
    "mul",
    "lw",
    "mul",
    "add",
    "sw",
    "mul",
    "lw",
    "mul",
    "add",
    "sw",
    "lw",
    "lw",
    "lw",
    "mul",
    "lw",
    "mul",
    "add",
    "sw",
    "lw",
    "mul",
    "lw",
    "mul",
    "add",
    "sw",
    "ret",
    "li",
    "ecall"
]

# Función para actualizar la instrucción y la imagen
def update_instruction(current_index):
    instruction = instructions[current_index]

    return instruction

def len_instructions():

    return len(instructions)