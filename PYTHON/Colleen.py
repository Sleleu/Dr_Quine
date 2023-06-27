# I'm outside !

def display_code():
    str = "# I'm outside !%c%cdef display_code():%c    str = %c%s%c%c    print(str%%(10,10,10,34,str,34,10,34,34,10,10,34,34,10,10,10), end=%c%c)%c%cif __name__ == %c__main__%c:%c    # I'm inside !%c    display_code()%c"
    print(str%(10,10,10,34,str,34,10,34,34,10,10,34,34,10,10,10), end="")

if __name__ == "__main__":
    # I'm inside !
    display_code()
