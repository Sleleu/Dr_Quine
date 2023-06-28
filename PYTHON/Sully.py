if __name__ == "__main__":
    x = 5
    if (x <= 0):
        exit(0)

    name = f"Sully_{x - 1}.py"
    code = "if __name__ == %c__main__%c:%c    x = %d%c    if (x <= 0):%c        exit(0)%c%c    name = f%cSully_{x - 1}.py%c%c    code = %c%s%c%c    with open (name, %cw%c) as f:%c        f.write(code %%(34,34,10,x - 1,10,10,10,10,34,34,10,34,code,34,10,34,34,10,10,34,34))%c    exec(open(f%cSully_{x - 1}.py%c).read())"
    with open (name, "w") as f:
        f.write(code %(34,34,10,x - 1,10,10,10,10,34,34,10,34,code,34,10,34,34,10,10,34,34))
    exec(open(f"Sully_{x - 1}.py").read())