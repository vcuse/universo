import csv

def export_to_rapid(x, y, z, rX, rY, rZ):
    move_joint = "MoveJ RelTool (starting_position, {}, {}, {} \Rx:={}, \Ry:={}, \Rz:={}), v200, z200, Tooldata_7;\n".format(x, y, z, rX, rY, rZ)


    with open('C:\\Users\\grazianige\\Documents\\GitHub\\universo\\rapid_code.txt', 'a') as movement_file:
        movement_file.write(move_joint)

open('C:\\Users\\grazianige\\Documents\\GitHub\\universo\\rapid_code.txt', 'w').close()
source_file = open('C:\\Users\\grazianige\\Documents\\GitHub\\universo\\rotationvalues.csv', 'r')
source_data = csv.reader(source_file)

for row in source_data:
    rX, rY,X,Y,Z = row[0], row[1], row[2],row[3],row[4]
    export_to_rapid(X, Y, Z, rX, rY, 0)