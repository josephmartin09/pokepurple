import csv
import re
import os
import sys

EXCLUDE_FILES = [
    "nothing.asm",
    "PokemonTower1F.asm",
    "PokemonTower2F.asm",
    "Route21.asm" # Something is goofy with this file, it has two areas worth of mon
]

def main():

    out_data_dir = "./csv"
    mon_data_dir = "./data/wild/maps/" # Would be nice if this wasn't relative.

    if not os.path.isdir(out_data_dir):
        os.mkdir(out_data_dir)

    # Iterate over all pokemon data files in the game
    for f_name in sorted(os.listdir(mon_data_dir)):

        # Open a pokemon area data file and a CSV file
        if f_name in EXCLUDE_FILES:
            continue
        out_csv_name = f_name.split(".")[0] + ".csv"
        mon_file = open(os.path.join(mon_data_dir, f_name), 'r')
        out_csv = open(os.path.join(out_data_dir, out_csv_name), 'w')
        csv_writer = csv.writer(out_csv)
        csv_writer.writerow(["POKEMON", "LEVEL"])
        csv_writer.writerow(["", ""])

        # Iterate over each pokemon in the file, writing it to the CSV
        mon_counter = 0 # Count number of mon in an area
        for line in mon_file:
            line = line.strip()
            matches = re.match(r"db (\d+),(.+)", line)
            if matches:
                level = matches[1]
                mon_name = matches[2]
                csv_writer.writerow([mon_name, level])
                mon_counter += 1

        # Sanity check that there are exactly 10 pokemon in each area
        assert mon_counter == 10

        # Cleanup
        out_csv.close()
        mon_file.close()


if __name__ == "__main__":
    main()