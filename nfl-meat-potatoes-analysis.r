{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "0261eab3",
   "metadata": {
    "papermill": {
     "duration": 0.009948,
     "end_time": "2022-12-27T11:03:47.230650",
     "exception": false,
     "start_time": "2022-12-27T11:03:47.220702",
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
   "id": "9d468612",
   "metadata": {
    "papermill": {
     "duration": 0.007167,
     "end_time": "2022-12-27T11:03:47.244901",
     "exception": false,
     "start_time": "2022-12-27T11:03:47.237734",
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
   "id": "2b8339c6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:03:47.262822Z",
     "iopub.status.busy": "2022-12-27T11:03:47.260786Z",
     "iopub.status.idle": "2022-12-27T11:03:48.746971Z",
     "shell.execute_reply": "2022-12-27T11:03:48.745145Z"
    },
    "papermill": {
     "duration": 1.498162,
     "end_time": "2022-12-27T11:03:48.750012",
     "exception": false,
     "start_time": "2022-12-27T11:03:47.251850",
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
   "id": "f079b5fa",
   "metadata": {
    "papermill": {
     "duration": 0.007703,
     "end_time": "2022-12-27T11:03:48.765235",
     "exception": false,
     "start_time": "2022-12-27T11:03:48.757532",
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
   "id": "954a6157",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:03:48.810924Z",
     "iopub.status.busy": "2022-12-27T11:03:48.781987Z",
     "iopub.status.idle": "2022-12-27T11:04:52.170081Z",
     "shell.execute_reply": "2022-12-27T11:04:52.168303Z"
    },
    "papermill": {
     "duration": 63.399781,
     "end_time": "2022-12-27T11:04:52.172455",
     "exception": false,
     "start_time": "2022-12-27T11:03:48.772674",
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
   "id": "585679d7",
   "metadata": {
    "papermill": {
     "duration": 0.007943,
     "end_time": "2022-12-27T11:04:52.188228",
     "exception": false,
     "start_time": "2022-12-27T11:04:52.180285",
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
   "id": "e3444e95",
   "metadata": {
    "papermill": {
     "duration": 0.007809,
     "end_time": "2022-12-27T11:04:52.203622",
     "exception": false,
     "start_time": "2022-12-27T11:04:52.195813",
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
   "id": "28f1fe38",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:04:52.221927Z",
     "iopub.status.busy": "2022-12-27T11:04:52.220474Z",
     "iopub.status.idle": "2022-12-27T11:04:52.389165Z",
     "shell.execute_reply": "2022-12-27T11:04:52.386382Z"
    },
    "papermill": {
     "duration": 0.180606,
     "end_time": "2022-12-27T11:04:52.391891",
     "exception": false,
     "start_time": "2022-12-27T11:04:52.211285",
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
   "id": "57d91e37",
   "metadata": {
    "papermill": {
     "duration": 0.008818,
     "end_time": "2022-12-27T11:04:52.409243",
     "exception": false,
     "start_time": "2022-12-27T11:04:52.400425",
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
   "id": "dd8a0769",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:04:52.429373Z",
     "iopub.status.busy": "2022-12-27T11:04:52.427875Z",
     "iopub.status.idle": "2022-12-27T11:04:52.501097Z",
     "shell.execute_reply": "2022-12-27T11:04:52.499360Z"
    },
    "papermill": {
     "duration": 0.085284,
     "end_time": "2022-12-27T11:04:52.503324",
     "exception": false,
     "start_time": "2022-12-27T11:04:52.418040",
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
   "id": "e7b8baed",
   "metadata": {
    "papermill": {
     "duration": 0.008339,
     "end_time": "2022-12-27T11:04:52.520625",
     "exception": false,
     "start_time": "2022-12-27T11:04:52.512286",
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
   "id": "5976387c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:04:52.540738Z",
     "iopub.status.busy": "2022-12-27T11:04:52.539160Z",
     "iopub.status.idle": "2022-12-27T11:05:05.547343Z",
     "shell.execute_reply": "2022-12-27T11:05:05.545573Z"
    },
    "papermill": {
     "duration": 13.020663,
     "end_time": "2022-12-27T11:05:05.549684",
     "exception": false,
     "start_time": "2022-12-27T11:04:52.529021",
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
   "id": "246dac69",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:05.570075Z",
     "iopub.status.busy": "2022-12-27T11:05:05.568541Z",
     "iopub.status.idle": "2022-12-27T11:05:05.689888Z",
     "shell.execute_reply": "2022-12-27T11:05:05.688145Z"
    },
    "papermill": {
     "duration": 0.133626,
     "end_time": "2022-12-27T11:05:05.692133",
     "exception": false,
     "start_time": "2022-12-27T11:05:05.558507",
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
   "id": "78ddfea9",
   "metadata": {
    "papermill": {
     "duration": 0.008381,
     "end_time": "2022-12-27T11:05:05.708947",
     "exception": false,
     "start_time": "2022-12-27T11:05:05.700566",
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
   "id": "c3132a37",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:05.729075Z",
     "iopub.status.busy": "2022-12-27T11:05:05.727547Z",
     "iopub.status.idle": "2022-12-27T11:05:05.744136Z",
     "shell.execute_reply": "2022-12-27T11:05:05.742497Z"
    },
    "papermill": {
     "duration": 0.029608,
     "end_time": "2022-12-27T11:05:05.746856",
     "exception": false,
     "start_time": "2022-12-27T11:05:05.717248",
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
   "id": "bea1b7fa",
   "metadata": {
    "papermill": {
     "duration": 0.008821,
     "end_time": "2022-12-27T11:05:05.764215",
     "exception": false,
     "start_time": "2022-12-27T11:05:05.755394",
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
   "id": "88e42e27",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:05.784391Z",
     "iopub.status.busy": "2022-12-27T11:05:05.782824Z",
     "iopub.status.idle": "2022-12-27T11:05:05.811486Z",
     "shell.execute_reply": "2022-12-27T11:05:05.809224Z"
    },
    "papermill": {
     "duration": 0.041831,
     "end_time": "2022-12-27T11:05:05.814395",
     "exception": false,
     "start_time": "2022-12-27T11:05:05.772564",
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
   "id": "659c71a8",
   "metadata": {
    "papermill": {
     "duration": 0.01403,
     "end_time": "2022-12-27T11:05:05.837343",
     "exception": false,
     "start_time": "2022-12-27T11:05:05.823313",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Next, we want to create an aggregate table for the average BMI of NFL players by position."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "9e265a6a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:05.858020Z",
     "iopub.status.busy": "2022-12-27T11:05:05.856473Z",
     "iopub.status.idle": "2022-12-27T11:05:05.889346Z",
     "shell.execute_reply": "2022-12-27T11:05:05.887644Z"
    },
    "papermill": {
     "duration": 0.046102,
     "end_time": "2022-12-27T11:05:05.892302",
     "exception": false,
     "start_time": "2022-12-27T11:05:05.846200",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "average_bmi <- players_data %>% group_by(official_position) %>% \n",
    "      summarise(mean(bmi),\n",
    "      .groups = 'drop')\n",
    "average_bmi <- clean_names(average_bmi)\n",
    "average_bmi$mean_bmi <- round(average_bmi$mean_bmi, digits = 2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "d1f22659",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:05.914621Z",
     "iopub.status.busy": "2022-12-27T11:05:05.913180Z",
     "iopub.status.idle": "2022-12-27T11:05:06.447792Z",
     "shell.execute_reply": "2022-12-27T11:05:06.444729Z"
    },
    "papermill": {
     "duration": 0.548937,
     "end_time": "2022-12-27T11:05:06.451553",
     "exception": false,
     "start_time": "2022-12-27T11:05:05.902616",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nc24qlWr6L351dXXr/51a4crLyxOJRF1dXX19/VfvveKUlJSk0+nGxsaampp8znVvyptC3ZuS\nyWTTw8/uTR3NvSlvioqKiouLs9lsVVXVcl5UNpvt0qXLsn6aj7Cb9fjzdfM/OHzs3s1b/vL9\nA/9WsdENl40K4dGXq+v7F5c0bX+1uqH7et2bd+vbt+8hhxzSfHL+/PmL/XLJc9gtz6+20tLS\npjtP/n8/Nt15amtr8/97KplMNjQ05PkqJxKJoqKibDab57lFRUVNYZf/31NNN3FdXV3+/0lo\n+qcoz4e6pKSksPemurq6PP+T0NnuTel0uinsCnVvqq+vz/9VTqfT+W/oQt2bmsOuUPem/P/i\nSiQSTWG3QuYWOOyGHvzTyft8nhTZzLwJJ5657ann7te3V2mPPoOKL7/3yVk7jlkthFC/YNqz\n8+vG7dQ/D0sCAIhPPsKutN+aw/p9/uem19j1WHPIkP4VIYQJ40ac9LszH+538ogetXdePLli\n0OjxA/P8MBwAQCTy/c0Tixm2/zlH11544+TT59Qkhm60w6QJRyYKuyAAgFVWvsMukaq86667\nWp4efciE0Ycs+wwAAOSmMG8zBgBghRN2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkUgXegGrpN4P9Gn/edt+ltm7zWr3OACg8/CIHQBAJDxitypZ\nnkcKu7frXB4sBIBViEfsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIuHjTshJuz9ppSyE\nsrafy8esAEA7eMQOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS6UIvAFrT+4E+7TtjKoTebT/X\n7N1mtW8cAKwMPGIHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQ\nCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcA\nEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQiXShF9AGqVSqpKSkgAso1PQC\nXuvOdpWXZ24qlWr6Q3FxcSaTWUEraoOioqJsNpvPiU1XOZlM5vn2KioqavpDnucmEonmBTT/\nOZ+j8/87MJ1ON03P89yC35vS6XSer3IymQyFONTuTXnT/Ld6+ee2/qt+VQq7/N/TFlNeXt6p\n5hZw9Ko4t/l3U2lp6QpaTttGFxUVNf0znDdN/xSlUqk8317Nh7pQf09KSkqKi4vzObHpUBcV\nFTX/25DPuclkslA3sXtTR+u096Z0Ol2QQ71C7k2t/29nVQq72tra2trallt653cBn376aaea\nW8DRBZ/bDkVFRd27dw8hzJs3r7GxccUt6qv16tUrkUhUVVXV1NTkc27Xrl1LSkrq6+vnzZuX\nz7klJSVdu3YNy3d7tUMymezZs2cIYcGCBXV1dfkc3aNHj3Q6XVNTs3DhwnzOLS8vLy8vb2xs\nzPOhTqfTPXr0CIW7N1VXV1dXV+dzbtO9qaGhYe7cufmcW6h7UyKR6NWrVyjcvam2tnbBggX5\nnNt0b8pkMivkUPfuvcx/Hr3GDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\n6UIvAFZGvR/o0+7zVrbrXLN3m9XuiQDQxCN2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACRSBd6\nAcCX9H6gT/vO2CWELm0/1+zdZrVvHAArIY/YAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAETCd8UCISzHd9QWh9C77efyHbUAHcEjdgAAkRB2\nAACREHYAAJHwGjugkNr92r7gtX0AS/CIHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkfEAx0Bktzwcjd2vXuXw2MpAHHrEDAIiEsAMAiISwAwCIhLADAIiEN08A5FW7\n37dRFkJZ28/lTRvQqeQp7OrmvXr1Rdc89b83F2bSa6696f4/OHqbNbqEEFX31pgAACAASURB\nVELIPDLlsrsfm/bu/NTI9bc69MeHDS5L5WdJAACRyc9TsdnLTvjZU7MHHHPaub888+R1Uy/9\n8sSJsxsyIYQ3p552wc1PbbPvkWccd3D5Gw+eesLV2bwsCAAgPvkIu9q5f3/446ojzzp6mw3W\nGb7epodPPKmxZsbNH1eFbN3km18aNv6ccbtus95mo447/5gF79970wcL87AkAID45CPskune\nhx9++Fbdij8/nUiHEMpTydq5j82oaRyz88CmzSWVozbqUvzMox/lYUkAAPHJx2vsiio23Hvv\nDUMIn/7nn8999PGz99/cZ71vju9bXj3z+RDCuuWL1rBeefqBF+Y2n3z++ecPP/zw5pOTJk0a\nM2ZMHha8LL179+5Ucws4urPNLeBoc6MfvfxzU6lUoRZfWVlZkLkVFRUVFRX5n1tUVLTq/j1p\nn27d2vdNLsurtLS0tLQ0/3OTyeTyH+rGxsZWfprXd8V+9Njf7nnt/RnvVW83dkgihEztwhBC\n76JF75boXZSqn1efzyUBdBY3JvI67iAvmYYCyGvYjfjxaZNDWPDu0z/88S8mDVp3wtrlIYRP\n6jP9iz9/Rnh2fWO6ctGSVltttZ/+9KfNJ4cNG7ZgwYKWF9glL8tu1jy9k8wt4OjONreAo82N\nfnTB57ZDKpUqKysLIVRVVWUymRW3qK9WUVGRSCRqa2vr6/P6KENpaWk6nW5sbKyurs7n3HQ6\n3fTA1fLcXu2QSCSaHhOtqalpaGjI5+iysrJUKlVfX19bW5vPucXFxcXFxdlsduHC5X0vQTab\n7dq167J+mo+wm/f644+/UbLH17dsOtll9a337FX61wc/KNp4gxAefbm6vn9xSdOPXq1u6L5e\n9+Yz9uzZc999920+OX/+/JqampaXnOffU83TO8ncAo7ubHMLONrc6EcXfG67P7cvhFDernMt\nz0f3NdVGQ0PDYv/cdLSioqJ0Op3JZPI8t6SkpCns8jy3Oezq6urq6uryObrp+jY2Nub5KieT\nyaawWyFzWwm7fLx5or760auuuGB2/Rf/68o2TK9qKF+jorTHToOKU/c++fk9sH7BtGfn1226\nU/88LAkAID75CLvKEd8fXFQ78ee/m/bCq6+/+N8pF538fHXZdw9YKySKJowb8drvznx42qsz\n3/zfNadPrhg0evzAArxeFQAgAvl4KjZZ1Pfc30y89Kobf332X6uzRWsO3+S488/YpntJCGHY\n/uccXXvhjZNPn1OTGLrRDpMmHJnfF/cCAMQjT2+eqFh9y5MnbbmUHyRSow+ZMPqQ/KwCACBm\n+flKMQAAOpywAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiES60AsA\ngA7R+4E+7TtjRQgVbT/X7N1mtW8crEDCDgBWpHYHZVEIvdt+LkFJS8IOAGLQ7qAMgjIiXmMH\nABAJYQcAEAlhBwAQCa+xAwDab3le29etXefy8r5WeMQOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS6UIvAACgPXo/0Kd9\nZywNobTt55q926z2jcsnj9gBAERC2AEARMJTsQAAbdDup4CTIfRu+7na9BSwR+wAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewA\nACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAikS70AtognU4nk4Us\n0bKysk41t4CjO9vcAo42N/rRnW1uAUebG/3olWRuNpttZedVKeySyWQ6XcgFFxcXd6q5BRzd\n2eYWcLS50Y/ubHMLONrc6EevJHMzmUwrO69KYVdXV1dbW9tyS+/8LmDu3Lmdam4BR3e2uQUc\nbW70ozvb3AKONjf60QWf26ykpGRZO3uNHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCTSrfxs\n/PjxOV7K9ddfvyIWAwBA+7UWdjfccEOOlyLsAAAKrrWwe/vtt/O1DAAAlldrYbfmmmvmbR0A\nACwnb54AAIhEa4/YTZ06NcdLGTt27IpYDAAA7dda2I0bNy7HS8lmsytiMQAAtF9rYdekrO/a\n3xq73547bVLqaVsAgJVYa2H37AM333bbbbfdfveUy8/98y3Dvjl23Lj9xn1z583KFB4AwMqn\ntUbbbPS3f37lLa99PPe/f7/9pAO2nH73xfuP3ryyz9CxR5485f5nqjKefgUAWInk8OBbonjD\nHfc5+5I/TZ8598V/3H3qIdu/8cCVB+6+ZWXPIfscfuKN9/1zocIDAFgJtOlZ1dTIbfc8ffIf\n/vPOZ6/96/6zfzD6vcf+8J1vbN2zh4+7AwAovPa9XC4xZKNNN99880032bgkmaib/+4KXhQA\nAG331e+KbSlTN+eRu26/5dZbbr/z77NqG3ustcl3Tzh3v/3266DFAQCQu5zCLlM355G7b7/1\nllun3vnwrNrGyiGbjf2/c/bbb7/Rmw9NdPQCAQDITWthl6n/5NG7br/l1lum/vnhWbWNPYdu\nPu648/bbb79dNxuct/UBAJCj1sJuQLd+H9c0lPVZe6/DTtlvv/122Wxw0+Nzc+fOXWzP7t27\nd9gKAQDISWth93FNQwihetarN19x3s1XnNfKnr5SDACg4FoLu6OOOipv6wAAYDm1FnaXX355\n3tYBAMByyuldsZ9++HFZnz6lqUQIIZtZeNdVv77jseerivputMm2h/7wwEElqQ5eJAAAX+0r\nPqD4zvOOXKtPRc8B/bpUDPju6TdnQvjVvhvu/cMzr7vp9lv/eMVpx49fZ8hOT39Wm5+1AgDQ\nitbC7o0/Hbj3qdfMrO739b3333nz3n8654DdT//OKXe+Oe70P7wyY9bsd1/945kHLpz5+Lf3\nvy1vywUAYFlaeyr25yfenS4d/NhbL27dpzSE8Mivtt/p5Bsr1z771rMPDSGE0Hv8GTfOvPWB\n0/9xbgjfycdiAQBYttYesZs6u7rv5hc1VV0IYdujLwkh9B21c8t9dtixX0P1qx23PgAActRa\n2H3WkOk2omfzyaKK9UIIyaIvnSVZlMxmGztocQAA5O4r3jyRSLf8MljvfgUAWHl9RdgBALCq\n+IrPsav+8Pknnsi0suXFmVUdsi4AANroK8Lu7T8ftd2fv2ILAAArg9bC7rTTTsvbOgAAWE6t\nhd2kSZPytg4AAJaTN08AAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE4is+oHgxrzx08033\nPzXj40+2P/+KA4qe/OfMDXdYv28HrQwAgDbJPeyylx223THXPtl0ovz0i/ZYcNFOm9yz/REX\nP3jlMelEBy0PAIBc5fpU7Bt/2veYa5/c5ZgL//va+01bKof/8rzvb/Po1cfudcXLHbY8AABy\nlWvYnTPhbz1HTnzwkv/bcNjApi3p8hETr3jirA16PXqmL6gAACi8XMPuttnVQw89aMnt+xw8\npGbO3St0SQAAtEeuYbdGSWr+a/OW3P7p9LmpkoErdEkAALRHrmH30636vn7DwU/Prmm5sWrm\nw4fd/GbvTU7pgIUBANA2uYbdvjdftUZixg6DN/7BiWeHEKZP+f2kkw5dd/jXZ2QGXHzrtzty\nhQAA5CTXsCvr843n/nvX2C2S10w+M4TwyGkTzvjNDV233u+O554fO6CiAxcIAEBu2vABxd2G\nj7nx4TG/m/XW9DdmNqTKVhu+3mo9SjpuZQAAtEmuYbdw4cLP/1Ted+QGTd820bBwYUO6qKSk\nuG1fXwEAQEfItcm6dOmyrB8l0+WDBg/daoev/2DCqbuO6LGCFgYAQNvkGnZXXH7RVRNPem5+\nduMdv77FyMFlifoZrzxz70P/7rrxuIO+1uuDGa8+fsOFt197zRUvvX3ksO5Lnj3b8OkdV195\n35P/nVOTHLD68L3GH/X1TfqHEELIPDLlsrsfm/bu/NTI9bc69MeHDS5LrbhrBwDQieQadlvM\nufXY2v43TXt2/416N2/85H+3bbH1IV3Oe/WWrw+qm/fKd9fd/NRv/+nIaUcvefYHzjvxhuld\nD/n+j9cdVPH8QzddduYxNZdc963Vu7w59bQLbn5n/DHHHl7ZcM+Vl556QsOfLj/KF88CALRD\nru+KPe5X/xr6nRtaVl0IoecG4244ZM0Lx58QQijuts4vL93ys5d/u+R5G2vfveLfs7f/2Rnf\n2mWb4SM2HHvMeaN7pO684uWQrZt880vDxp8zbtdt1tts1HHnH7Pg/Xtv+mDhkpcAAMBXyjXs\nplfVl6++lI81qVijoubTB5r+XDaoorFu5pL7NNa8vebgwd8Y0vWLDYlNupfUzV1QO/exGTWN\nY3b+/IsrSipHbdSl+JlHP1p0xsbGeS00NDQkvizXa7mCdLa5BRzd2eYWcLS50Y/ubHMLONrc\n6EcXfG4uC8j1qdjvDepy6aVnvTtx6uoli14Dl6mbefaFL3UZeGTTyfvO+V9pz28sed7i7qMu\nvHBU88n6BS//fuaCtY4cVrfwlhDCuuWL1rBeefqBF+Y2n5w+ffrhhx/efHLSpEljxozJccEd\noVevXp1qbgFHd7a5BRxtbvSjO9vcAo42N/rRK8ncxsbGVnbONexOueOMyzc/ad3ho3541AGb\nj1izJNS+88q0W6689Kk5qd88c1rt3L/vu8cR9z7x9jevuK/1y3n7mb9cfNEfGoZ846ejB9W/\nvTCE0LtoUSn2LkrVz6vPcUkAALSUa9j12viEV/7e87Bjf/qrU/+veWOP4aOufHjKERv3WvjB\ni4+/UXzUL26//AcjlnUJtZ++/PvfXvzX/36yw7gfnnvQzqWJxPyS8hDCJ/WZ/sWfPyM8u74x\nXbloSUOGDLnsssuaTw4cOHDu3LktL3Mp77/tSM3TO8ncAo7ubHMLONrc6Ed3trkFHG1u9KML\nPrdZ9+7LXEIbPlt44KhD7//voR+89tx/Xn6nqjHdf/DIrTYcmspWzZtf1W3A0fM+OKaV885/\n68EJJ12a2nDML68+eJ3epU0bi8o3COHRl6vr+xd//g0Wr1Y3dF9v0Vq7dOmy5ZZbLrqQ+fNr\na2tzX/AKV19fmEcTCzW3gKM729wCjjY3+tGdbW4BR5sb/ehVYm6bvzRiwPBNBgzfpPnku3/b\nZ8heL9fXvNPKWbKZqnN/cnnJLj+66Ic7t3y9X2mPnQYVX37vk7N2HLNaCKF+wbRn59eN26l/\nW5cEAEDIPeyyjQsuOe7I6x56dk51Q8vtH854J1G2buvnrfrw+her6r+3YcW/n322eWNR2fCN\n1us+YdyIk3535sP9Th7Ro/bOiydXDBo9fuBS3nsLAMBXyjXsnjt7xx9f8u/h24xeu8dLDzz1\n3u577V0Saqb//eFEz50um3Jd6+ed+8rbIYTfnX9uy43dh5x+/YVbDNv/nKNrL7xx8ulzahJD\nN9ph0oQjfToxAED75Bp2P714eq/1z3n1yVOzjQuGdKnc7pI/nrp61+qPH11/8DcWfNVjbAN3\n+vldOy3jZ4nU6EMmjD6kLUsGAGBpcv2A4sfn1a11wJ4hhESqy/i+5Q9PmxNCKOu7wx8PXeuc\ncVd34AIBAMhNrmFXmU7Uz//8TRlbrVbx/p3vN/15zX1X++z1CzpkaQAAtEWuYXfEoK6v/+EX\n79Y2hhBW32vQe/de1bT9w4c+avV8AADkSa5h94PfH1k96/ahvdd4q6Zx6MFHVH18/TaHnfyr\ns4/f8zcv9FzvlA5dIgAAucj1zRMDdvjlc1MHnHXl3clEqBjwg5uOu+07F/766Wy229Cv3/bX\nH3ToEgEAyEUbPqB4o32Ov32f45v+vP/kv405/tW3Fpauu84aRT6hBABgJZBj2GVqa+uTxSUt\nG67b6mtv1DFrAgCgHXJ6jV22cX6P8rLRt7zR0asBAKDdcgq7RKr7hJE93/z9Mx29GgAA2i3X\nd8We/vi9G777o2MuunNObWOHLggAgPbJ9c0Te3771Ey/NS4/bp/Ljy/tN6BPadGXivCtt97q\ngLUBANAGuYZdaWlpCAP32GNgh64GAIB2yzXs7r777g5dBwAAy6kNn2MXQnjloZtvuv+pGR9/\nsv35VxxQ9OQ/Z264w/p9O2hlAAC0Se5hl73ssO2OufbJphPlp1+0x4KLdtrknu2PuPjBK49J\n+4xiAIBCy/VdsW/8ad9jrn1yl2Mu/O9r7zdtqRz+y/O+v82jVx+71xUvd9jyAADIVa5hd86E\nv/UcOfHBS/5vw2Gfv38iXT5i4hVPnLVBr0fPnNRhywMAIFe5ht1ts6uHHnrQktv3OXhIzRzv\nqwAAKLxcw26NktT81+Ytuf3T6XNTJT4DBQCg8HINu59u1ff1Gw5+enZNy41VMx8+7OY3e29y\nSgcsDACAtsk17Pa9+ao1EjN2GLzxD048O4QwfcrvJ5106LrDvz4jM+DiW7/dkSsEACAnuYZd\nWZ9vPPffu8Zukbxm8pkhhEdOm3DGb27ouvV+dzz3/NgBFR24QAAAcpPr59jNb8x2Gz7mxofH\n/G7WW9PfmNmQKltt+Hqr9Sjp0MUBAJC7XMOuT+9hYw8+9LDDDtt148Gb9xncoWsCAKAdcn0q\ndodh4aaLzxi9yeqrbbzrz377pzc+revQZQEA0Fa5ht39z7wx57V/XnbOhGGZlycd9921+/Ta\nYewPrr3n6epMhy4PAIBc5Rp2IYTKoVv88NRfP/L8ex9M/8dvfnpo3Qt3HPbNbXoNGHn4Sed3\n3PoAAMhRG8KuWf91tz3u7Isfffqfk4/ZvW7WK3/49cQVviwAANoq1zdPNKv+6JW7bp86derU\nu//+XE0m232tTfbf/4COWBkAAG2S88edvPe/O6ZOnTp16n3/mF6fzZb1Gznu2DMOPPDAMVuv\nnejQBQIAkJtcw67HGhtlstni7mvtdcTJBx5wwF47bVwk6AAAVia5ht3u3/nRAQccsO+YrSuS\niwfdwvf/VzFogxW9MAAA2ibXsPvL9b9dbEvN7Nf+fMvNU6ZMuecfLzZkfOoJAECBtfnNE/Xz\nZvzltlumTJny54em1WayIYQ+62zTAQsDAKBtcg27xpqP/nb7rVOmTLn93qfmN2ZCCBUD1zvw\ngIMOOuig0Zut1YELBAAgN18RdpmGzx6767YpU6bc9udH5tQ3hhDK+62z61qfPPjPWZ+990La\n+ycAAFYarYXd/43f89bb7/+gqiGE0GOtjQ/bZ999x47d/Wvrvn7VtiP/OUvVAQCsVFoLu4tu\n+EsIYauDTj1vwvd23nRwvpYEAEB7tPaVYqt1KQoh/Oum84764dE/u+C6F2YuzNeqAABos9bC\nbsansx6ZevX3x+40+7m/TTrh0A1X677B9nufc9mU1+bU5G19AADkqLWwS6S777DvEVfc+tCs\nue/dc90FB359szeeuOv0Yw7c69RpIYTTL7zhlVkKDwBgZdFa2DVLlfXf4+Dj/nTfPz/9+NWb\nLp2017YjU4nEOcePH9m/cqtvHHzJTX/r6FUCAPCVcgq7ZiW9hh1w9Gl3/uPFT9957urzT9lp\ngz7/uu/6Hx20WwctDgCA3LUt7Jp1XX2jI07+xUP/mfHhi/+44LSjV+yaAABohzZ/pdhi+o3c\n9rhJ266QpQAAsDza+YgdAAArG2EHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJ\nYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQ\nCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcA\nEAlhBwAQiXShF9AGRUVF6XQhF1xRUdGp5hZwdGebW8DR5kY/urPNLeBoc6MfvZLMzWQyrey8\nKoVdIpFIJBIFXEAyWZgHOAs1t4CjO9vcAo42N/rRnW1uAUebG/3olWRu6y20KoVdXV1dbW1t\nyy0l+V3A/PnzO9XcAo7ubHMLONrc6Ed3trkFHG1u9KMLPrdZaWnpsnb2GjsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASKTzPO/a\nHx5SevYVB/Qp+2JD5pEpl9392LR356dGrr/VoT8+bHBZKs9LAgCIQz4fscu+/o/f3zHzs4Zs\ntnnTm1NPu+Dmp7bZ98gzjju4/I0HTz3h6mwrFwAAwLLl6RG7Dx+/8LSrnvh4bu2XtmbrJt/8\n0rDxk8ftOjiEMOz8sN8hv7rpg/EHDajIz6oAAGKSp7DrueG4iWfsman/6MRTzm/eWDv3sRk1\njT/eeWDTyZLKURt1+e0zj3500AFDmrZUVVW98847zftXVlaWlpbmZ8FLlU7n+5nrws4t4OjO\nNreAo82NfnRnm1vA0eZGP3olmZvNtvbsZp6WWNx9tWHdQ2Pdl7KsbuHzIYR1yxetYb3y9AMv\nzG0++frrrx9++OHNJydNmjRmzJiOX+wy9ejRo1PNLeDozja3gKPNjX50Z5tbwNHmRj96JZnb\n2NjYys6FfFdspnZhCKF30aJ3S/QuStXPqy/cigAAVmEFexw1hJAsKQ8hfFKf6V/8eV/Orm9M\nVy5a0rBhw66//vrmk5WVlZ999lnLS8hzOTdP7yRzCzi6s80t4Ghzox/d2eYWcLS50Y8u+Nwm\n2Wy2srJyWTsXMuyKyjcI4dGXq+v7F5c0bXm1uqH7et2bdygvLx85cmTzyfnz59fW1i5+KXnU\n0NDQqeYWcHRnm1vA0eZGP7qzzS3gaHOjH71KzC3kU7GlPXYaVJy698lZTSfrF0x7dn7dpjv1\nL+CSAABWXQX95olE0YRxI1773ZkPT3t15pv/u+b0yRWDRo8f6LNOAADao5BPxYYQhu1/ztG1\nF944+fQ5NYmhG+0wacKRicIuCABglZXXsEsVr3bXXXd9aVMiNfqQCaMPyecqAADiVNCnYgEA\nWHGEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\n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\nAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = average_bmi, mapping = aes(x = reorder(official_position, -mean_bmi), y = mean_bmi))+\n",
    "      geom_col(fill='orange') +\n",
    "      labs(x = 'Official Position', y = 'Average BMI', title = 'Average Player BMI by Position')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e69e159b",
   "metadata": {
    "papermill": {
     "duration": 0.009279,
     "end_time": "2022-12-27T11:05:06.470499",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.461220",
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
   "execution_count": 11,
   "id": "68bb59b1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:06.495667Z",
     "iopub.status.busy": "2022-12-27T11:05:06.494273Z",
     "iopub.status.idle": "2022-12-27T11:05:06.536523Z",
     "shell.execute_reply": "2022-12-27T11:05:06.534919Z"
    },
    "papermill": {
     "duration": 0.056182,
     "end_time": "2022-12-27T11:05:06.538913",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.482731",
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
   "id": "bd27446b",
   "metadata": {
    "papermill": {
     "duration": 0.009125,
     "end_time": "2022-12-27T11:05:06.561648",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.552523",
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
   "execution_count": 12,
   "id": "02d9b4e3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:06.583258Z",
     "iopub.status.busy": "2022-12-27T11:05:06.581775Z",
     "iopub.status.idle": "2022-12-27T11:05:06.615275Z",
     "shell.execute_reply": "2022-12-27T11:05:06.613610Z"
    },
    "papermill": {
     "duration": 0.047485,
     "end_time": "2022-12-27T11:05:06.618376",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.570891",
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
   "execution_count": 13,
   "id": "9464d079",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:06.640059Z",
     "iopub.status.busy": "2022-12-27T11:05:06.638734Z",
     "iopub.status.idle": "2022-12-27T11:05:06.662789Z",
     "shell.execute_reply": "2022-12-27T11:05:06.660925Z"
    },
    "papermill": {
     "duration": 0.037581,
     "end_time": "2022-12-27T11:05:06.665490",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.627909",
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
   "id": "831aaa0f",
   "metadata": {
    "papermill": {
     "duration": 0.009085,
     "end_time": "2022-12-27T11:05:06.683971",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.674886",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Let's take a look at pass result percentage from every game for every team by creatnig an aggregate table."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "b030d12d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:06.705046Z",
     "iopub.status.busy": "2022-12-27T11:05:06.703646Z",
     "iopub.status.idle": "2022-12-27T11:05:06.781466Z",
     "shell.execute_reply": "2022-12-27T11:05:06.779255Z"
    },
    "papermill": {
     "duration": 0.091431,
     "end_time": "2022-12-27T11:05:06.784459",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.693028",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>game_id</th><th scope=col>possession_team</th><th scope=col>pass_result</th><th scope=col>count</th><th scope=col>freq</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2021090900</td><td>DAL</td><td>C </td><td>33</td><td>62</td></tr>\n",
       "\t<tr><td>2021090900</td><td>DAL</td><td>I </td><td>15</td><td>28</td></tr>\n",
       "\t<tr><td>2021090900</td><td>DAL</td><td>IN</td><td> 1</td><td> 2</td></tr>\n",
       "\t<tr><td>2021090900</td><td>DAL</td><td>R </td><td> 3</td><td> 6</td></tr>\n",
       "\t<tr><td>2021090900</td><td>DAL</td><td>S </td><td> 1</td><td> 2</td></tr>\n",
       "\t<tr><td>2021090900</td><td>TB </td><td>C </td><td>27</td><td>61</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " game\\_id & possession\\_team & pass\\_result & count & freq\\\\\n",
       " <int> & <chr> & <chr> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 2021090900 & DAL & C  & 33 & 62\\\\\n",
       "\t 2021090900 & DAL & I  & 15 & 28\\\\\n",
       "\t 2021090900 & DAL & IN &  1 &  2\\\\\n",
       "\t 2021090900 & DAL & R  &  3 &  6\\\\\n",
       "\t 2021090900 & DAL & S  &  1 &  2\\\\\n",
       "\t 2021090900 & TB  & C  & 27 & 61\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 6 × 5\n",
       "\n",
       "| game_id &lt;int&gt; | possession_team &lt;chr&gt; | pass_result &lt;chr&gt; | count &lt;int&gt; | freq &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 2021090900 | DAL | C  | 33 | 62 |\n",
       "| 2021090900 | DAL | I  | 15 | 28 |\n",
       "| 2021090900 | DAL | IN |  1 |  2 |\n",
       "| 2021090900 | DAL | R  |  3 |  6 |\n",
       "| 2021090900 | DAL | S  |  1 |  2 |\n",
       "| 2021090900 | TB  | C  | 27 | 61 |\n",
       "\n"
      ],
      "text/plain": [
       "  game_id    possession_team pass_result count freq\n",
       "1 2021090900 DAL             C           33    62  \n",
       "2 2021090900 DAL             I           15    28  \n",
       "3 2021090900 DAL             IN           1     2  \n",
       "4 2021090900 DAL             R            3     6  \n",
       "5 2021090900 DAL             S            1     2  \n",
       "6 2021090900 TB              C           27    61  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "completion_percentage <- agg_tbl %>% group_by(game_id, possession_team) %>% mutate(freq = round(count / sum(count), 2)*100)\n",
    "head(completion_percentage)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2bfd7e28",
   "metadata": {
    "papermill": {
     "duration": 0.009746,
     "end_time": "2022-12-27T11:05:06.804364",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.794618",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I also want to add the week number to this table for plotting purposes."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "6190da27",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:06.827191Z",
     "iopub.status.busy": "2022-12-27T11:05:06.825535Z",
     "iopub.status.idle": "2022-12-27T11:05:06.842160Z",
     "shell.execute_reply": "2022-12-27T11:05:06.840568Z"
    },
    "papermill": {
     "duration": 0.030784,
     "end_time": "2022-12-27T11:05:06.844806",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.814022",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "completion_percentage <- merge(completion_percentage, games_data[, c(\"game_id\", \"week\")], by = \"game_id\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "72d18c3d",
   "metadata": {
    "papermill": {
     "duration": 0.009791,
     "end_time": "2022-12-27T11:05:06.864730",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.854939",
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
   "execution_count": 16,
   "id": "4779f910",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:06.887426Z",
     "iopub.status.busy": "2022-12-27T11:05:06.885777Z",
     "iopub.status.idle": "2022-12-27T11:05:06.916758Z",
     "shell.execute_reply": "2022-12-27T11:05:06.914997Z"
    },
    "papermill": {
     "duration": 0.045198,
     "end_time": "2022-12-27T11:05:06.919513",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.874315",
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
   "id": "b7cd2576",
   "metadata": {
    "papermill": {
     "duration": 0.009666,
     "end_time": "2022-12-27T11:05:06.939060",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.929394",
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
   "execution_count": 17,
   "id": "a00a7bf7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:06.962118Z",
     "iopub.status.busy": "2022-12-27T11:05:06.960459Z",
     "iopub.status.idle": "2022-12-27T11:05:06.989300Z",
     "shell.execute_reply": "2022-12-27T11:05:06.985545Z"
    },
    "papermill": {
     "duration": 0.043055,
     "end_time": "2022-12-27T11:05:06.991673",
     "exception": false,
     "start_time": "2022-12-27T11:05:06.948618",
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
   "execution_count": 18,
   "id": "902888bf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:07.015141Z",
     "iopub.status.busy": "2022-12-27T11:05:07.013501Z",
     "iopub.status.idle": "2022-12-27T11:05:07.042033Z",
     "shell.execute_reply": "2022-12-27T11:05:07.040010Z"
    },
    "papermill": {
     "duration": 0.042641,
     "end_time": "2022-12-27T11:05:07.044703",
     "exception": false,
     "start_time": "2022-12-27T11:05:07.002062",
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
   "id": "4a8d9fe8",
   "metadata": {
    "papermill": {
     "duration": 0.009939,
     "end_time": "2022-12-27T11:05:07.064345",
     "exception": false,
     "start_time": "2022-12-27T11:05:07.054406",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We'll create another aggregate table to count the number of times offensive players allowed pressure on their quarterbacks from the positions they lined up in every game."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "7ae9be1a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:07.086863Z",
     "iopub.status.busy": "2022-12-27T11:05:07.085459Z",
     "iopub.status.idle": "2022-12-27T11:05:07.304887Z",
     "shell.execute_reply": "2022-12-27T11:05:07.302600Z"
    },
    "papermill": {
     "duration": 0.233641,
     "end_time": "2022-12-27T11:05:07.307607",
     "exception": false,
     "start_time": "2022-12-27T11:05:07.073966",
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
   "id": "07b66718",
   "metadata": {
    "papermill": {
     "duration": 0.009804,
     "end_time": "2022-12-27T11:05:07.327541",
     "exception": false,
     "start_time": "2022-12-27T11:05:07.317737",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Let's add a column to the pressures_tbl that shows the frequency at which offensive players lining up as blockers allowed pressure on the quarterback in each game."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "31de7c3e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:07.350273Z",
     "iopub.status.busy": "2022-12-27T11:05:07.348880Z",
     "iopub.status.idle": "2022-12-27T11:05:07.406969Z",
     "shell.execute_reply": "2022-12-27T11:05:07.367779Z"
    },
    "papermill": {
     "duration": 0.072934,
     "end_time": "2022-12-27T11:05:07.410289",
     "exception": false,
     "start_time": "2022-12-27T11:05:07.337355",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "pressures_tbl <- pressures_tbl %>% group_by(game_id) %>% mutate(freq = round(count / sum(count), 2)*100)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d8caf6b7",
   "metadata": {
    "papermill": {
     "duration": 0.009652,
     "end_time": "2022-12-27T11:05:07.429641",
     "exception": false,
     "start_time": "2022-12-27T11:05:07.419989",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "To plot this, I want to use an animated scatter plot. We need to install and load \"gganimate\" and \"gifski\" packages in addition to ggplot2."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "0dbccb15",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:07.452266Z",
     "iopub.status.busy": "2022-12-27T11:05:07.450816Z",
     "iopub.status.idle": "2022-12-27T11:05:07.554213Z",
     "shell.execute_reply": "2022-12-27T11:05:07.551654Z"
    },
    "papermill": {
     "duration": 0.117802,
     "end_time": "2022-12-27T11:05:07.557019",
     "exception": false,
     "start_time": "2022-12-27T11:05:07.439217",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(\"gganimate\")\n",
    "library(\"gifski\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "123f070b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T11:05:07.579526Z",
     "iopub.status.busy": "2022-12-27T11:05:07.578148Z",
     "iopub.status.idle": "2022-12-27T11:05:19.991167Z",
     "shell.execute_reply": "2022-12-27T11:05:19.989071Z"
    },
    "papermill": {
     "duration": 12.427169,
     "end_time": "2022-12-27T11:05:19.994491",
     "exception": false,
     "start_time": "2022-12-27T11:05:07.567322",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "ggplot(pressures_tbl, aes(pff_position_lined_up, freq, colour = pff_position_lined_up)) +\n",
    "    geom_point(alpha = 0.7, show.legend = FALSE) +\n",
    "    scale_size(range = c(2, 12)) +\n",
    "    # Animating the plot\n",
    "    labs(title = 'Game ID: {frame_time}', x = 'Position Lined Up', y = 'Percentage Pressures Allowed') +\n",
    "    transition_time(game_id) +\n",
    "    ease_aes('linear')"
   ]
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
   "duration": 96.594862,
   "end_time": "2022-12-27T11:05:20.225513",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-27T11:03:43.630651",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
