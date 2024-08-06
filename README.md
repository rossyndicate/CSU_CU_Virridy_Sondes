# CSU, CU and Virridy Collaboration

This repo contains code to aggregate water quality sensor and grab sample data for the CSU, CU and Virridy collaboration in the Cache La Poudre Basin

## Code

All scripts are stored in the `scripts` folder. The primary script is `01_import_combine_data.Rmd`, which sources `00_setup.R` to load packages. This script also relys on `functions/grab_zenodo_data.R` to download the water chemistry data published to zenodo.

This script has four main functions:

-    Importing water chemistry data from Zenodo

-   Importing verified sonde data from data folder

-   Pulling in hourly flow data from USGS and CDWR sources

-    Matching the grab samples to sonde data to be used for downstream analysis

    -   Note: At collocated sites (timberline, prospect and archery), an additional row is made for these samples and one will contain sonde data belonging to the virridy sonde at this location and the other will contain CSU sonde data.

Once the data has been passed thru the workflow, it is saved in the `data/combined` folder with the date it was run thru the workflow. When more data is verified by ROSS team members, it will be placed in the `data/verified_sensor_data` folder and the workflow will be rerun.

# Map

A map of currently deployed sites is available at <https://rossyndicate.github.io/CSU_CU_Virridy_Sondes/> or can be viewed from the file `docs/Index.html`
