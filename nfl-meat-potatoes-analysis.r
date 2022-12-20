{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "b51e46c7",
   "metadata": {
    "papermill": {
     "duration": 0.007602,
     "end_time": "2022-12-20T20:19:46.330245",
     "exception": false,
     "start_time": "2022-12-20T20:19:46.322643",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Background:**\n",
    "\n",
    "Pass blocking is one of the most important roles in football. Without it, we wouldn't see players like Tom Brady, Aaron Rodgers, Patrick Mahomes and Josh Allen shine on the football field every Sunday. If a team’s offensive philosophy was to throw screens and quick slants every pass play, then it would make life for the offensive linemen relatively easy as there wouldn't be enough time for defenses to pressure. On the other hand, if the quarterback decided to hold onto the ball for four seconds every play, then even the best offensive linemen would allow pressure on a somewhat consistent basis."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1bd05f19",
   "metadata": {
    "papermill": {
     "duration": 0.005972,
     "end_time": "2022-12-20T20:19:46.342272",
     "exception": false,
     "start_time": "2022-12-20T20:19:46.336300",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **1. Importing necessary R packages**\n",
    "We need to import R libraries necessary for cleaning and analyzing data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "021c604f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:19:46.358272Z",
     "iopub.status.busy": "2022-12-20T20:19:46.356324Z",
     "iopub.status.idle": "2022-12-20T20:19:47.945521Z",
     "shell.execute_reply": "2022-12-20T20:19:47.943503Z"
    },
    "papermill": {
     "duration": 1.600821,
     "end_time": "2022-12-20T20:19:47.948897",
     "exception": false,
     "start_time": "2022-12-20T20:19:46.348076",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.5 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(\"tidyverse\")\n",
    "library(\"skimr\")\n",
    "library(\"janitor\")\n",
    "library(\"ggplot2\")\n",
    "library(\"lubridate\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5d58d756",
   "metadata": {
    "papermill": {
     "duration": 0.007685,
     "end_time": "2022-12-20T20:19:47.963167",
     "exception": false,
     "start_time": "2022-12-20T20:19:47.955482",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **2. Importing data** \n",
    "Then, we import the datasets into RStudio using read.csv().\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "025c281b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:19:48.008518Z",
     "iopub.status.busy": "2022-12-20T20:19:47.978893Z",
     "iopub.status.idle": "2022-12-20T20:20:58.041678Z",
     "shell.execute_reply": "2022-12-20T20:20:58.039932Z"
    },
    "papermill": {
     "duration": 70.075459,
     "end_time": "2022-12-20T20:20:58.045799",
     "exception": false,
     "start_time": "2022-12-20T20:19:47.970340",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "games_data <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/games.csv\")\n",
    "players_data <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/players.csv\")\n",
    "scouting_data <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/pffScoutingData.csv\")\n",
    "plays_data <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/plays.csv\")\n",
    "week_1 <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/week1.csv\")\n",
    "week_2 <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/week2.csv\")\n",
    "week_3 <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/week3.csv\")\n",
    "week_4 <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/week4.csv\")\n",
    "week_5 <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/week5.csv\")\n",
    "week_6 <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/week6.csv\")\n",
    "week_7 <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/week7.csv\")\n",
    "week_8 <- read.csv(\"/kaggle/input/nfl-big-data-bowl-2023/week8.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "dbf85d1d",
   "metadata": {
    "papermill": {
     "duration": 0.006713,
     "end_time": "2022-12-20T20:20:58.060442",
     "exception": false,
     "start_time": "2022-12-20T20:20:58.053729",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **3. Data Cleaning**\n",
    "Let's clean the names of our datasets using clean_names() and change data types using appropriate formulas."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2f5f637e",
   "metadata": {
    "papermill": {
     "duration": 0.006562,
     "end_time": "2022-12-20T20:20:58.073720",
     "exception": false,
     "start_time": "2022-12-20T20:20:58.067158",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We'll first clean the games_data using clean_names() for columns and changing the date column from chr to date using as.Date()."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "febdea4c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:20:58.090289Z",
     "iopub.status.busy": "2022-12-20T20:20:58.088746Z",
     "iopub.status.idle": "2022-12-20T20:20:58.255211Z",
     "shell.execute_reply": "2022-12-20T20:20:58.253457Z"
    },
    "papermill": {
     "duration": 0.177746,
     "end_time": "2022-12-20T20:20:58.257746",
     "exception": false,
     "start_time": "2022-12-20T20:20:58.080000",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t122 obs. of  7 variables:\n",
      " $ gameId         : int  2021090900 2021091200 2021091201 2021091202 2021091203 2021091204 2021091205 2021091206 2021091207 2021091208 ...\n",
      " $ season         : int  2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 ...\n",
      " $ week           : int  1 1 1 1 1 1 1 1 1 1 ...\n",
      " $ gameDate       : chr  \"09/09/2021\" \"09/12/2021\" \"09/12/2021\" \"09/12/2021\" ...\n",
      " $ gameTimeEastern: chr  \"20:20:00\" \"13:00:00\" \"13:00:00\" \"13:00:00\" ...\n",
      " $ homeTeamAbbr   : chr  \"TB\" \"ATL\" \"BUF\" \"CAR\" ...\n",
      " $ visitorTeamAbbr: chr  \"DAL\" \"PHI\" \"PIT\" \"NYJ\" ...\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 122 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>game_id</th><th scope=col>season</th><th scope=col>week</th><th scope=col>game_date</th><th scope=col>game_time_eastern</th><th scope=col>home_team_abbr</th><th scope=col>visitor_team_abbr</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2021090900</td><td>2021</td><td>1</td><td>2021-09-09</td><td>20:20:00</td><td>TB </td><td>DAL</td></tr>\n",
       "\t<tr><td>2021091200</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>ATL</td><td>PHI</td></tr>\n",
       "\t<tr><td>2021091201</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>BUF</td><td>PIT</td></tr>\n",
       "\t<tr><td>2021091202</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>CAR</td><td>NYJ</td></tr>\n",
       "\t<tr><td>2021091203</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>CIN</td><td>MIN</td></tr>\n",
       "\t<tr><td>2021091204</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>DET</td><td>SF </td></tr>\n",
       "\t<tr><td>2021091205</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>HOU</td><td>JAX</td></tr>\n",
       "\t<tr><td>2021091206</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>IND</td><td>SEA</td></tr>\n",
       "\t<tr><td>2021091207</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>TEN</td><td>ARI</td></tr>\n",
       "\t<tr><td>2021091208</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>WAS</td><td>LAC</td></tr>\n",
       "\t<tr><td>2021091209</td><td>2021</td><td>1</td><td>2021-09-12</td><td>16:25:00</td><td>KC </td><td>CLE</td></tr>\n",
       "\t<tr><td>2021091210</td><td>2021</td><td>1</td><td>2021-09-12</td><td>16:25:00</td><td>NE </td><td>MIA</td></tr>\n",
       "\t<tr><td>2021091211</td><td>2021</td><td>1</td><td>2021-09-12</td><td>16:25:00</td><td>NO </td><td>GB </td></tr>\n",
       "\t<tr><td>2021091212</td><td>2021</td><td>1</td><td>2021-09-12</td><td>16:25:00</td><td>NYG</td><td>DEN</td></tr>\n",
       "\t<tr><td>2021091213</td><td>2021</td><td>1</td><td>2021-09-12</td><td>20:20:00</td><td>LA </td><td>CHI</td></tr>\n",
       "\t<tr><td>2021091300</td><td>2021</td><td>1</td><td>2021-09-13</td><td>20:15:00</td><td>LV </td><td>BAL</td></tr>\n",
       "\t<tr><td>2021091600</td><td>2021</td><td>2</td><td>2021-09-16</td><td>20:20:00</td><td>WAS</td><td>NYG</td></tr>\n",
       "\t<tr><td>2021091900</td><td>2021</td><td>2</td><td>2021-09-19</td><td>13:00:00</td><td>CAR</td><td>NO </td></tr>\n",
       "\t<tr><td>2021091901</td><td>2021</td><td>2</td><td>2021-09-19</td><td>13:00:00</td><td>CHI</td><td>CIN</td></tr>\n",
       "\t<tr><td>2021091902</td><td>2021</td><td>2</td><td>2021-09-19</td><td>13:00:00</td><td>CLE</td><td>HOU</td></tr>\n",
       "\t<tr><td>2021091903</td><td>2021</td><td>2</td><td>2021-09-19</td><td>13:00:00</td><td>IND</td><td>LA </td></tr>\n",
       "\t<tr><td>2021091904</td><td>2021</td><td>2</td><td>2021-09-19</td><td>13:00:00</td><td>JAX</td><td>DEN</td></tr>\n",
       "\t<tr><td>2021091905</td><td>2021</td><td>2</td><td>2021-09-19</td><td>13:00:00</td><td>MIA</td><td>BUF</td></tr>\n",
       "\t<tr><td>2021091906</td><td>2021</td><td>2</td><td>2021-09-19</td><td>13:00:00</td><td>NYJ</td><td>NE </td></tr>\n",
       "\t<tr><td>2021091907</td><td>2021</td><td>2</td><td>2021-09-19</td><td>13:00:00</td><td>PHI</td><td>SF </td></tr>\n",
       "\t<tr><td>2021091908</td><td>2021</td><td>2</td><td>2021-09-19</td><td>13:00:00</td><td>PIT</td><td>LV </td></tr>\n",
       "\t<tr><td>2021091909</td><td>2021</td><td>2</td><td>2021-09-19</td><td>16:05:00</td><td>ARI</td><td>MIN</td></tr>\n",
       "\t<tr><td>2021091910</td><td>2021</td><td>2</td><td>2021-09-19</td><td>16:05:00</td><td>TB </td><td>ATL</td></tr>\n",
       "\t<tr><td>2021091911</td><td>2021</td><td>2</td><td>2021-09-19</td><td>16:25:00</td><td>LAC</td><td>DAL</td></tr>\n",
       "\t<tr><td>2021091912</td><td>2021</td><td>2</td><td>2021-09-19</td><td>16:25:00</td><td>SEA</td><td>TEN</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>2021101711</td><td>2021</td><td>6</td><td>2021-10-17</td><td>20:20:00</td><td>PIT</td><td>SEA</td></tr>\n",
       "\t<tr><td>2021101800</td><td>2021</td><td>6</td><td>2021-10-18</td><td>20:15:00</td><td>TEN</td><td>BUF</td></tr>\n",
       "\t<tr><td>2021102100</td><td>2021</td><td>7</td><td>2021-10-21</td><td>20:20:00</td><td>CLE</td><td>DEN</td></tr>\n",
       "\t<tr><td>2021102400</td><td>2021</td><td>7</td><td>2021-10-24</td><td>13:00:00</td><td>BAL</td><td>CIN</td></tr>\n",
       "\t<tr><td>2021102401</td><td>2021</td><td>7</td><td>2021-10-24</td><td>13:00:00</td><td>GB </td><td>WAS</td></tr>\n",
       "\t<tr><td>2021102402</td><td>2021</td><td>7</td><td>2021-10-24</td><td>13:00:00</td><td>MIA</td><td>ATL</td></tr>\n",
       "\t<tr><td>2021102403</td><td>2021</td><td>7</td><td>2021-10-24</td><td>13:00:00</td><td>NE </td><td>NYJ</td></tr>\n",
       "\t<tr><td>2021102404</td><td>2021</td><td>7</td><td>2021-10-24</td><td>13:00:00</td><td>NYG</td><td>CAR</td></tr>\n",
       "\t<tr><td>2021102405</td><td>2021</td><td>7</td><td>2021-10-24</td><td>13:00:00</td><td>TEN</td><td>KC </td></tr>\n",
       "\t<tr><td>2021102406</td><td>2021</td><td>7</td><td>2021-10-24</td><td>16:05:00</td><td>LA </td><td>DET</td></tr>\n",
       "\t<tr><td>2021102407</td><td>2021</td><td>7</td><td>2021-10-24</td><td>16:05:00</td><td>LV </td><td>PHI</td></tr>\n",
       "\t<tr><td>2021102408</td><td>2021</td><td>7</td><td>2021-10-24</td><td>16:25:00</td><td>ARI</td><td>HOU</td></tr>\n",
       "\t<tr><td>2021102409</td><td>2021</td><td>7</td><td>2021-10-24</td><td>16:25:00</td><td>TB </td><td>CHI</td></tr>\n",
       "\t<tr><td>2021102410</td><td>2021</td><td>7</td><td>2021-10-24</td><td>20:20:00</td><td>SF </td><td>IND</td></tr>\n",
       "\t<tr><td>2021102500</td><td>2021</td><td>7</td><td>2021-10-25</td><td>20:15:00</td><td>SEA</td><td>NO </td></tr>\n",
       "\t<tr><td>2021102800</td><td>2021</td><td>8</td><td>2021-10-28</td><td>20:20:00</td><td>ARI</td><td>GB </td></tr>\n",
       "\t<tr><td>2021103100</td><td>2021</td><td>8</td><td>2021-10-31</td><td>13:00:00</td><td>ATL</td><td>CAR</td></tr>\n",
       "\t<tr><td>2021103101</td><td>2021</td><td>8</td><td>2021-10-31</td><td>13:00:00</td><td>BUF</td><td>MIA</td></tr>\n",
       "\t<tr><td>2021103102</td><td>2021</td><td>8</td><td>2021-10-31</td><td>13:00:00</td><td>CHI</td><td>SF </td></tr>\n",
       "\t<tr><td>2021103103</td><td>2021</td><td>8</td><td>2021-10-31</td><td>13:00:00</td><td>CLE</td><td>PIT</td></tr>\n",
       "\t<tr><td>2021103104</td><td>2021</td><td>8</td><td>2021-10-31</td><td>13:00:00</td><td>DET</td><td>PHI</td></tr>\n",
       "\t<tr><td>2021103105</td><td>2021</td><td>8</td><td>2021-10-31</td><td>13:00:00</td><td>HOU</td><td>LA </td></tr>\n",
       "\t<tr><td>2021103106</td><td>2021</td><td>8</td><td>2021-10-31</td><td>13:00:00</td><td>IND</td><td>TEN</td></tr>\n",
       "\t<tr><td>2021103107</td><td>2021</td><td>8</td><td>2021-10-31</td><td>13:00:00</td><td>NYJ</td><td>CIN</td></tr>\n",
       "\t<tr><td>2021103108</td><td>2021</td><td>8</td><td>2021-10-31</td><td>16:05:00</td><td>LAC</td><td>NE </td></tr>\n",
       "\t<tr><td>2021103109</td><td>2021</td><td>8</td><td>2021-10-31</td><td>16:05:00</td><td>SEA</td><td>JAX</td></tr>\n",
       "\t<tr><td>2021103110</td><td>2021</td><td>8</td><td>2021-10-31</td><td>16:25:00</td><td>DEN</td><td>WAS</td></tr>\n",
       "\t<tr><td>2021103111</td><td>2021</td><td>8</td><td>2021-10-31</td><td>16:25:00</td><td>NO </td><td>TB </td></tr>\n",
       "\t<tr><td>2021103112</td><td>2021</td><td>8</td><td>2021-10-31</td><td>20:20:00</td><td>MIN</td><td>DAL</td></tr>\n",
       "\t<tr><td>2021110100</td><td>2021</td><td>8</td><td>2021-11-01</td><td>20:15:00</td><td>KC </td><td>NYG</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 122 × 7\n",
       "\\begin{tabular}{lllllll}\n",
       " game\\_id & season & week & game\\_date & game\\_time\\_eastern & home\\_team\\_abbr & visitor\\_team\\_abbr\\\\\n",
       " <int> & <int> & <int> & <date> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 2021090900 & 2021 & 1 & 2021-09-09 & 20:20:00 & TB  & DAL\\\\\n",
       "\t 2021091200 & 2021 & 1 & 2021-09-12 & 13:00:00 & ATL & PHI\\\\\n",
       "\t 2021091201 & 2021 & 1 & 2021-09-12 & 13:00:00 & BUF & PIT\\\\\n",
       "\t 2021091202 & 2021 & 1 & 2021-09-12 & 13:00:00 & CAR & NYJ\\\\\n",
       "\t 2021091203 & 2021 & 1 & 2021-09-12 & 13:00:00 & CIN & MIN\\\\\n",
       "\t 2021091204 & 2021 & 1 & 2021-09-12 & 13:00:00 & DET & SF \\\\\n",
       "\t 2021091205 & 2021 & 1 & 2021-09-12 & 13:00:00 & HOU & JAX\\\\\n",
       "\t 2021091206 & 2021 & 1 & 2021-09-12 & 13:00:00 & IND & SEA\\\\\n",
       "\t 2021091207 & 2021 & 1 & 2021-09-12 & 13:00:00 & TEN & ARI\\\\\n",
       "\t 2021091208 & 2021 & 1 & 2021-09-12 & 13:00:00 & WAS & LAC\\\\\n",
       "\t 2021091209 & 2021 & 1 & 2021-09-12 & 16:25:00 & KC  & CLE\\\\\n",
       "\t 2021091210 & 2021 & 1 & 2021-09-12 & 16:25:00 & NE  & MIA\\\\\n",
       "\t 2021091211 & 2021 & 1 & 2021-09-12 & 16:25:00 & NO  & GB \\\\\n",
       "\t 2021091212 & 2021 & 1 & 2021-09-12 & 16:25:00 & NYG & DEN\\\\\n",
       "\t 2021091213 & 2021 & 1 & 2021-09-12 & 20:20:00 & LA  & CHI\\\\\n",
       "\t 2021091300 & 2021 & 1 & 2021-09-13 & 20:15:00 & LV  & BAL\\\\\n",
       "\t 2021091600 & 2021 & 2 & 2021-09-16 & 20:20:00 & WAS & NYG\\\\\n",
       "\t 2021091900 & 2021 & 2 & 2021-09-19 & 13:00:00 & CAR & NO \\\\\n",
       "\t 2021091901 & 2021 & 2 & 2021-09-19 & 13:00:00 & CHI & CIN\\\\\n",
       "\t 2021091902 & 2021 & 2 & 2021-09-19 & 13:00:00 & CLE & HOU\\\\\n",
       "\t 2021091903 & 2021 & 2 & 2021-09-19 & 13:00:00 & IND & LA \\\\\n",
       "\t 2021091904 & 2021 & 2 & 2021-09-19 & 13:00:00 & JAX & DEN\\\\\n",
       "\t 2021091905 & 2021 & 2 & 2021-09-19 & 13:00:00 & MIA & BUF\\\\\n",
       "\t 2021091906 & 2021 & 2 & 2021-09-19 & 13:00:00 & NYJ & NE \\\\\n",
       "\t 2021091907 & 2021 & 2 & 2021-09-19 & 13:00:00 & PHI & SF \\\\\n",
       "\t 2021091908 & 2021 & 2 & 2021-09-19 & 13:00:00 & PIT & LV \\\\\n",
       "\t 2021091909 & 2021 & 2 & 2021-09-19 & 16:05:00 & ARI & MIN\\\\\n",
       "\t 2021091910 & 2021 & 2 & 2021-09-19 & 16:05:00 & TB  & ATL\\\\\n",
       "\t 2021091911 & 2021 & 2 & 2021-09-19 & 16:25:00 & LAC & DAL\\\\\n",
       "\t 2021091912 & 2021 & 2 & 2021-09-19 & 16:25:00 & SEA & TEN\\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t 2021101711 & 2021 & 6 & 2021-10-17 & 20:20:00 & PIT & SEA\\\\\n",
       "\t 2021101800 & 2021 & 6 & 2021-10-18 & 20:15:00 & TEN & BUF\\\\\n",
       "\t 2021102100 & 2021 & 7 & 2021-10-21 & 20:20:00 & CLE & DEN\\\\\n",
       "\t 2021102400 & 2021 & 7 & 2021-10-24 & 13:00:00 & BAL & CIN\\\\\n",
       "\t 2021102401 & 2021 & 7 & 2021-10-24 & 13:00:00 & GB  & WAS\\\\\n",
       "\t 2021102402 & 2021 & 7 & 2021-10-24 & 13:00:00 & MIA & ATL\\\\\n",
       "\t 2021102403 & 2021 & 7 & 2021-10-24 & 13:00:00 & NE  & NYJ\\\\\n",
       "\t 2021102404 & 2021 & 7 & 2021-10-24 & 13:00:00 & NYG & CAR\\\\\n",
       "\t 2021102405 & 2021 & 7 & 2021-10-24 & 13:00:00 & TEN & KC \\\\\n",
       "\t 2021102406 & 2021 & 7 & 2021-10-24 & 16:05:00 & LA  & DET\\\\\n",
       "\t 2021102407 & 2021 & 7 & 2021-10-24 & 16:05:00 & LV  & PHI\\\\\n",
       "\t 2021102408 & 2021 & 7 & 2021-10-24 & 16:25:00 & ARI & HOU\\\\\n",
       "\t 2021102409 & 2021 & 7 & 2021-10-24 & 16:25:00 & TB  & CHI\\\\\n",
       "\t 2021102410 & 2021 & 7 & 2021-10-24 & 20:20:00 & SF  & IND\\\\\n",
       "\t 2021102500 & 2021 & 7 & 2021-10-25 & 20:15:00 & SEA & NO \\\\\n",
       "\t 2021102800 & 2021 & 8 & 2021-10-28 & 20:20:00 & ARI & GB \\\\\n",
       "\t 2021103100 & 2021 & 8 & 2021-10-31 & 13:00:00 & ATL & CAR\\\\\n",
       "\t 2021103101 & 2021 & 8 & 2021-10-31 & 13:00:00 & BUF & MIA\\\\\n",
       "\t 2021103102 & 2021 & 8 & 2021-10-31 & 13:00:00 & CHI & SF \\\\\n",
       "\t 2021103103 & 2021 & 8 & 2021-10-31 & 13:00:00 & CLE & PIT\\\\\n",
       "\t 2021103104 & 2021 & 8 & 2021-10-31 & 13:00:00 & DET & PHI\\\\\n",
       "\t 2021103105 & 2021 & 8 & 2021-10-31 & 13:00:00 & HOU & LA \\\\\n",
       "\t 2021103106 & 2021 & 8 & 2021-10-31 & 13:00:00 & IND & TEN\\\\\n",
       "\t 2021103107 & 2021 & 8 & 2021-10-31 & 13:00:00 & NYJ & CIN\\\\\n",
       "\t 2021103108 & 2021 & 8 & 2021-10-31 & 16:05:00 & LAC & NE \\\\\n",
       "\t 2021103109 & 2021 & 8 & 2021-10-31 & 16:05:00 & SEA & JAX\\\\\n",
       "\t 2021103110 & 2021 & 8 & 2021-10-31 & 16:25:00 & DEN & WAS\\\\\n",
       "\t 2021103111 & 2021 & 8 & 2021-10-31 & 16:25:00 & NO  & TB \\\\\n",
       "\t 2021103112 & 2021 & 8 & 2021-10-31 & 20:20:00 & MIN & DAL\\\\\n",
       "\t 2021110100 & 2021 & 8 & 2021-11-01 & 20:15:00 & KC  & NYG\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 122 × 7\n",
       "\n",
       "| game_id &lt;int&gt; | season &lt;int&gt; | week &lt;int&gt; | game_date &lt;date&gt; | game_time_eastern &lt;chr&gt; | home_team_abbr &lt;chr&gt; | visitor_team_abbr &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 2021090900 | 2021 | 1 | 2021-09-09 | 20:20:00 | TB  | DAL |\n",
       "| 2021091200 | 2021 | 1 | 2021-09-12 | 13:00:00 | ATL | PHI |\n",
       "| 2021091201 | 2021 | 1 | 2021-09-12 | 13:00:00 | BUF | PIT |\n",
       "| 2021091202 | 2021 | 1 | 2021-09-12 | 13:00:00 | CAR | NYJ |\n",
       "| 2021091203 | 2021 | 1 | 2021-09-12 | 13:00:00 | CIN | MIN |\n",
       "| 2021091204 | 2021 | 1 | 2021-09-12 | 13:00:00 | DET | SF  |\n",
       "| 2021091205 | 2021 | 1 | 2021-09-12 | 13:00:00 | HOU | JAX |\n",
       "| 2021091206 | 2021 | 1 | 2021-09-12 | 13:00:00 | IND | SEA |\n",
       "| 2021091207 | 2021 | 1 | 2021-09-12 | 13:00:00 | TEN | ARI |\n",
       "| 2021091208 | 2021 | 1 | 2021-09-12 | 13:00:00 | WAS | LAC |\n",
       "| 2021091209 | 2021 | 1 | 2021-09-12 | 16:25:00 | KC  | CLE |\n",
       "| 2021091210 | 2021 | 1 | 2021-09-12 | 16:25:00 | NE  | MIA |\n",
       "| 2021091211 | 2021 | 1 | 2021-09-12 | 16:25:00 | NO  | GB  |\n",
       "| 2021091212 | 2021 | 1 | 2021-09-12 | 16:25:00 | NYG | DEN |\n",
       "| 2021091213 | 2021 | 1 | 2021-09-12 | 20:20:00 | LA  | CHI |\n",
       "| 2021091300 | 2021 | 1 | 2021-09-13 | 20:15:00 | LV  | BAL |\n",
       "| 2021091600 | 2021 | 2 | 2021-09-16 | 20:20:00 | WAS | NYG |\n",
       "| 2021091900 | 2021 | 2 | 2021-09-19 | 13:00:00 | CAR | NO  |\n",
       "| 2021091901 | 2021 | 2 | 2021-09-19 | 13:00:00 | CHI | CIN |\n",
       "| 2021091902 | 2021 | 2 | 2021-09-19 | 13:00:00 | CLE | HOU |\n",
       "| 2021091903 | 2021 | 2 | 2021-09-19 | 13:00:00 | IND | LA  |\n",
       "| 2021091904 | 2021 | 2 | 2021-09-19 | 13:00:00 | JAX | DEN |\n",
       "| 2021091905 | 2021 | 2 | 2021-09-19 | 13:00:00 | MIA | BUF |\n",
       "| 2021091906 | 2021 | 2 | 2021-09-19 | 13:00:00 | NYJ | NE  |\n",
       "| 2021091907 | 2021 | 2 | 2021-09-19 | 13:00:00 | PHI | SF  |\n",
       "| 2021091908 | 2021 | 2 | 2021-09-19 | 13:00:00 | PIT | LV  |\n",
       "| 2021091909 | 2021 | 2 | 2021-09-19 | 16:05:00 | ARI | MIN |\n",
       "| 2021091910 | 2021 | 2 | 2021-09-19 | 16:05:00 | TB  | ATL |\n",
       "| 2021091911 | 2021 | 2 | 2021-09-19 | 16:25:00 | LAC | DAL |\n",
       "| 2021091912 | 2021 | 2 | 2021-09-19 | 16:25:00 | SEA | TEN |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 2021101711 | 2021 | 6 | 2021-10-17 | 20:20:00 | PIT | SEA |\n",
       "| 2021101800 | 2021 | 6 | 2021-10-18 | 20:15:00 | TEN | BUF |\n",
       "| 2021102100 | 2021 | 7 | 2021-10-21 | 20:20:00 | CLE | DEN |\n",
       "| 2021102400 | 2021 | 7 | 2021-10-24 | 13:00:00 | BAL | CIN |\n",
       "| 2021102401 | 2021 | 7 | 2021-10-24 | 13:00:00 | GB  | WAS |\n",
       "| 2021102402 | 2021 | 7 | 2021-10-24 | 13:00:00 | MIA | ATL |\n",
       "| 2021102403 | 2021 | 7 | 2021-10-24 | 13:00:00 | NE  | NYJ |\n",
       "| 2021102404 | 2021 | 7 | 2021-10-24 | 13:00:00 | NYG | CAR |\n",
       "| 2021102405 | 2021 | 7 | 2021-10-24 | 13:00:00 | TEN | KC  |\n",
       "| 2021102406 | 2021 | 7 | 2021-10-24 | 16:05:00 | LA  | DET |\n",
       "| 2021102407 | 2021 | 7 | 2021-10-24 | 16:05:00 | LV  | PHI |\n",
       "| 2021102408 | 2021 | 7 | 2021-10-24 | 16:25:00 | ARI | HOU |\n",
       "| 2021102409 | 2021 | 7 | 2021-10-24 | 16:25:00 | TB  | CHI |\n",
       "| 2021102410 | 2021 | 7 | 2021-10-24 | 20:20:00 | SF  | IND |\n",
       "| 2021102500 | 2021 | 7 | 2021-10-25 | 20:15:00 | SEA | NO  |\n",
       "| 2021102800 | 2021 | 8 | 2021-10-28 | 20:20:00 | ARI | GB  |\n",
       "| 2021103100 | 2021 | 8 | 2021-10-31 | 13:00:00 | ATL | CAR |\n",
       "| 2021103101 | 2021 | 8 | 2021-10-31 | 13:00:00 | BUF | MIA |\n",
       "| 2021103102 | 2021 | 8 | 2021-10-31 | 13:00:00 | CHI | SF  |\n",
       "| 2021103103 | 2021 | 8 | 2021-10-31 | 13:00:00 | CLE | PIT |\n",
       "| 2021103104 | 2021 | 8 | 2021-10-31 | 13:00:00 | DET | PHI |\n",
       "| 2021103105 | 2021 | 8 | 2021-10-31 | 13:00:00 | HOU | LA  |\n",
       "| 2021103106 | 2021 | 8 | 2021-10-31 | 13:00:00 | IND | TEN |\n",
       "| 2021103107 | 2021 | 8 | 2021-10-31 | 13:00:00 | NYJ | CIN |\n",
       "| 2021103108 | 2021 | 8 | 2021-10-31 | 16:05:00 | LAC | NE  |\n",
       "| 2021103109 | 2021 | 8 | 2021-10-31 | 16:05:00 | SEA | JAX |\n",
       "| 2021103110 | 2021 | 8 | 2021-10-31 | 16:25:00 | DEN | WAS |\n",
       "| 2021103111 | 2021 | 8 | 2021-10-31 | 16:25:00 | NO  | TB  |\n",
       "| 2021103112 | 2021 | 8 | 2021-10-31 | 20:20:00 | MIN | DAL |\n",
       "| 2021110100 | 2021 | 8 | 2021-11-01 | 20:15:00 | KC  | NYG |\n",
       "\n"
      ],
      "text/plain": [
       "    game_id    season week game_date  game_time_eastern home_team_abbr\n",
       "1   2021090900 2021   1    2021-09-09 20:20:00          TB            \n",
       "2   2021091200 2021   1    2021-09-12 13:00:00          ATL           \n",
       "3   2021091201 2021   1    2021-09-12 13:00:00          BUF           \n",
       "4   2021091202 2021   1    2021-09-12 13:00:00          CAR           \n",
       "5   2021091203 2021   1    2021-09-12 13:00:00          CIN           \n",
       "6   2021091204 2021   1    2021-09-12 13:00:00          DET           \n",
       "7   2021091205 2021   1    2021-09-12 13:00:00          HOU           \n",
       "8   2021091206 2021   1    2021-09-12 13:00:00          IND           \n",
       "9   2021091207 2021   1    2021-09-12 13:00:00          TEN           \n",
       "10  2021091208 2021   1    2021-09-12 13:00:00          WAS           \n",
       "11  2021091209 2021   1    2021-09-12 16:25:00          KC            \n",
       "12  2021091210 2021   1    2021-09-12 16:25:00          NE            \n",
       "13  2021091211 2021   1    2021-09-12 16:25:00          NO            \n",
       "14  2021091212 2021   1    2021-09-12 16:25:00          NYG           \n",
       "15  2021091213 2021   1    2021-09-12 20:20:00          LA            \n",
       "16  2021091300 2021   1    2021-09-13 20:15:00          LV            \n",
       "17  2021091600 2021   2    2021-09-16 20:20:00          WAS           \n",
       "18  2021091900 2021   2    2021-09-19 13:00:00          CAR           \n",
       "19  2021091901 2021   2    2021-09-19 13:00:00          CHI           \n",
       "20  2021091902 2021   2    2021-09-19 13:00:00          CLE           \n",
       "21  2021091903 2021   2    2021-09-19 13:00:00          IND           \n",
       "22  2021091904 2021   2    2021-09-19 13:00:00          JAX           \n",
       "23  2021091905 2021   2    2021-09-19 13:00:00          MIA           \n",
       "24  2021091906 2021   2    2021-09-19 13:00:00          NYJ           \n",
       "25  2021091907 2021   2    2021-09-19 13:00:00          PHI           \n",
       "26  2021091908 2021   2    2021-09-19 13:00:00          PIT           \n",
       "27  2021091909 2021   2    2021-09-19 16:05:00          ARI           \n",
       "28  2021091910 2021   2    2021-09-19 16:05:00          TB            \n",
       "29  2021091911 2021   2    2021-09-19 16:25:00          LAC           \n",
       "30  2021091912 2021   2    2021-09-19 16:25:00          SEA           \n",
       "⋮   ⋮          ⋮      ⋮    ⋮          ⋮                 ⋮             \n",
       "93  2021101711 2021   6    2021-10-17 20:20:00          PIT           \n",
       "94  2021101800 2021   6    2021-10-18 20:15:00          TEN           \n",
       "95  2021102100 2021   7    2021-10-21 20:20:00          CLE           \n",
       "96  2021102400 2021   7    2021-10-24 13:00:00          BAL           \n",
       "97  2021102401 2021   7    2021-10-24 13:00:00          GB            \n",
       "98  2021102402 2021   7    2021-10-24 13:00:00          MIA           \n",
       "99  2021102403 2021   7    2021-10-24 13:00:00          NE            \n",
       "100 2021102404 2021   7    2021-10-24 13:00:00          NYG           \n",
       "101 2021102405 2021   7    2021-10-24 13:00:00          TEN           \n",
       "102 2021102406 2021   7    2021-10-24 16:05:00          LA            \n",
       "103 2021102407 2021   7    2021-10-24 16:05:00          LV            \n",
       "104 2021102408 2021   7    2021-10-24 16:25:00          ARI           \n",
       "105 2021102409 2021   7    2021-10-24 16:25:00          TB            \n",
       "106 2021102410 2021   7    2021-10-24 20:20:00          SF            \n",
       "107 2021102500 2021   7    2021-10-25 20:15:00          SEA           \n",
       "108 2021102800 2021   8    2021-10-28 20:20:00          ARI           \n",
       "109 2021103100 2021   8    2021-10-31 13:00:00          ATL           \n",
       "110 2021103101 2021   8    2021-10-31 13:00:00          BUF           \n",
       "111 2021103102 2021   8    2021-10-31 13:00:00          CHI           \n",
       "112 2021103103 2021   8    2021-10-31 13:00:00          CLE           \n",
       "113 2021103104 2021   8    2021-10-31 13:00:00          DET           \n",
       "114 2021103105 2021   8    2021-10-31 13:00:00          HOU           \n",
       "115 2021103106 2021   8    2021-10-31 13:00:00          IND           \n",
       "116 2021103107 2021   8    2021-10-31 13:00:00          NYJ           \n",
       "117 2021103108 2021   8    2021-10-31 16:05:00          LAC           \n",
       "118 2021103109 2021   8    2021-10-31 16:05:00          SEA           \n",
       "119 2021103110 2021   8    2021-10-31 16:25:00          DEN           \n",
       "120 2021103111 2021   8    2021-10-31 16:25:00          NO            \n",
       "121 2021103112 2021   8    2021-10-31 20:20:00          MIN           \n",
       "122 2021110100 2021   8    2021-11-01 20:15:00          KC            \n",
       "    visitor_team_abbr\n",
       "1   DAL              \n",
       "2   PHI              \n",
       "3   PIT              \n",
       "4   NYJ              \n",
       "5   MIN              \n",
       "6   SF               \n",
       "7   JAX              \n",
       "8   SEA              \n",
       "9   ARI              \n",
       "10  LAC              \n",
       "11  CLE              \n",
       "12  MIA              \n",
       "13  GB               \n",
       "14  DEN              \n",
       "15  CHI              \n",
       "16  BAL              \n",
       "17  NYG              \n",
       "18  NO               \n",
       "19  CIN              \n",
       "20  HOU              \n",
       "21  LA               \n",
       "22  DEN              \n",
       "23  BUF              \n",
       "24  NE               \n",
       "25  SF               \n",
       "26  LV               \n",
       "27  MIN              \n",
       "28  ATL              \n",
       "29  DAL              \n",
       "30  TEN              \n",
       "⋮   ⋮                \n",
       "93  SEA              \n",
       "94  BUF              \n",
       "95  DEN              \n",
       "96  CIN              \n",
       "97  WAS              \n",
       "98  ATL              \n",
       "99  NYJ              \n",
       "100 CAR              \n",
       "101 KC               \n",
       "102 DET              \n",
       "103 PHI              \n",
       "104 HOU              \n",
       "105 CHI              \n",
       "106 IND              \n",
       "107 NO               \n",
       "108 GB               \n",
       "109 CAR              \n",
       "110 MIA              \n",
       "111 SF               \n",
       "112 PIT              \n",
       "113 PHI              \n",
       "114 LA               \n",
       "115 TEN              \n",
       "116 CIN              \n",
       "117 NE               \n",
       "118 JAX              \n",
       "119 WAS              \n",
       "120 TB               \n",
       "121 DAL              \n",
       "122 NYG              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "str(games_data)\n",
    "games_data <- clean_names(games_data)\n",
    "games_data$game_date <- as.Date(games_data$game_date, \"%m/%d/%Y\")\n",
    "View(games_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0773abe9",
   "metadata": {
    "papermill": {
     "duration": 0.007583,
     "end_time": "2022-12-20T20:20:58.273044",
     "exception": false,
     "start_time": "2022-12-20T20:20:58.265461",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Again, we use clean_names() for column names and then find the number of players playing in the NFL by position using the count() function."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "10977cc3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:20:58.296958Z",
     "iopub.status.busy": "2022-12-20T20:20:58.295406Z",
     "iopub.status.idle": "2022-12-20T20:20:58.369555Z",
     "shell.execute_reply": "2022-12-20T20:20:58.367844Z"
    },
    "papermill": {
     "duration": 0.092103,
     "end_time": "2022-12-20T20:20:58.372371",
     "exception": false,
     "start_time": "2022-12-20T20:20:58.280268",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t1679 obs. of  7 variables:\n",
      " $ nflId           : int  25511 28963 29550 29851 30078 30842 30869 33084 33107 33130 ...\n",
      " $ height          : chr  \"6-4\" \"6-5\" \"6-4\" \"6-2\" ...\n",
      " $ weight          : int  225 240 328 225 228 267 330 217 315 175 ...\n",
      " $ birthDate       : chr  \"1977-08-03\" \"1982-03-02\" \"1982-01-22\" \"1983-12-02\" ...\n",
      " $ collegeName     : chr  \"Michigan\" \"Miami, O.\" \"Arkansas\" \"California\" ...\n",
      " $ officialPosition: chr  \"QB\" \"QB\" \"T\" \"QB\" ...\n",
      " $ displayName     : chr  \"Tom Brady\" \"Ben Roethlisberger\" \"Jason Peters\" \"Aaron Rodgers\" ...\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 19 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>official_position</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>C  </td><td> 55</td></tr>\n",
       "\t<tr><td>CB </td><td>192</td></tr>\n",
       "\t<tr><td>DB </td><td>  2</td></tr>\n",
       "\t<tr><td>DE </td><td>142</td></tr>\n",
       "\t<tr><td>DT </td><td>114</td></tr>\n",
       "\t<tr><td>FB </td><td> 15</td></tr>\n",
       "\t<tr><td>FS </td><td> 72</td></tr>\n",
       "\t<tr><td>G  </td><td> 99</td></tr>\n",
       "\t<tr><td>ILB</td><td> 81</td></tr>\n",
       "\t<tr><td>LB </td><td>  2</td></tr>\n",
       "\t<tr><td>MLB</td><td> 27</td></tr>\n",
       "\t<tr><td>NT </td><td> 34</td></tr>\n",
       "\t<tr><td>OLB</td><td>136</td></tr>\n",
       "\t<tr><td>QB </td><td> 60</td></tr>\n",
       "\t<tr><td>RB </td><td>126</td></tr>\n",
       "\t<tr><td>SS </td><td> 69</td></tr>\n",
       "\t<tr><td>T  </td><td>122</td></tr>\n",
       "\t<tr><td>TE </td><td>121</td></tr>\n",
       "\t<tr><td>WR </td><td>210</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 19 × 2\n",
       "\\begin{tabular}{ll}\n",
       " official\\_position & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t C   &  55\\\\\n",
       "\t CB  & 192\\\\\n",
       "\t DB  &   2\\\\\n",
       "\t DE  & 142\\\\\n",
       "\t DT  & 114\\\\\n",
       "\t FB  &  15\\\\\n",
       "\t FS  &  72\\\\\n",
       "\t G   &  99\\\\\n",
       "\t ILB &  81\\\\\n",
       "\t LB  &   2\\\\\n",
       "\t MLB &  27\\\\\n",
       "\t NT  &  34\\\\\n",
       "\t OLB & 136\\\\\n",
       "\t QB  &  60\\\\\n",
       "\t RB  & 126\\\\\n",
       "\t SS  &  69\\\\\n",
       "\t T   & 122\\\\\n",
       "\t TE  & 121\\\\\n",
       "\t WR  & 210\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 19 × 2\n",
       "\n",
       "| official_position &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| C   |  55 |\n",
       "| CB  | 192 |\n",
       "| DB  |   2 |\n",
       "| DE  | 142 |\n",
       "| DT  | 114 |\n",
       "| FB  |  15 |\n",
       "| FS  |  72 |\n",
       "| G   |  99 |\n",
       "| ILB |  81 |\n",
       "| LB  |   2 |\n",
       "| MLB |  27 |\n",
       "| NT  |  34 |\n",
       "| OLB | 136 |\n",
       "| QB  |  60 |\n",
       "| RB  | 126 |\n",
       "| SS  |  69 |\n",
       "| T   | 122 |\n",
       "| TE  | 121 |\n",
       "| WR  | 210 |\n",
       "\n"
      ],
      "text/plain": [
       "   official_position n  \n",
       "1  C                  55\n",
       "2  CB                192\n",
       "3  DB                  2\n",
       "4  DE                142\n",
       "5  DT                114\n",
       "6  FB                 15\n",
       "7  FS                 72\n",
       "8  G                  99\n",
       "9  ILB                81\n",
       "10 LB                  2\n",
       "11 MLB                27\n",
       "12 NT                 34\n",
       "13 OLB               136\n",
       "14 QB                 60\n",
       "15 RB                126\n",
       "16 SS                 69\n",
       "17 T                 122\n",
       "18 TE                121\n",
       "19 WR                210"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "str(players_data)\n",
    "players_data <- clean_names(players_data)\n",
    "players_data %>% count(official_position)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ed6dab78",
   "metadata": {
    "papermill": {
     "duration": 0.007936,
     "end_time": "2022-12-20T20:20:58.388559",
     "exception": false,
     "start_time": "2022-12-20T20:20:58.380623",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The offensive line typically consists of one center, two guards and two tackles. At the start of the 2021 season, there were 55 players listed as center (C), 99 guards (G) and 122 offensive tackles (T).\n",
    "\n",
    "I also wanted to find out player BMI, and if it has an influence on player performance in their respective positions. To do that, we have to convert player heights to inches to allow for calculations.\n",
    "\n",
    "Installing the measurements package allows me to convert the height column, which is in feet and inches into inches."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "ed94fb6e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:20:58.407522Z",
     "iopub.status.busy": "2022-12-20T20:20:58.406009Z",
     "iopub.status.idle": "2022-12-20T20:21:13.971632Z",
     "shell.execute_reply": "2022-12-20T20:21:13.969262Z"
    },
    "papermill": {
     "duration": 15.578591,
     "end_time": "2022-12-20T20:21:13.974518",
     "exception": false,
     "start_time": "2022-12-20T20:20:58.395927",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    }
   ],
   "source": [
    "install.packages(\"measurements\")\n",
    "library(measurements)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "921984a9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:21:13.993159Z",
     "iopub.status.busy": "2022-12-20T20:21:13.991505Z",
     "iopub.status.idle": "2022-12-20T20:21:14.118448Z",
     "shell.execute_reply": "2022-12-20T20:21:14.116732Z"
    },
    "papermill": {
     "duration": 0.138933,
     "end_time": "2022-12-20T20:21:14.121107",
     "exception": false,
     "start_time": "2022-12-20T20:21:13.982174",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "players_data <- players_data %>% \n",
    "  separate(height,c('feet', 'inches'), sep = '-', convert = TRUE, remove = FALSE) %>%\n",
    "      mutate(height_inches = 12*feet + inches) %>%\n",
    "      select(-inches) %>%\n",
    "      select(-feet) %>% \n",
    "      select(-height)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "688badf2",
   "metadata": {
    "papermill": {
     "duration": 0.008625,
     "end_time": "2022-12-20T20:21:14.138204",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.129579",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "After converting height to inches, we then calculate players' BMI."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "e8051db2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:21:14.157707Z",
     "iopub.status.busy": "2022-12-20T20:21:14.156143Z",
     "iopub.status.idle": "2022-12-20T20:21:14.172371Z",
     "shell.execute_reply": "2022-12-20T20:21:14.170466Z"
    },
    "papermill": {
     "duration": 0.028693,
     "end_time": "2022-12-20T20:21:14.174873",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.146180",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "players_data <- mutate(players_data, bmi = (players_data$weight*703)/(players_data$height_inches*players_data$height_inches))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6e451812",
   "metadata": {
    "papermill": {
     "duration": 0.00999,
     "end_time": "2022-12-20T20:21:14.192524",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.182534",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "To make the data in the BMI column clean and consistent, we round it off to two decimal places.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "204d7a65",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:21:14.215101Z",
     "iopub.status.busy": "2022-12-20T20:21:14.213421Z",
     "iopub.status.idle": "2022-12-20T20:21:14.248024Z",
     "shell.execute_reply": "2022-12-20T20:21:14.245979Z"
    },
    "papermill": {
     "duration": 0.048975,
     "end_time": "2022-12-20T20:21:14.250897",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.201922",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>nfl_id</th><th scope=col>weight</th><th scope=col>birth_date</th><th scope=col>college_name</th><th scope=col>official_position</th><th scope=col>display_name</th><th scope=col>height_inches</th><th scope=col>bmi</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>25511</td><td>225</td><td>1977-08-03</td><td>Michigan  </td><td>QB</td><td>Tom Brady         </td><td>76</td><td>27.38</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>28963</td><td>240</td><td>1982-03-02</td><td>Miami, O. </td><td>QB</td><td>Ben Roethlisberger</td><td>77</td><td>28.46</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>29550</td><td>328</td><td>1982-01-22</td><td>Arkansas  </td><td>T </td><td>Jason Peters      </td><td>76</td><td>39.92</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>29851</td><td>225</td><td>1983-12-02</td><td>California</td><td>QB</td><td>Aaron Rodgers     </td><td>74</td><td>28.89</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>30078</td><td>228</td><td>1982-11-24</td><td>Harvard   </td><td>QB</td><td>Ryan Fitzpatrick  </td><td>74</td><td>29.27</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>30842</td><td>267</td><td>1984-05-19</td><td>UCLA      </td><td>TE</td><td>Marcedes Lewis    </td><td>78</td><td>30.85</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & nfl\\_id & weight & birth\\_date & college\\_name & official\\_position & display\\_name & height\\_inches & bmi\\\\\n",
       "  & <int> & <int> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 25511 & 225 & 1977-08-03 & Michigan   & QB & Tom Brady          & 76 & 27.38\\\\\n",
       "\t2 & 28963 & 240 & 1982-03-02 & Miami, O.  & QB & Ben Roethlisberger & 77 & 28.46\\\\\n",
       "\t3 & 29550 & 328 & 1982-01-22 & Arkansas   & T  & Jason Peters       & 76 & 39.92\\\\\n",
       "\t4 & 29851 & 225 & 1983-12-02 & California & QB & Aaron Rodgers      & 74 & 28.89\\\\\n",
       "\t5 & 30078 & 228 & 1982-11-24 & Harvard    & QB & Ryan Fitzpatrick   & 74 & 29.27\\\\\n",
       "\t6 & 30842 & 267 & 1984-05-19 & UCLA       & TE & Marcedes Lewis     & 78 & 30.85\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 8\n",
       "\n",
       "| <!--/--> | nfl_id &lt;int&gt; | weight &lt;int&gt; | birth_date &lt;chr&gt; | college_name &lt;chr&gt; | official_position &lt;chr&gt; | display_name &lt;chr&gt; | height_inches &lt;dbl&gt; | bmi &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 25511 | 225 | 1977-08-03 | Michigan   | QB | Tom Brady          | 76 | 27.38 |\n",
       "| 2 | 28963 | 240 | 1982-03-02 | Miami, O.  | QB | Ben Roethlisberger | 77 | 28.46 |\n",
       "| 3 | 29550 | 328 | 1982-01-22 | Arkansas   | T  | Jason Peters       | 76 | 39.92 |\n",
       "| 4 | 29851 | 225 | 1983-12-02 | California | QB | Aaron Rodgers      | 74 | 28.89 |\n",
       "| 5 | 30078 | 228 | 1982-11-24 | Harvard    | QB | Ryan Fitzpatrick   | 74 | 29.27 |\n",
       "| 6 | 30842 | 267 | 1984-05-19 | UCLA       | TE | Marcedes Lewis     | 78 | 30.85 |\n",
       "\n"
      ],
      "text/plain": [
       "  nfl_id weight birth_date college_name official_position display_name      \n",
       "1 25511  225    1977-08-03 Michigan     QB                Tom Brady         \n",
       "2 28963  240    1982-03-02 Miami, O.    QB                Ben Roethlisberger\n",
       "3 29550  328    1982-01-22 Arkansas     T                 Jason Peters      \n",
       "4 29851  225    1983-12-02 California   QB                Aaron Rodgers     \n",
       "5 30078  228    1982-11-24 Harvard      QB                Ryan Fitzpatrick  \n",
       "6 30842  267    1984-05-19 UCLA         TE                Marcedes Lewis    \n",
       "  height_inches bmi  \n",
       "1 76            27.38\n",
       "2 77            28.46\n",
       "3 76            39.92\n",
       "4 74            28.89\n",
       "5 74            29.27\n",
       "6 78            30.85"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "players_data$bmi <- round(players_data$bmi, digits = 2)\n",
    "head(players_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0b8498a9",
   "metadata": {
    "papermill": {
     "duration": 0.008582,
     "end_time": "2022-12-20T20:21:14.267983",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.259401",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Let's clean the plays_data dataframe by using the clean_names () formula."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "5fa5de99",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:21:14.288161Z",
     "iopub.status.busy": "2022-12-20T20:21:14.286391Z",
     "iopub.status.idle": "2022-12-20T20:21:14.333971Z",
     "shell.execute_reply": "2022-12-20T20:21:14.332050Z"
    },
    "papermill": {
     "duration": 0.060574,
     "end_time": "2022-12-20T20:21:14.336461",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.275887",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "plays_data <- clean_names(plays_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9f9d9c62",
   "metadata": {
    "papermill": {
     "duration": 0.007938,
     "end_time": "2022-12-20T20:21:14.352428",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.344490",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Let's create an aggregate table counting the number of designed pass plays that resulted in pass completions (C), incomplete passes(I), interceptions (IN), sacks (S) and scrambled quarterback runs from every team in each NFL game in the first eight weeks of the 2021 season."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "8b338c94",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:21:14.372450Z",
     "iopub.status.busy": "2022-12-20T20:21:14.370617Z",
     "iopub.status.idle": "2022-12-20T20:21:14.413500Z",
     "shell.execute_reply": "2022-12-20T20:21:14.411046Z"
    },
    "papermill": {
     "duration": 0.057106,
     "end_time": "2022-12-20T20:21:14.417318",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.360212",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "agg_tbl <- plays_data %>% group_by(game_id, possession_team, pass_result) %>% \n",
    "  summarise(count=n(),\n",
    "  .groups = 'drop')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "2f884937",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:21:14.437843Z",
     "iopub.status.busy": "2022-12-20T20:21:14.436032Z",
     "iopub.status.idle": "2022-12-20T20:21:14.467694Z",
     "shell.execute_reply": "2022-12-20T20:21:14.465046Z"
    },
    "papermill": {
     "duration": 0.04569,
     "end_time": "2022-12-20T20:21:14.471177",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.425487",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>game_id</th><th scope=col>possession_team</th><th scope=col>pass_result</th><th scope=col>count</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2021090900</td><td>DAL</td><td>C </td><td>33</td></tr>\n",
       "\t<tr><td>2021090900</td><td>DAL</td><td>I </td><td>15</td></tr>\n",
       "\t<tr><td>2021090900</td><td>DAL</td><td>IN</td><td> 1</td></tr>\n",
       "\t<tr><td>2021090900</td><td>DAL</td><td>R </td><td> 3</td></tr>\n",
       "\t<tr><td>2021090900</td><td>DAL</td><td>S </td><td> 1</td></tr>\n",
       "\t<tr><td>2021090900</td><td>TB </td><td>C </td><td>27</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 4\n",
       "\\begin{tabular}{llll}\n",
       " game\\_id & possession\\_team & pass\\_result & count\\\\\n",
       " <int> & <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t 2021090900 & DAL & C  & 33\\\\\n",
       "\t 2021090900 & DAL & I  & 15\\\\\n",
       "\t 2021090900 & DAL & IN &  1\\\\\n",
       "\t 2021090900 & DAL & R  &  3\\\\\n",
       "\t 2021090900 & DAL & S  &  1\\\\\n",
       "\t 2021090900 & TB  & C  & 27\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 4\n",
       "\n",
       "| game_id &lt;int&gt; | possession_team &lt;chr&gt; | pass_result &lt;chr&gt; | count &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 2021090900 | DAL | C  | 33 |\n",
       "| 2021090900 | DAL | I  | 15 |\n",
       "| 2021090900 | DAL | IN |  1 |\n",
       "| 2021090900 | DAL | R  |  3 |\n",
       "| 2021090900 | DAL | S  |  1 |\n",
       "| 2021090900 | TB  | C  | 27 |\n",
       "\n"
      ],
      "text/plain": [
       "  game_id    possession_team pass_result count\n",
       "1 2021090900 DAL             C           33   \n",
       "2 2021090900 DAL             I           15   \n",
       "3 2021090900 DAL             IN           1   \n",
       "4 2021090900 DAL             R            3   \n",
       "5 2021090900 DAL             S            1   \n",
       "6 2021090900 TB              C           27   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(agg_tbl)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "507154a6",
   "metadata": {
    "papermill": {
     "duration": 0.008021,
     "end_time": "2022-12-20T20:21:14.487072",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.479051",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Let's clean the scouting_data dataframe and count the number of pressures allowed by every player on offense and rushes performed by every defensive player in every game."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "dd65ac54",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:21:14.507987Z",
     "iopub.status.busy": "2022-12-20T20:21:14.506134Z",
     "iopub.status.idle": "2022-12-20T20:21:14.543968Z",
     "shell.execute_reply": "2022-12-20T20:21:14.541253Z"
    },
    "papermill": {
     "duration": 0.051406,
     "end_time": "2022-12-20T20:21:14.546664",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.495258",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "scouting_data <- clean_names(scouting_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b0207e0f",
   "metadata": {
    "papermill": {
     "duration": 0.007879,
     "end_time": "2022-12-20T20:21:14.562185",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.554306",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We then add two columns, total_pressures_allowed and total_rushes. Total_pressures_allowed will add up the number of times an offensive player is beaten by a defender plus the number of hits, hurries or sacks allowed on every play.\n",
    "\n",
    "Total rushes will add up the hits, hurries and sacks that defensive players get on every play."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "f5c7ab60",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:21:14.581489Z",
     "iopub.status.busy": "2022-12-20T20:21:14.579645Z",
     "iopub.status.idle": "2022-12-20T20:21:14.667190Z",
     "shell.execute_reply": "2022-12-20T20:21:14.665014Z"
    },
    "papermill": {
     "duration": 0.100667,
     "end_time": "2022-12-20T20:21:14.670325",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.569658",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "scouting_data <- mutate(scouting_data, total_pressures_allowed = scouting_data$pff_beaten_by_defender + scouting_data$pff_hit_allowed + scouting_data$pff_hurry_allowed + scouting_data$pff_sack_allowed)\n",
    "scouting_data <- mutate(scouting_data, total_rushes = scouting_data$pff_hit + scouting_data$pff_hurry + scouting_data$pff_sack)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "00f55004",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:21:14.690927Z",
     "iopub.status.busy": "2022-12-20T20:21:14.689074Z",
     "iopub.status.idle": "2022-12-20T20:21:14.726938Z",
     "shell.execute_reply": "2022-12-20T20:21:14.724168Z"
    },
    "papermill": {
     "duration": 0.051926,
     "end_time": "2022-12-20T20:21:14.730489",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.678563",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 17</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>game_id</th><th scope=col>play_id</th><th scope=col>nfl_id</th><th scope=col>pff_role</th><th scope=col>pff_position_lined_up</th><th scope=col>pff_hit</th><th scope=col>pff_hurry</th><th scope=col>pff_sack</th><th scope=col>pff_beaten_by_defender</th><th scope=col>pff_hit_allowed</th><th scope=col>pff_hurry_allowed</th><th scope=col>pff_sack_allowed</th><th scope=col>pff_nfl_id_blocked_player</th><th scope=col>pff_block_type</th><th scope=col>pff_back_field_block</th><th scope=col>total_pressures_allowed</th><th scope=col>total_rushes</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>2021090900</td><td>97</td><td>25511</td><td>Pass      </td><td>QB  </td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>   NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2021090900</td><td>97</td><td>35481</td><td>Pass Route</td><td>TE-L</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>   NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>2021090900</td><td>97</td><td>35634</td><td>Pass Route</td><td>LWR </td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>   NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2021090900</td><td>97</td><td>39985</td><td>Pass Route</td><td>HB-R</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>   NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2021090900</td><td>97</td><td>40151</td><td>Pass Block</td><td>C   </td><td>NA</td><td>NA</td><td>NA</td><td> 0</td><td> 0</td><td> 0</td><td> 0</td><td>44955</td><td>SW</td><td> 0</td><td> 0</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>2021090900</td><td>97</td><td>41233</td><td>Pass Route</td><td>RWR </td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>   NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 17\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & game\\_id & play\\_id & nfl\\_id & pff\\_role & pff\\_position\\_lined\\_up & pff\\_hit & pff\\_hurry & pff\\_sack & pff\\_beaten\\_by\\_defender & pff\\_hit\\_allowed & pff\\_hurry\\_allowed & pff\\_sack\\_allowed & pff\\_nfl\\_id\\_blocked\\_player & pff\\_block\\_type & pff\\_back\\_field\\_block & total\\_pressures\\_allowed & total\\_rushes\\\\\n",
       "  & <int> & <int> & <int> & <chr> & <chr> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <chr> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 2021090900 & 97 & 25511 & Pass       & QB   & NA & NA & NA & NA & NA & NA & NA &    NA & NA & NA & NA & NA\\\\\n",
       "\t2 & 2021090900 & 97 & 35481 & Pass Route & TE-L & NA & NA & NA & NA & NA & NA & NA &    NA & NA & NA & NA & NA\\\\\n",
       "\t3 & 2021090900 & 97 & 35634 & Pass Route & LWR  & NA & NA & NA & NA & NA & NA & NA &    NA & NA & NA & NA & NA\\\\\n",
       "\t4 & 2021090900 & 97 & 39985 & Pass Route & HB-R & NA & NA & NA & NA & NA & NA & NA &    NA & NA & NA & NA & NA\\\\\n",
       "\t5 & 2021090900 & 97 & 40151 & Pass Block & C    & NA & NA & NA &  0 &  0 &  0 &  0 & 44955 & SW &  0 &  0 & NA\\\\\n",
       "\t6 & 2021090900 & 97 & 41233 & Pass Route & RWR  & NA & NA & NA & NA & NA & NA & NA &    NA & NA & NA & NA & NA\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 17\n",
       "\n",
       "| <!--/--> | game_id &lt;int&gt; | play_id &lt;int&gt; | nfl_id &lt;int&gt; | pff_role &lt;chr&gt; | pff_position_lined_up &lt;chr&gt; | pff_hit &lt;int&gt; | pff_hurry &lt;int&gt; | pff_sack &lt;int&gt; | pff_beaten_by_defender &lt;int&gt; | pff_hit_allowed &lt;int&gt; | pff_hurry_allowed &lt;int&gt; | pff_sack_allowed &lt;int&gt; | pff_nfl_id_blocked_player &lt;int&gt; | pff_block_type &lt;chr&gt; | pff_back_field_block &lt;int&gt; | total_pressures_allowed &lt;int&gt; | total_rushes &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 2021090900 | 97 | 25511 | Pass       | QB   | NA | NA | NA | NA | NA | NA | NA |    NA | NA | NA | NA | NA |\n",
       "| 2 | 2021090900 | 97 | 35481 | Pass Route | TE-L | NA | NA | NA | NA | NA | NA | NA |    NA | NA | NA | NA | NA |\n",
       "| 3 | 2021090900 | 97 | 35634 | Pass Route | LWR  | NA | NA | NA | NA | NA | NA | NA |    NA | NA | NA | NA | NA |\n",
       "| 4 | 2021090900 | 97 | 39985 | Pass Route | HB-R | NA | NA | NA | NA | NA | NA | NA |    NA | NA | NA | NA | NA |\n",
       "| 5 | 2021090900 | 97 | 40151 | Pass Block | C    | NA | NA | NA |  0 |  0 |  0 |  0 | 44955 | SW |  0 |  0 | NA |\n",
       "| 6 | 2021090900 | 97 | 41233 | Pass Route | RWR  | NA | NA | NA | NA | NA | NA | NA |    NA | NA | NA | NA | NA |\n",
       "\n"
      ],
      "text/plain": [
       "  game_id    play_id nfl_id pff_role   pff_position_lined_up pff_hit pff_hurry\n",
       "1 2021090900 97      25511  Pass       QB                    NA      NA       \n",
       "2 2021090900 97      35481  Pass Route TE-L                  NA      NA       \n",
       "3 2021090900 97      35634  Pass Route LWR                   NA      NA       \n",
       "4 2021090900 97      39985  Pass Route HB-R                  NA      NA       \n",
       "5 2021090900 97      40151  Pass Block C                     NA      NA       \n",
       "6 2021090900 97      41233  Pass Route RWR                   NA      NA       \n",
       "  pff_sack pff_beaten_by_defender pff_hit_allowed pff_hurry_allowed\n",
       "1 NA       NA                     NA              NA               \n",
       "2 NA       NA                     NA              NA               \n",
       "3 NA       NA                     NA              NA               \n",
       "4 NA       NA                     NA              NA               \n",
       "5 NA        0                      0               0               \n",
       "6 NA       NA                     NA              NA               \n",
       "  pff_sack_allowed pff_nfl_id_blocked_player pff_block_type\n",
       "1 NA                  NA                     NA            \n",
       "2 NA                  NA                     NA            \n",
       "3 NA                  NA                     NA            \n",
       "4 NA                  NA                     NA            \n",
       "5  0               44955                     SW            \n",
       "6 NA                  NA                     NA            \n",
       "  pff_back_field_block total_pressures_allowed total_rushes\n",
       "1 NA                   NA                      NA          \n",
       "2 NA                   NA                      NA          \n",
       "3 NA                   NA                      NA          \n",
       "4 NA                   NA                      NA          \n",
       "5  0                    0                      NA          \n",
       "6 NA                   NA                      NA          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(scouting_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3012ceac",
   "metadata": {
    "papermill": {
     "duration": 0.008233,
     "end_time": "2022-12-20T20:21:14.747131",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.738898",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We'll create another aggregate table to count the number of times offensive players allowed pressure on their quarterbacks."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "ab571e36",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T20:21:14.766718Z",
     "iopub.status.busy": "2022-12-20T20:21:14.764994Z",
     "iopub.status.idle": "2022-12-20T20:21:15.037225Z",
     "shell.execute_reply": "2022-12-20T20:21:15.035283Z"
    },
    "papermill": {
     "duration": 0.28523,
     "end_time": "2022-12-20T20:21:15.040178",
     "exception": false,
     "start_time": "2022-12-20T20:21:14.754948",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>game_id</th><th scope=col>pff_position_lined_up</th><th scope=col>total_pressures_allowed</th><th scope=col>count</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2021090900</td><td>C   </td><td>1</td><td>13</td></tr>\n",
       "\t<tr><td>2021090900</td><td>HB  </td><td>1</td><td> 1</td></tr>\n",
       "\t<tr><td>2021090900</td><td>HB-L</td><td>1</td><td> 3</td></tr>\n",
       "\t<tr><td>2021090900</td><td>HB-R</td><td>1</td><td> 1</td></tr>\n",
       "\t<tr><td>2021090900</td><td>LG  </td><td>1</td><td>10</td></tr>\n",
       "\t<tr><td>2021090900</td><td>LT  </td><td>1</td><td> 6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 4\n",
       "\\begin{tabular}{llll}\n",
       " game\\_id & pff\\_position\\_lined\\_up & total\\_pressures\\_allowed & count\\\\\n",
       " <int> & <chr> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t 2021090900 & C    & 1 & 13\\\\\n",
       "\t 2021090900 & HB   & 1 &  1\\\\\n",
       "\t 2021090900 & HB-L & 1 &  3\\\\\n",
       "\t 2021090900 & HB-R & 1 &  1\\\\\n",
       "\t 2021090900 & LG   & 1 & 10\\\\\n",
       "\t 2021090900 & LT   & 1 &  6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 4\n",
       "\n",
       "| game_id &lt;int&gt; | pff_position_lined_up &lt;chr&gt; | total_pressures_allowed &lt;int&gt; | count &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 2021090900 | C    | 1 | 13 |\n",
       "| 2021090900 | HB   | 1 |  1 |\n",
       "| 2021090900 | HB-L | 1 |  3 |\n",
       "| 2021090900 | HB-R | 1 |  1 |\n",
       "| 2021090900 | LG   | 1 | 10 |\n",
       "| 2021090900 | LT   | 1 |  6 |\n",
       "\n"
      ],
      "text/plain": [
       "  game_id    pff_position_lined_up total_pressures_allowed count\n",
       "1 2021090900 C                     1                       13   \n",
       "2 2021090900 HB                    1                        1   \n",
       "3 2021090900 HB-L                  1                        3   \n",
       "4 2021090900 HB-R                  1                        1   \n",
       "5 2021090900 LG                    1                       10   \n",
       "6 2021090900 LT                    1                        6   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pressures_tbl <- scouting_data %>% group_by(game_id, pff_position_lined_up, total_pressures_allowed) %>% \n",
    "      summarise(count=n(),\n",
    "      .groups = 'drop')\n",
    "pressures_tbl <- drop_na(pressures_tbl)\n",
    "pressures_tbl <- filter(pressures_tbl, total_pressures_allowed != 0)\n",
    "head(pressures_tbl)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b1c21f13",
   "metadata": {
    "papermill": {
     "duration": 0.008673,
     "end_time": "2022-12-20T20:21:15.057651",
     "exception": false,
     "start_time": "2022-12-20T20:21:15.048978",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 92.788682,
   "end_time": "2022-12-20T20:21:15.290206",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-20T20:19:42.501524",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
