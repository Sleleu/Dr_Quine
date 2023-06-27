if __name__ == "__main__":
    x = 5
    if (x <= 0):
        exit(0)

    name = f"Sully_{x - 1}.py"
    code = "if __name__ == %c__main__%c:%c%cx = %d%c%cif (x <= 0):%c%c%cexit(0)%c%c%cname = f%cSully_{x - 1}.py%c%c%ccode = %c%s%c%c%cwith open (name, %cw%c) as f:%c%c%cf.write(code %%(34,34,10,9,x - 1,10,9,10,9,9,10,10,9,34,34,10,9,34,code,34,10,9,34,34,10,9,9,10,9,34,34))%c%cexec(open(f%cSully_{x - 1}.py%c).read())"
    with open (name, "w") as f:
        f.write(code %(34,34,10,9,x - 1,10,9,10,9,9,10,10,9,34,34,10,9,34,code,34,10,9,34,34,10,9,9,10,9,34,34))
    exec(open(f"Sully_{x - 1}.py").read())