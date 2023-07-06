import os
if __name__ == "__main__":
    x = 5
    if (x <= 0):
        exit(0)
    file_name = os.path.basename(__file__)
    if "Sully_" in file_name :
        x -= 1
    name = f"Sully_{x}.py"
    code = "import os%cif __name__ == %c__main__%c:%c    x = %d%c    if (x <= 0):%c        exit(0)%c    file_name = os.path.basename(__file__)%c    if %cSully_%c in file_name :%c        x -= 1%c    name = f%cSully_{x}.py%c%c    code = %c%s%c%c    with open (name, %cw%c) as f:%c        f.write(code %%(10,34,34,10,x,10,10,10,10,34,34,10,10,34,34,10,34,code,34,10,34,34,10,10,34,34,34,34,34,34))%c    os.system(%cpython3 %c + %cSully_%c + str(x) + %c.py%c)"
    with open (name, "w") as f:
        f.write(code %(10,34,34,10,x,10,10,10,10,34,34,10,10,34,34,10,34,code,34,10,34,34,10,10,34,34,34,34,34,34))
    os.system("python3 " + "Sully_" + str(x) + ".py")