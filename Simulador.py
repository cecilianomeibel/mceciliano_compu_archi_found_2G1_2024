# Import Module
import time
from tkinter import *
from PIL import ImageTk, Image
from verf_instr import update_instruction
from verf_instr import len_instructions

# Índice inicial
current_index = 0
largo_instrucciones = len_instructions()
instrucciones_lista = [
                "auipc x10 0x10000",
                "addi x10 x10 0",
                "auipc x11 0x10000",
                "addi x11 x11 8",
                "auipc x12 0x10000",
                "addi x12 x12 16",
                "jal x1 12 <matrix_mul>",
                "lw x5 0 x10",
                "lw x6 4 x10",
                "lw x7 0 x11",
                "lw x28 4 x11",
                "mul x29 x5 x7",
                "lw x30 8 x11",
                "mul x31 x6 x30",
                "add x29 x29 x31",
                "sw x29 0 x12",
                "mul x29 x5 x28",
                "lw x30 12 x11",
                "mul x31 x6 x30",
                "add x29 x29 x31",
                "sw x29 4 x12",
                "lw x5 8 x10",
                "lw x6 12 x10",
                "lw x7 0 x11",
                "mul x29 x5 x7",
                "lw x30 8 x11",
                "mul x31 x6 x30",
                "add x29 x29 x31",
                "sw x29 8 x12",
                "lw x28 4 x11",
                "mul x29 x5 x28",
                "lw x30 12",
                "mul x31 x6 x30",
                "add x29 x29 x31",
                "sw x29 12 x12",
                "jalr x0 x1 0",
                "addi x17 x0 10",
                "ecall"
                ]

####################### Creacion de la ventana #############################
root = Tk()
root.title("RISCV")
root.geometry('1160x480')
root.resizable(False, False)


###################### Secccion de elementos visbles a crear #########################

x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31 = range(32)
memoria = [0] * 1024

cpuType = "uni"

ciclos = StringVar()
ciclos.set("0")

cpi = StringVar()
cpi.set("0")

instrucciones = StringVar()
instrucciones.set("0")

currInstruction = StringVar()

instrLabel = Label(text="Instrucción actual ---> ")
instrLabel.place(x = 600, y = 25)

instrLabel = Label(textvariable=currInstruction, font=("Arial", 14))
instrLabel.place(x = 740, y = 21)
currInstruction.set("-----")


# Se coloca la imagen inicial del procesador uniciclo
newImg = ImageTk.PhotoImage(Image.open("images\\Estatico.png"))

# Crear un Label que contenga la imagen
procesador_dig = Label(root, image=newImg)
procesador_dig.place(x= 10, y = 60)

#################################### Registros ##################################

# Crear el widget Canvas
canvas = Canvas(root, width=200, height=320)
canvas.pack()
canvas.place(x = 900, y = 40)

# Crear el rectángulo menores x1,y1; mayores x2, y2
canvas.create_rectangle(5, 5, 200, 320, fill="white", outline="black")

x0 = Label(text="x0 | zero --->"); x0.place(x=910,y=50)
x1 = Label(text="x1 | ra --->"); x1.place(x=910,y=70)




################################ Funciones ################################

# Función para ir a la siguiente instrucción
def next_instruction():
    global current_index

    if current_index < largo_instrucciones - 1:
        current_index += 1
        instruccion = update_instruction(current_index);
        load_image(instruccion)
    else:
        current_index = 0;
        

# Función para ir a la instrucción previa
def prev_instruction():
    global procesador_dig
    global current_index
    if current_index > 0:
        current_index -= 1
        instruccion = update_instruction(current_index);
        load_image(instruccion)

# Función para cargar la imagen correspondiente
def load_image(instruction):
    #first_word = instruction.split()[0]
    global procesador_dig
    try:
        if(instruction == "ret" or instruction == "li" or instruction == "ecall"
           or instruction == "la a0"):
            #image = Image.open("images\\Estatico.PNG")
            newImg = ImageTk.PhotoImage(Image.open("images\\Estatico.PNG"))
            procesador_dig.config(image=newImg)
            procesador_dig.image = newImg

        else:
            newImg = ImageTk.PhotoImage(Image.open("images\\"+ instruction + ".PNG"))
            procesador_dig.config(image=newImg)
            procesador_dig.image = newImg
            #return ImageTk.PhotoImage(image)
    except Exception as e:
        print(f"Error loading image: {e}")
        return None

def update_label(text):
    currInstruction.set(text)
    next_instruction();

    
def run_all():
    late = 1000
    index = 0
    while index < len(instrucciones_lista):
        instrLabel.after(late, lambda idx=index: update_label(instrucciones_lista[idx]))
        late += 1000
        index += 1


def ExecutionInfo():
    if cpuType == "pipe":
        ciclos.set("326") 
        cpi.set("1.53")
        instrucciones.set("213")

    elif cpuType == "uni":
        ciclos.set("213")
        cpi.set("1")
        instrucciones.set("213")

# Función que simula la instrucción li
def li(registro, valor):
    # Verificar que el registro sea un número válido
    if not isinstance(registro, int) or registro < 0 or registro > 31:
        raise ValueError("El registro debe ser un número entero entre 0 y 31")

    # Verificar que el valor sea un número entero
    if not isinstance(valor, int):
        raise ValueError("El valor debe ser un número entero")

    # Verificar que el valor sea un número de 32 bits
    if valor < -(2**31) or valor >= 2**31:
        raise ValueError("El valor debe ser un número de 32 bits con signo")

    # Simular la carga del valor inmediato en el registro
    print(f"li x{registro}, {valor}")

def addi(registro_destino, registro_fuente, valor_inmediato):
    # Verificar que los registros sean números válidos
    if not isinstance(registro_destino, int) or not isinstance(registro_fuente, int) or registro_destino < 0 or registro_destino > 31 or registro_fuente < 0 or registro_fuente > 31:
        raise ValueError("Los registros deben ser números enteros entre 0 y 31")

    # Verificar que el valor inmediato sea un número entero de 32 bits
    if not isinstance(valor_inmediato, int) or valor_inmediato < -(2**11) or valor_inmediato >= 2**11:
        raise ValueError("El valor inmediato debe ser un número de 32 bits con signo")

    # Simular la ejecución de la instrucción addi
    resultado = registro_fuente + valor_inmediato
    print(f"addi x{registro_destino}, x{registro_fuente}, {valor_inmediato}  # x{registro_destino} = x{registro_fuente} + {valor_inmediato} = {resultado}")

def beq(registro1, registro2, offset):
    global direccion_salto

    # Verificar que los registros sean números válidos
    if not isinstance(registro1, int) or not isinstance(registro2, int) or registro1 < 0 or registro1 > 31 or registro2 < 0 or registro2 > 31:
        raise ValueError("Los registros deben ser números enteros entre 0 y 31")

    # Simular la comparación de registros
    son_iguales = registro1 == registro2

    # Si los registros son iguales, realizar el salto condicional
    if son_iguales:
        direccion_salto += offset
        print(f"beq x{registro1}, x{registro2}, {direccion_salto}  # Saltar a la dirección {direccion_salto} si x{registro1} == x{registro2}")
    else:
        print(f"beq x{registro1}, x{registro2}, {direccion_salto}  # No saltar, ya que x{registro1} != x{registro2}")

def rem(registro_destino, registro1, registro2):
    # Verificar que los registros sean números válidos
    if not isinstance(registro_destino, int) or not isinstance(registro1, int) or not isinstance(registro2, int) or registro_destino < 0 or registro_destino > 31 or registro1 < 0 or registro1 > 31 or registro2 < 0 or registro2 > 31:
        raise ValueError("Los registros deben ser números enteros entre 0 y 31")

    # Realizar la operación de residuo de la división
    resultado = registro1 % registro2

    # Simular la ejecución de la instrucción rem
    print(f"rem x{registro_destino}, x{registro1}, x{registro2}  # x{registro_destino} = x{registro1} % x{registro2} = {resultado}")

def sub(registro_destino, registro_fuente1, registro_fuente2):
    # Verificar que los registros sean números válidos
    if not isinstance(registro_destino, int) or not isinstance(registro_fuente1, int) or not isinstance(registro_fuente2, int) or registro_destino < 0 or registro_destino > 31 or registro_fuente1 < 0 or registro_fuente1 > 31 or registro_fuente2 < 0 or registro_fuente2 > 31:
        raise ValueError("Los registros deben ser números enteros entre 0 y 31")

    # Realizar la operación de resta
    resultado = registro_fuente1 - registro_fuente2

    # Simular la ejecución de la instrucción sub
    print(f"sub x{registro_destino}, x{registro_fuente1}, x{registro_fuente2}  # x{registro_destino} = x{registro_fuente1} - x{registro_fuente2} = {resultado}")




########################################## Creación de elementos de interacción ##########################################

# Botones de la interfaz
"""
pipeButton = Button(root, text="Uniciclo", command=lambda: ChangeProcessor(imgLabel, cpuType))
pipeButton.grid(column=0,row=0)

uniButton = Button(root, text="Multiciclo", command=lambda: ChangeProcessor(imgLabel, cpuType))
uniButton.grid(column=1,row=0)
"""

####################### Sección superior interactiva de la ventana #############################################3

stepLabel = Label(text="Step by step")
stepLabel.place(x=220,y=25)

prevButton = Button(root, text="Previo", command=prev_instruction)
prevButton.place(x = 300, y = 20)

nextButton = Button(root, text="Siguiente", command=next_instruction)
nextButton.place(x = 360, y =20 )


ritmoLabel = Label(text="Ritmo de clock")
#ritmoLabel.grid(column=3,row=2)
ritmoLabel.place(x = 450, y = 25)


playButton = Button(root, text="Run all", command=run_all)
playButton.place(x = 40, y = 20)


skipButton = Button(root, text="Resultado final", command=ExecutionInfo)
skipButton.place(x = 100, y = 20)

# TextBox Creation 
inputtxt = Entry(width=5)
inputtxt.place(x = 470, y = 25)


####################### Sección inferior de la ventana #############################################3

execLabel = Label(text="Execution info")
execLabel.place(x = 25, y = 360)

cpiLabel = Label(text="CPI: ")
cpiLabel.place(x = 40, y = 380)
cpiLabel_value = Label(textvariable=cpi)
cpiLabel_value.place(x = 70, y = 380)

ciclosLabel = Label(text="Ciclos: ")
ciclosLabel.place(x = 40, y = 410 )
ciclosLabel_value = Label(textvariable=ciclos)
ciclosLabel_value.place(x = 80, y = 410)


pc_Label = Label(text="PC: ")
pc_Label.place(x = 40, y = 440)
pc_Label_value = Label(textvariable=instrucciones)
pc_Label_value.place(x = 70, y = 440)


root.mainloop()
