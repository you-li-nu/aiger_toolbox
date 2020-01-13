import argparse
import os


def main(args):
    smv_file = args.smv
    assert smv_file.endswith('.smv')
    filename = smv_file.split('.')[0]
    
    cmd = "../smvflatten " + smv_file + " > " + filename + ".flat"
    os.system(cmd)
    cmd = "../smvtoaig -L ./ltl2smv " + filename + ".flat" + " > " + filename + ".aig"
    os.system(cmd)
    
    

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--smv', help='.smv file name')
    args = parser.parse_args()
    main(args)
