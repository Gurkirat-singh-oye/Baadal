#!/bin/python
import os

abs_path = "./ins_one"

Trig = open(f"{abs_path}/TrigLock", "r")
Unlocked = open(f"{abs_path}/finger_on.sh", "w")

sh_bang = "#!/bin/bash\n"
Unlocked.writelines(sh_bang)

for a in Trig.readlines():
    a = a[:-1]
    a_list = a.split(" ")
    Unlocked.write(a_list[1] + " " + a_list[2])

Trig.close()
Unlocked.close()
os.system(f"chmod +x {abs_path}/finger_on.sh")
os.system(f"cd {abs_path}/ && ./finger_on.sh")
