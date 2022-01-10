'''
 - Author : hanwn
 - Date : 01-10-2022
 - FileName : sectonCode.py
 - Email : hanwn7721 [at] gmail.com
 - Description : 
'''


def add_or_update_section_number(filename:str):
    SEC = 6
    sec_num :list = [0] * SEC
    with open(filename, 'r')as f:
        content = f.readlines()
    
    flag: bool = False
    for _, con in enumerate(content, 1):
        if con.startswith("```"):
            flag = True if flag is False else False

        if flag:
            continue

        for num in range(SEC,0,-1):

            if con.startswith('#'*num):
                con_arr = con.split(' ')
                sec_num[num:] = [0] * (SEC - num)
                sec_num[num - 1] += 1
                pendding_num = '.'.join(list(map(lambda key: str(key), sec_num[:num])))
                if pendding_num == 2:
                    print([con_arr[0], pendding_num, con_arr[-1]])
                elif con_arr[1] != pendding_num:
                    con_arr[1] = pendding_num
                    print(con_arr)
                break

if __name__ == "__main__":
    filename = "test.md"
    add_or_update_section_number(filename)

