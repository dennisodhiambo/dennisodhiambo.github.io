{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "661f2cc5",
   "metadata": {
    "_cell_guid": "c73bfcb7-8d7d-402e-82b3-d79432ca41db",
    "_uuid": "edaed724-1e36-4416-a5d0-41c18d14a60b",
    "papermill": {
     "duration": 0.012048,
     "end_time": "2022-12-27T23:36:48.098341",
     "exception": false,
     "start_time": "2022-12-27T23:36:48.086293",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Background:**\n",
    "\n",
    "Offensive linemen are often derided for their lack of athleticism, but they play one of the most crucial roles in football. When Stephen A. Smith refers to them as \"meat and potato boys\", he's probably referring to their sturdiness and their strength, and their propensity to survive on a steady diet of, well, meat and potatoes. While they rarely if ever receive any accolades or recognition, these men provide protection for some of our favorite players in almost every play.\n",
    "\n",
    "Their most basic role is to protect the passer. Passing could arguably be the most important yet simplest play in football. However, for quarterbacks to consistently make pass plays, they require offensive linemen to provide them with protection. \n",
    "\n",
    "Pass blocking is one of the most important roles in football. Without it, we wouldn't see players like Tom Brady, Aaron Rodgers, Patrick Mahomes and Josh Allen shine on the football field every Sunday. If a team’s offensive philosophy was to throw screens and quick slants every pass play, then it would make life for the offensive linemen relatively easy as there wouldn't be enough time for defenses to pressure. On the other hand, if the quarterback decided to hold onto the ball for four seconds every play, then even the best offensive linemen would allow pressure on a somewhat consistent basis.\n",
    "\n",
    "This analysis will explore data from week 1-8 of the 2021/22 season to gain some insights on the role of offensive linemen in pass plays. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "666a585e",
   "metadata": {
    "_cell_guid": "0085e841-35db-45df-a9b0-d27166a6f0ad",
    "_uuid": "b67386d3-08f3-4ece-9bfc-e0733c5deac6",
    "papermill": {
     "duration": 0.01069,
     "end_time": "2022-12-27T23:36:48.120277",
     "exception": false,
     "start_time": "2022-12-27T23:36:48.109587",
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
   "id": "c6284b4e",
   "metadata": {
    "_cell_guid": "29460fa3-32f8-4f71-a1d7-e5b2c04d0a80",
    "_uuid": "11c9348d-128f-4bb7-8bb3-2f39ddc31e0b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:36:48.146440Z",
     "iopub.status.busy": "2022-12-27T23:36:48.143157Z",
     "iopub.status.idle": "2022-12-27T23:36:49.946068Z",
     "shell.execute_reply": "2022-12-27T23:36:49.943937Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.818623,
     "end_time": "2022-12-27T23:36:49.949040",
     "exception": false,
     "start_time": "2022-12-27T23:36:48.130417",
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
   "id": "db7efee9",
   "metadata": {
    "_cell_guid": "37a6e399-1195-47df-8908-71717e451af2",
    "_uuid": "17b4889e-38a8-4b33-b88f-eb0d917d23e2",
    "papermill": {
     "duration": 0.010262,
     "end_time": "2022-12-27T23:36:49.970037",
     "exception": false,
     "start_time": "2022-12-27T23:36:49.959775",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **2. Importing data** \n",
    "Then, we import the datasets into RStudio using read.csv()."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "097af4a9",
   "metadata": {
    "_cell_guid": "eaa1e06a-12bd-4f87-a256-734faf99bd37",
    "_uuid": "b0ace5d7-d44d-4277-b1e9-ea27df67d43f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:36:50.028798Z",
     "iopub.status.busy": "2022-12-27T23:36:49.992981Z",
     "iopub.status.idle": "2022-12-27T23:37:57.202456Z",
     "shell.execute_reply": "2022-12-27T23:37:57.200512Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 67.224896,
     "end_time": "2022-12-27T23:37:57.205215",
     "exception": false,
     "start_time": "2022-12-27T23:36:49.980319",
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
   "id": "5e43f7bd",
   "metadata": {
    "_cell_guid": "8e6bd8de-0903-4d4e-87e1-42d10f62ffb7",
    "_uuid": "3adf4fdf-882a-4276-ab83-f0400c5d3261",
    "papermill": {
     "duration": 0.011469,
     "end_time": "2022-12-27T23:37:57.228985",
     "exception": false,
     "start_time": "2022-12-27T23:37:57.217516",
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
   "id": "9e17b3c6",
   "metadata": {
    "_cell_guid": "ad04e514-7099-4ff2-922e-4d9f31250779",
    "_uuid": "e4e19fbe-97be-43df-94d1-de98d365f3d4",
    "papermill": {
     "duration": 0.010406,
     "end_time": "2022-12-27T23:37:57.251097",
     "exception": false,
     "start_time": "2022-12-27T23:37:57.240691",
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
   "id": "dce2faa4",
   "metadata": {
    "_cell_guid": "9eee91e5-a0e7-468a-ab3f-250a7bcab391",
    "_uuid": "777ae314-b819-4357-ac70-99d3f86aa757",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:37:57.274931Z",
     "iopub.status.busy": "2022-12-27T23:37:57.273349Z",
     "iopub.status.idle": "2022-12-27T23:37:57.396111Z",
     "shell.execute_reply": "2022-12-27T23:37:57.393568Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.137835,
     "end_time": "2022-12-27T23:37:57.398992",
     "exception": false,
     "start_time": "2022-12-27T23:37:57.261157",
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
       "<caption>A data.frame: 6 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>game_id</th><th scope=col>season</th><th scope=col>week</th><th scope=col>game_date</th><th scope=col>game_time_eastern</th><th scope=col>home_team_abbr</th><th scope=col>visitor_team_abbr</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>2021090900</td><td>2021</td><td>1</td><td>2021-09-09</td><td>20:20:00</td><td>TB </td><td>DAL</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2021091200</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>ATL</td><td>PHI</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>2021091201</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>BUF</td><td>PIT</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2021091202</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>CAR</td><td>NYJ</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2021091203</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>CIN</td><td>MIN</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>2021091204</td><td>2021</td><td>1</td><td>2021-09-12</td><td>13:00:00</td><td>DET</td><td>SF </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 7\n",
       "\\begin{tabular}{r|lllllll}\n",
       "  & game\\_id & season & week & game\\_date & game\\_time\\_eastern & home\\_team\\_abbr & visitor\\_team\\_abbr\\\\\n",
       "  & <int> & <int> & <int> & <date> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 2021090900 & 2021 & 1 & 2021-09-09 & 20:20:00 & TB  & DAL\\\\\n",
       "\t2 & 2021091200 & 2021 & 1 & 2021-09-12 & 13:00:00 & ATL & PHI\\\\\n",
       "\t3 & 2021091201 & 2021 & 1 & 2021-09-12 & 13:00:00 & BUF & PIT\\\\\n",
       "\t4 & 2021091202 & 2021 & 1 & 2021-09-12 & 13:00:00 & CAR & NYJ\\\\\n",
       "\t5 & 2021091203 & 2021 & 1 & 2021-09-12 & 13:00:00 & CIN & MIN\\\\\n",
       "\t6 & 2021091204 & 2021 & 1 & 2021-09-12 & 13:00:00 & DET & SF \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 7\n",
       "\n",
       "| <!--/--> | game_id &lt;int&gt; | season &lt;int&gt; | week &lt;int&gt; | game_date &lt;date&gt; | game_time_eastern &lt;chr&gt; | home_team_abbr &lt;chr&gt; | visitor_team_abbr &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 1 | 2021090900 | 2021 | 1 | 2021-09-09 | 20:20:00 | TB  | DAL |\n",
       "| 2 | 2021091200 | 2021 | 1 | 2021-09-12 | 13:00:00 | ATL | PHI |\n",
       "| 3 | 2021091201 | 2021 | 1 | 2021-09-12 | 13:00:00 | BUF | PIT |\n",
       "| 4 | 2021091202 | 2021 | 1 | 2021-09-12 | 13:00:00 | CAR | NYJ |\n",
       "| 5 | 2021091203 | 2021 | 1 | 2021-09-12 | 13:00:00 | CIN | MIN |\n",
       "| 6 | 2021091204 | 2021 | 1 | 2021-09-12 | 13:00:00 | DET | SF  |\n",
       "\n"
      ],
      "text/plain": [
       "  game_id    season week game_date  game_time_eastern home_team_abbr\n",
       "1 2021090900 2021   1    2021-09-09 20:20:00          TB            \n",
       "2 2021091200 2021   1    2021-09-12 13:00:00          ATL           \n",
       "3 2021091201 2021   1    2021-09-12 13:00:00          BUF           \n",
       "4 2021091202 2021   1    2021-09-12 13:00:00          CAR           \n",
       "5 2021091203 2021   1    2021-09-12 13:00:00          CIN           \n",
       "6 2021091204 2021   1    2021-09-12 13:00:00          DET           \n",
       "  visitor_team_abbr\n",
       "1 DAL              \n",
       "2 PHI              \n",
       "3 PIT              \n",
       "4 NYJ              \n",
       "5 MIN              \n",
       "6 SF               "
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
    "head(games_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3aaddd24",
   "metadata": {
    "_cell_guid": "e1f53779-1f85-465c-9780-e4dfd1f2fef7",
    "_uuid": "1e274966-4343-4f35-a036-4a973f85f02a",
    "papermill": {
     "duration": 0.010817,
     "end_time": "2022-12-27T23:37:57.420420",
     "exception": false,
     "start_time": "2022-12-27T23:37:57.409603",
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
   "id": "826ae435",
   "metadata": {
    "_cell_guid": "00903a1c-e28e-49b9-bf0a-f607a2d3c66b",
    "_uuid": "aef1b688-8c88-4330-b3d0-627831f55f8e",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:37:57.446495Z",
     "iopub.status.busy": "2022-12-27T23:37:57.444172Z",
     "iopub.status.idle": "2022-12-27T23:37:57.521160Z",
     "shell.execute_reply": "2022-12-27T23:37:57.519256Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.092169,
     "end_time": "2022-12-27T23:37:57.523592",
     "exception": false,
     "start_time": "2022-12-27T23:37:57.431423",
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
   "cell_type": "code",
   "execution_count": 5,
   "id": "6ed7102a",
   "metadata": {
    "_cell_guid": "54fe3199-e186-4783-b444-2b42654eeded",
    "_uuid": "00996a4f-b792-4ae9-964e-beae3abf4250",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:37:57.548867Z",
     "iopub.status.busy": "2022-12-27T23:37:57.547258Z",
     "iopub.status.idle": "2022-12-27T23:37:58.178684Z",
     "shell.execute_reply": "2022-12-27T23:37:58.176711Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.646819,
     "end_time": "2022-12-27T23:37:58.181270",
     "exception": false,
     "start_time": "2022-12-27T23:37:57.534451",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEO\nAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEAR\nBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAA\nAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDs\nAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAU\nQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFOG0ud4T/zfCO2X2WcU+8+ofSyaMuv1/1Re49MkX\nTijwiohI4r3nH3z1/S9+KdO79ew78soL2vt0m7sFAADYg9gZ7IwfPnz8pXWbhxlG1aTNX232\nFZ541ageVVM6BNzmhVUv3njvvJ+Gjx5zYUHstYdnTbgm9sxDl2k2tgsAALBnsSnY/f7BjBsf\n+Wh9abjG9PXLtuR3P+SQQ3rUvIERmT7vu47Dpw89qr2IdLxTho24+7nfhp/TPGBPwwAAAHsc\nm75j17jX0PGTbr/nzutqTP96S7hgv/x4aMvv6zcb1aaHS9//uTI++MgW5lVPQf/eOe5PF/1h\nT7cAAAB7IpuO2LnzWnXMk3jEW2P6l+XRxIf3n/HA8qhhOAPFx55z1aUn9hKRSMU3ItLdv729\nHn7nW9+WVl294447fv75Z/Nyhw4drrrqqoyvw67l5eXtcXV1XRcRj8fjdNr6PUtN00TE5/N5\nPB6bi4pIIBAwDCP5wpmom5uba2ddh8NhVrd5ZJqDStd1m+uaY9jlctlc19zOXq/X5XLZWdfk\n9/u93prPqJlTNZhzcnLsH8wikpuba1tRyfZO5HQ6s7ITud1um+ua48rr9brdbjvrmvx+v8/n\ns61c1U7UqFGjeu5EiUQiyVy7fzxRXTyytlTT2zXud+ezU/PiW/77+txpc270dPr7yK75iXCF\niBS5tv9aosilR7dEq65+++23y5cvNy9HIpGsPLFWyVb1+td1OBxVz5t20nXdfP6ymc0pNut1\nszIyNU3LSt1sDWZ2InvsVYN5b9uJ9rbBXP+68Xg82f3X897rQ3e3nD9//qcsOLoAACAASURB\nVLZrRQPOHr/irTMXzv125D2HOTx+Efkzmmjm3jrINkTjzoLt3R500EGtWrUyL7dt2zYc3vHb\ne/YdDBIR2V49W3VT53a7NU2Lx+OxWKwBW6qTeaAuFoslH5cNS9M08+1gNBpN/kanYTkcDvPZ\nORKJ2HmQQ9d184mjPiMkDU6nU9d1wzAikYiddV0ul8PhSCQS0Wi07qUbTnZ3IpsHc9VOZPNg\nrtqJbB7M5k5k/2A2dyL7B7O5E9k/mM2diFeEVBmGkSQKZzPY7ewvTXwLN5WIiMu/r8ii5aFo\nM/fWrLQiFMvrsf0Q8ZVXXll1ORqNlpaW7nBH9gassrKyLNdNXX5+vtPpjEQiFRUVDdhSnczd\nuLKysrKy0raiDoejcePGIhIMBu18uqz6cLC8vNzOpw+v12t+XlafEZKGQCDg8/ni8bjNdXNz\nc91udzQatbluQUGBruvhcDgYDNpZ1wx2lZWVdmYdXdfN18JgMGjna7/b7TZfC8vLy+0MlD6f\nzwx2Ng+qnJwcXdft34ny8vIcDkc0Gi0vL7ezbmFhoYiEw+FQKGRbUU3TzLqhUMjO4F71ilBR\nUVH/IJvkmxjZPEHx5hWzLrp49B+RbS94RnzRb8H87p1FxJs/sKVbf2NxiTknWv7FZ2WR/Qc2\ny1arAAAAu79sBrvcDmcWBv+47uaHP/t2xcqlXz0342/vVzS65OLOIiKaa9zQrisfnbzwixXr\nVv1v7sTpgZZHD2/BuU4AAAB2KZsfxTqcRVNn3fz47Gfuu+WGSmduh449r5sxZb+crd8Y7Xjm\nLZeHZzw7feLGSm2f3gOmjhvF2YkBAACSsDXY6e5Wr7zySvUpnoIel11/22W1Lq3pR48Yd/QI\nWzoDAADY82Xzo1gAAAA0IIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog\n2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAA\nKIJgBwAAoAiCHQAAgCIIdgAAAIpwZrsBNIDiouI0b+kT8aV8o5INJWmWAwAAmcQROwAAAEUQ\n7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAA\nFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAU4cx2\nA9iDFRcVp3nLHJGclG9UsqEkzXIAAOwdOGIHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAA\noAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIId\nAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAi\nUgp2id9WrTQvVa7/dNJfR1854Y63V5Vloi0AAACkymlxuUjpknP6D3nlx2aRiqVGbNPJ3Qe8\ntTEkIg9Nf/iJ7/93bpucTDYJAACAulk9Yvf8KcNeWhYZcc0VIrL+87FvbQyNfmPFptUf7O9a\nd+2ZL2SyQwAAAFhiNdjd9sn6tifNmzP1MhH55pb3PXn97xvcKb/dYfed13Hj/6ZnskMAAABY\nYjXY/RyOFfVrbV5+8pOSwl7X6CIiEugQiIV+zExvAAAASIHVYHdormft61+JSHjz28+VBPe/\nfn9z+mcLfnX5u2aqOwAAAFhm9ccTN4/sfNiMC068+HPnx09pzsa3Hd48VvnDnGnTrvro96ZH\nTstoiwAAALDCarA7+K6Fk9ced9vj90c13wXTP9w34Cpfu+DyG2fntOr/9D9Oy2iLAAAAsMJq\nsHM4C2+a9+kNwQ0VeuM8j0NEvAWDX/5XvyOO7pena5nsEAAAAJZYDHaJcDjqcHtc/qK8qlv6\nu598XKbaApIoLipO85Z5dS+ys5INJWmWAwDAXpZ+PGHEy/L9vqNf4NevAAAAuy9LwU7T88Z1\na7zqsU8z3Q0AAADSZvU7dhM/eOOrQ08Yfb9vyqVDCj16RntKlaZpgUAgiw1kqzp1d/O6DsfW\nN05+v98wjIbrqA5Op1OysV+4XC4RcTgcNtfVdV1EnE6nzXXNx9ftdmtaFr5n7PF4zAfaHlWD\n2efzJRIJ2+qaD66I+P1+24pKtnciXdf3kp3I5Ha7qwaYDap2WK/Xa25we1Tfier5ipB8H7T6\nvDDkjAmJpm0eGnvqQ1d7mzYv9rp2eAxWr16dfoMNwc4xsftUp+5uXrfqhg6Hw85gV/W0ZfMW\nM+tqmraX1K2qvjfUrRpU2aqblUFlf90qe8OgylbdbA3mBnxFSP5m0mqw83q9Ii1OOKFFfVrJ\nEMMwysrKdpjksbWB7dWpq3bdFLlcrry8PBEpLy+38yCH1+vNycmpZb/IsEAg4PP54vG4zXVz\nc3Pdbnc0GrW5bkFBga7r4XA4GAzaWdfj8YhIZWVlOBy2raiu6263W0SCwWAsFrOtrtvtNo+p\nlJeX2/nuyOfzOZ1O+3einJwcXdft34ny8vIcDkc0Gi0vL7ezbmFhoYiEw+FQKGRbUU3TzLqh\nUCgSidhWt+oVoaKiIh6P1/PevF7vrmZZDXavvvpqPZsAAABARqX2FY3v35333L+X/Lz+z8Pv\nnH2Wa/HH63oN6NkkQ50BAAAgJdaDnfHgBYeNfmKxecU/8f4Tyu8fuN9rh1/8wDsPj3ZyimIA\nAIBss/q1wR+fOW30E4sHjZ7x9cq15pSCTnfddkm/RXPGnDR7ecbaAwAAgFVWg90t495u3G38\nOzOv6tVx6+8nnP6u42d/dPO+hYsmT81YewAAALDKarCbvyG0z8hzdp5+6vkdKjfyuwoAAIDs\nsxrs2nj0spVbdp6+aWmp7tkdz4ECAACwt7H644kb+jYZ+fT5/7196cFF20+dEly38IJ5q4r2\nfyQzvQG7keKi4vRv3DjlW5RsKEm/HABgb2X1iN1p8x5po/08oH2fS6+dIiJLn39s6l9Hdu90\n7M+J5g/844xMdggAAABLrAY7X/HxX379yukHOuZOnywi7904btK0pxsdPOylL785vXk2/08r\nAAAATCmcoDi30+BnFw5+tGT10h/XxXRfq049WuXb+6+dgL1P+h8BayJFKd+Ij4ABYI9mNdi1\n7nPU+eeff/7wM7oUtz+guH1GewIAAEAarH4UW7z509vGjejWLL/v8efPev7tP6P2/UdzAAAA\nWGE12H2xZtOyDxbccMnJG5a8MObsY5rltzn14uv++f5S8h0AAMBuwmqwE3F0O+ykWx6a98PG\njYtffeKSk7p/+NS00wf0LGh3wOU33ffflX9msEcAAABYYD3YbaU5Av2GjJj53FtfLn5+cJf8\nLT99/tDUsYd0Kerc78R7nnk/Ey0CAADAihR+FWv65ev35s+fP//F+Yu/+0PT9C4HHz/sjGFF\nG/8799Gn/nrea29+v/idKf0y0SgAAACSsxrsfvzs7Rfnz5//4ouf/rBR0xydDjp2wrRhZwwb\n2qt1IxERGXnlzfdM2r/9HdMukCnLM9cuAAAAdsVqsOt44DGa5uh44DE33DNs2LChfdrk1lhA\n03MGdWt8z0/+hu4QAAAAllgNdtffPXfYsKH7tc2rMd1IBMsqJLeRX0QGPP99sIHbAwAAgFVW\nfzxx27UX7ZzqROTXd04tLO7WoC0BAAAgHVaP2Bnx8pljRz357mcbQ7Hq03//+SfN1z0DjQEA\nACA1Vo/YfTnliCtnPr8lv33n5rE1a9Z07dWnd6+uzo3rtMYDH1zwZkZbBAAAgBVWj9jd8MDS\nwp63rFg8wYiXd8gpOGzm3ye0bhRav6hn++PLWwQy2iIAAACssHrE7oMtkXZnDRERTc8Z3sS/\n8IuNIuJrMuDvI9vdMnROBhsEAACANVaDXYFTi5ZFzct9WwXWLlhrXm57WqvNP9ybkdYAAACQ\nCqvB7uKWjX54/I5fwnERaX1Sy1/feMSc/vu7f2SqNQAAAKTCarC79LFRoZJ/7lPUZnVlfJ/z\nLw6uf6rfBX+7e8rVQ6Z927jHdRltEQAAAFZY/fFE8wF3ffli85sfftWhSaD5pc+NnX/ujHv+\naxi5+xw7/81LM9oiAAAArLAa7ESk96lX//PUq83LZ05/e/DVK1ZXeLt3aePSMtMaAAAAUpFC\nsKsht3Xn3g3YCAAAAOonWbDr1KmTxXtZuXJlQzQDAACA9CULdu3atbOrDQAAANRXsmD39ttv\n29YHgN1KcVFxmrd0ihSlfKOSDSVplgMAVFPHd+yMeNlbzz/97ufLymOuTn2O+L+RJ3mtniAF\nAAAAtkoW7GKVPwzb78CXl2/eNuHeOx8+d+F/nujuT/8nFwAAAMiQZMff/nPZCS8v37zPMf/3\n3Mtvvb3g+SsGd/7jk2eGDH/FtuYAAABgXbJjb1Nf/slXOOTrf80KODQROWrISb82LXztzRtF\nTrOrPQAAAFiV7IjdJ2WRFoOuNVOdiIjDd83xrWOh5Xb0BQAAgBQlC3bhhOFu7K4+xd3YbRhG\nhlsCAABAOviNKwAAgCIIdgAAAIqo48Qlf3793LRpi6uu/vz5BhGZNm1ajcXGjRvX4J0BAAAg\nJXUEuz+WPHDtkpoTr7322hpTCHYAAABZlyzYvfbaa7b1AQAAgHpKFuxOOOEE2/oAAABAPfHj\nCQAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUkSzYHdm750Uf/GZe7tat25Sf\ny2xpCQAAAOlIdh67dT+sWHnbnA9vOtblkOXLl3/z6ccf/9ao1iX79u2bmfYAAABgVbJg99CY\nw468a1L/NyeZV18cevSLu1jSMIyGbgwAAACpSRbsBt65cNWw9z9f9XvcMM4666xj7nvswqZ+\n2zoDAABASpIFOxFpf8Dh7Q8QEZk/f/6xZ5xxZrOAHU0BAAAgdXUEuyr/+Mc/RCS49qv5C95e\ntmpdMO5s3qHHMacM/UvrnEy2BwAAAKusBjsRefGms8699YVwYvvX6SaMvWzYhGfmTTk9A40B\nAAAgNVbPY7f6H+cOnTqvyYAL57398dr1GzeVrPt04fyLjmj6wtShw/+5JpMdAgAAwBKrR+zu\nGftKTsuRy9+Z43do5pQDBp7+lwGDE22bvXDFNDntgYx1CAAAAEusHrF7viTY+ZKrqlKdSXP4\nrxrTJVTyXAYaAwAAQGqsBrsch6Pyj8qdp1f+Uanp/H4CAAAg+6wGu7Gd8n74++WfbQpXnxgp\n/WLM3BV5Ha/KQGMAAABIjdXv2F0wf8qkHlcc2q73hWMuOLRXR6+Efvzf4idmPrYi6L7/Hxdk\ntEUAAABYYTXY5Xe5fNnbzvMuv2H2beNnb5vYuMvhs2Y9dVnX/Aw1BwAAAOtSOI9dq4GXvPfd\nqF+Xf770x3Vh8bTo0H3/bq2tfpQLAACADEsh2ImIiNaq6wGtumakFQAAANQHR9wAAAAUQbAD\nAABQBMEOAABAEQQ7AAAARVgMdolwOBw1MtsKAAAA6sPSr2KNeFm+v6DvsyvfO3OfetZ74v9G\neKfMPqvYt21C4r3nH3z1/S9+KdO79ew78soL2vt0C7MAAABQk6UjdpqeN65b41WPfVq/WsYP\nHz720rrNMWP7ob9VL95477wl/U4bNWns+f4f35lwzRzDwiwAAADszOp37CZ+8EavX64Yff+C\njeF4GmV+/2DGxcPPuOaul41qqU6MyPR533UcfsvQo/r1+Ev/sXeOLl/7xnO/VdQxCwAAALWx\nGuyGnDEh1LTNQ2NPLfY3at6qbfsd1Xnzxr2Gjp90+z13Xld9Yrj0/Z8r44OPbGFe9RT0753j\n/nTRH8lnAQAAoFZW//OE1+sVaXHCCS3SK+POa9UxT+IRb/WJkYpvRKS7f3sPPfzOt74tTT7L\nNG/evPXr15uXmzVrNmTIkPQaaxCBQIC61FWg6B5aV9d1EXE6nTY373A4RMTtdmuaZmddk8fj\ncTpT/ddB6TNXVkR8Pl8ikbCtrvngiojf77etqIiY21bTNJsHlcvlEhFd122um62dyOR2u6sG\nmA2qdliv12tucHtU34l2+PQydcn3QavPC6+++mp9mqhVIlwhIkWu7T+JKHLp0S3R5LOq+lm+\nfLl5uU+fPsOGDWvw9qzz+Xx1L0Rd6u72RffourquZ6V5p9NpZ8Cq4na77S8qIh6PJyt1s/Lg\napqWlboOh2OvGswul8vOgFUlWzuR1+ute6Gk4vFkX4pL7SH8/t15z/17yc/r/zz8ztlnuRZ/\nvK7XgJ5N0u7M4fGLyJ/RRDP31hi7IRp3FjiTzzK1b9++KnS3adMmFovtcNf2jszt1amrcN29\namWzWDd1uq5rmmYYRvInuwZn1k0kEnYewZJtB5Pi8Xg93/SnRNM086BOturWZ4SkweFwmMdX\nslJ3bxvM7ESpSiQSVQezd2b9ydt48ILDRj+x2Lzin3j/CeX3D9zvtcMvfuCdh0c70/ogwuXf\nV2TR8lC0mXvrW8AVoVhej7zks0xTp06tuhyNRjdv3rzDXRel00/atlenrsJ196qVzWLd1OXm\n5rrd7kgkUlZW1oAt1amgoEDX9crKymAwaGfdoqIiEQkGg+Fw2Laiuq4XFBSISFlZmZ1Zx+12\n5+bmikhpaamdr8E+ny8QCCQSifqMzDTk5OR4vd5YLFZaWlr30g0nLy/P5XJFIpHy8nI76xYW\nFmqaFgqFQqGQbUU1TSssLBSRioqKSCRiW12Xy5WXlyciW7ZsqX9wN58HamU12P34zGmjn1g8\naPSM6WOH9e7UUkQKOt112yUbr394zEn7DXrj/7qm0ZY3f2BL90NvLC45YnArEYmWf/FZWWTo\nwGbJZwFQWHFRcZq39Iik/iFhyYaSNMsBwG7J6tcVbxn3duNu49+ZeVWvjlt/P+H0dx0/+6Ob\n9y1cNHlq8tvukuYaN7TrykcnL/xixbpV/5s7cXqg5dHDWwTqmAUAAIDaWD1iN39DqNs15+w8\n/dTzO9w8Pv3fVXQ885bLwzOenT5xY6W2T+8BU8eN0izMAgAAwM6sBrs2Hr1s5Zadp29aWqp7\nrJ4DRXe3euWVV3aYpOlHjxh39Ijalk4yCwAAADux+lHsDX2b/PD0+f/dUFl9YnDdwgvmrSra\n77pd3QoAAAC2sRrsTpv3SBvt5wHt+1x67RQRWfr8Y1P/OrJ7p2N/TjR/4B9nZLJDAAAAWGI1\n2PmKj//y61dOP9Axd/pkEXnvxnGTpj3d6OBhL335zenN+U0DAABA9qVwEtLcToOfXTj40ZLV\nS39cF9N9rTr1aJWfnVOQAwAAYGcpn13eV9z+gOL2mWgFAAAA9ZFKsEuE3njy/udefXf56t9j\nzkDbLr1POOOCi0/qy1lIAAAAdgdWv2MXj/x64cHtTrhw/DMLFq3dHIlu+uXN5x655OSDuw2Z\nUBa379+8AAAAYFesBrtFVxzz+Kfrj7jygdWby9etXv7tD7+Wb1kz86ojvn/9tqMmf57RFgEA\nAGCF1WA34flVBV1u/M99Y9o2cplTnIE2o2f856Zujb+ZdUPG2gMAAIBVVoPdsmC0/Tmn7zz9\n9BEdImUfN2hLAAAASIfVYHdyoW/Dxz/tPP2XJRs8uf0btCUAAACkw2qwu2XORev+fe4dr31X\nfeKKf9191ms/97pySgYaAwAAQGqSne7kiiuuqH71iFaO60/s/vD+/Q/s1ilXK1u5/PP3P1ul\nu5ueVLBYZP8M9wkAAIA6JAt2s2fPrrm00/nrN0t+/WZJ1VVJbJw07uobrhyTqQYBAABgTbJg\nF41GbesDAAAA9WT1O3YAAADYzaXwL8VCvy3/6PNlGytqOYx35plnNlxLAAAASIfVYLfmxb/+\n5ezpf0YTtc4l2AEAAGSd1WB3xaWztuitJ828fWD3Nk4toy0BAAAgHVaD3cLN4d43L5h8Se+M\ndgMAAIC0Wf3xxKG5bm8Tb0ZbAQAAQH1YDXb3Tjnqs79e+Nn6UEa7AQAAQNqsfhTbY8zLo2YW\n92vTcdDgI1oX+WvMnTNnTkM3BgAAgNRYDXYfju8/8/tNIpve/dc/d/7xBMEOAAAg66x+FHv5\nzM9yWg9dsmZjtDK0s4y2CAAAACssHbEzEhXfBmP9H7794LaNM90QAAAA0mPpiJ2mOdt69E1f\nlWS6GwAAAKTN2kexmue1B4Yvv++EGa9+a2S4IQAAAKTH6o8nLntyZUtn2dUn7Ts+v2lxjqvG\n3F9++aWhGwMAAEBqrAa7oqKiomOH9MloLwAAAKgHq8HupZdeymgfAAAAqCerwa60tDTJ3Ly8\nvIZoBgAAAOmzGuzy8/OTzDUMflMBAACQZVaD3eTJk3e4bsTWrVr28rwFf2otJz90W4O3BQAA\ngFRZDXaTJk3aeeKMuz8e1HnAjPs+n3DBuQ3aFQAAAFJm9V+K1crXtO+cKX02fH3votJwQzUE\nAACA9NQr2ImIv5Vf0/Qu/ppntgMAAIDN6hXsEtGSeyd+5crZr5mrvgERAAAA9WT1O3b9+vXb\naVrit5Xf/LSx8oAbZzZsTwAAAEiD1WBXG0frfY88ZdB5d03o22DtAAAAIF1Wg92SJUsy2gcA\nAADqie/GAQAAKCLZEbvvv//e4r106dKlIZoBAABA+pIFu65du1q8F/6lGAAAQNYlC3Y1/43Y\njhLRjU/dO3t1MOrQcxq4KQAAAKQuWbCr9d+ImVa89chFF9+zOhhtc9h5cx/ldCcAAADZl/KP\nJyKbl9547iFdjr304z+bTpjzzuoPnjq6c14mOgMAAEBKUjqPXeLduRMvueru1aHYIefeOPfB\nid1y3ZnqCwAAACmyGuxKv39rzMUXP/3hL43aHf7wnEdHHdUxo20BAAAgVXV/FGvENj028bxW\nPQY/u2TTORPmrln5HqkOAABgN1THEbsf35170cXXLFpT1vrQ81589IFjuuTb0xYAAABSlSzY\n3TS8/y3PfORwFl5y+5ypo47SJb5x48ZalywsLMxMewAAALAqWbCb+vSHIhKPbnjk+rMeuT7Z\nvXCCYgAAgKxLFuzGjBljWx8AAACop2TB7oEHHrCtDwDIouKi4jRv6Rfxp3yjkg0laZYDgKRS\nPkExAAAAdk8EOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEO\nAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEAR\nBDsAAABFOLPdQMPwer17YXXqKlx3r1pZ6qbB5XJpmtYgzVjhcGw9CuB2u51O+144qmp5vV7D\nMGyr63K5RETTNJtHiK7rIuJwOGyuaz6+uq5nZY9wOp121q3acdxud9XAtoH54IqIx+NJJBL1\nuavk+4Jm566SIbFYrMYUl9NlZwPRWJS6ytfdq1aWurbVTYOZdeLxuJ3P3pqmmS9L2aq78/N8\nRjkcDvMlPyt1DcOIx+N21tV1XdO0RCJRz8CRKnMwZ6vunrsTJRIJt9u9q7kqHLEzDKO0tHSH\nSUW2NrB582bqql93r1pZ6tpWN3VFRUUiEgwGw+Fww3VUB13XCwoKRKSsrMzOrON2u3Nzc0Wk\ntLTUztdgn88XCAQSiUR9Hqk05OTkeL3eWCxW80Utw/Ly8lwuVyQSKS8vt7NuYWGhpmmhUCgU\nCtlWVNO0wsJCEamoqIhEIrbVdblceXl5IrJly5b6B3fzeaBWfMcOAABAEQQ7AAAARRDsAAAA\nFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABShwnnsAGAPVVxUnOYtG4k0SvlGJRtK0iwHYA/B\nETsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAA\nAEXwnycAYK+T/n+8yE/5Fvy7C8BOHLEDAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATB\nDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABA\nEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsA\nAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFOHMdgMAgL1CcVFx+jcuTPkWJRtK\n0i8H7LE4YgcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAA\nKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKcGa7AQAAMqi4\nqDjNWzpEilK+UcmGkjTLAQ2BI3YAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAA\nKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACgiy/9S7I8lE0bd/r/qUy598oUTCrwiIpJ47/kH\nX33/i1/K9G49+4688oL2Pj0rTQIAAOwRshzsNn+12Vd44lWjelRN6RBwmxdWvXjjvfN+Gj56\nzIUFsdcenjXhmtgzD12mZalPAACA3V+Wg936ZVvyux9yyCE9as4wItPnfddx+PShR7UXkY53\nyrARdz/32/Bzmgey0CUAAMCeIMvfsft6S7hgv/x4aMvv6zcb1aaHS9//uTI++MgW5lVPQf/e\nOe5PF/2RlSYBAAD2CFk+YvdleTTx4f1nPLA8ahjOQPGx51x16Ym9RCRS8Y2IdPdvb6+H3/nW\nt6VVVxcuXLh582bzckFBwYEHHmhv4zvwer3Upa4CRalLXWWK7qF1dV0XEYfDYXPzDofDrJ6V\njeZ0Ou2sq2lbv9XldrvNFbeH+eCKiMfjSSQS9bkrwzCSzM1msItH1pZqervG/e58dmpefMt/\nX587bc6Nnk5/H9k1PxGuEJEi1/ZfSxS59OiWaNXVxx57bPny5eblTv3FVwAAIABJREFUPn36\nDBw40Obmq8vJyaEudRUoSl3qKlN0j66r63pWmne5XC6Xy/66Ho/H4/HYXzdb0d/v99fzHuLx\neJK52Qx2urvl/Pnzt10rGnD2+BVvnblw7rcj7znM4fGLyJ/RRDP31jS9IRp3Fmzv1u/35+bm\nVl2umV7t/ZHF9urUVbjuXrWy1KXuHl50t6ibuqqDSfW5kz2urs1FFai7+x6x29lfmvgWbioR\nEZd/X5FFy0PRZu6tKX5FKJbXI69qyUceeaTqcjQa3bhx4w53VGRHt1W2V6euwnX3qpWlLnX3\n8KK7Rd3U5eTkeL3eaDRaWlpa99INJy8vz+VyVVZWlpeX21m3sLBQ07RgMBgKhWwrqmlaYWGh\niJSVlUUiEdvqulyuvLw8Edm8eXPyQ25WFBXtclhn88cTm1fMuuji0X9Etn3SbMQX/RbM795Z\nRLz5A1u69TcWl5hzouVffFYW2X9gs2y1CgAAsPvLZrDL7XBmYfCP625++LNvV6xc+tVzM/72\nfkWjSy7uLCKiucYN7bry0ckLv1ixbtX/5k6cHmh59PAWnOsEAABgl7L5UazDWTR11s2Pz37m\nvltuqHTmdujY87oZU/bL2frNzY5n3nJ5eMaz0ydurNT26T1g6rhRnJ0YAAAgiSx/x85T0OOy\n62+7rNZ5mn70iHFHj7C5IwAAgD1Vlk9QDAAAgIZCsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAU\nQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAA/H979x3YRNnAcfzJbJvuBYW2\nUMqWTZClZYkDRBTkRRAEAXGAAwUFBBVQwIHgQmS4EBkKsgQZyhAQEAWcTAELFDro3m1y7x+p\npXakK7nWp9/PX+31cr+73OXJr5dLAklQ7AAAACRBsQMAAJAExQ4AAEASFDsAAABJUOwAAAAk\nQbEDAACQBMUOAABAEhQ7AAAASVDsAAAAJEGxAwAAkATFDgAAQBIUOwAAAElQ7AAAACRBsQMA\nAJAExQ4AAEASFDsAAABJUOwAAAAkQbEDAACQBMUOAABAEhQ7AAAASVDsAAAAJEGxAwAAkATF\nDgAAQBIUOwAAAElQ7AAAACRBsQMAAJAExQ4AAEASFDsAAABJUOwAAAAkQbEDAACQBMUOAABA\nEhQ7AAAASVDsAAAAJEGxAwAAkIS+qlcAAAAJBQYEVvCWBiECyn2j2LjYCsZBLpyxAwAAkATF\nDgAAQBIUOwAAAElQ7AAAACRBsQMAAJAExQ4AAEASFDsAAABJUOwAAAAkQbEDAACQBMUOAABA\nEhQ7AAAASVDsAAAAJEGxAwAAkATFDgAAQBIUOwAAAElQ7AAAACRBsQMAAJAExQ4AAEASFDsA\nAABJUOwAAAAkQbEDAACQhL6qVwAAADhMYEBgBW/pKoRruW8UGxdbwTg4B2fsAAAAJEGxAwAA\nkATFDgAAQBIUOwAAAElQ7AAAACQhybtiDQZDDUwnV+LcGrWx5MqdW6M2ltwK0Ol0aq68RqOp\nklydTmf7Qa/Xa7VOPK2mURTFeUtXR25ubv79ZaPVqHom0qpYyZU+t0ZtLLnk/tdDyVU/twJs\nHUv9HvJfz7VYLHp9iSfmZDhjpyjKtWvX/jUpQNUVuJ5OrsS5NWpjySX3Px5KbhXklp+/v79G\no0lPT8/IyHDgKtmn0Wj8/f2FECkpKdnZ2arlGgwGb29vIURiYqLFYqnk0gICStzNXGMHAAAg\nCYodAACAJCh2AAAAkqDYAQAASIJiBwAAIAmKHQAAgCQodgAAAJKg2AEAAEiCYgcAACAJih0A\nAIAkKHYAAACSoNgBAABIgmIHAAAgCYodAACAJCh2AAAAkqDYAQAASIJiBwAAIAmKHQAAgCQo\ndgAAAJKg2AEAAEiCYgcAACAJih0AAIAkKHYAAACSoNgBAABIgmIHAAAgCYodAACAJCh2AAAA\nkqDYAQAASIJiBwAAIAmKHQAAgCT0Vb0CAADgPy8wILCCt3QXwr3cN4qNi61gnOw4YwcAACAJ\nih0AAIAkKHYAAACSoNgBAABIgmIHAAAgCYodAACAJCh2AAAAkqDYAQAASIJiBwAAIAmKHQAA\ngCQodgAAAJKg2AEAAEiCYgcAACAJih0AAIAkKHYAAACSoNgBAABIgmIHAAAgCYodAACAJCh2\nAAAAkqDYAQAASIJiBwAAIAmKHQAAgCQodgAAAJKg2AEAAEiCYgcAACAJih0AAIAkKHYAAACS\noNgBAABIgmIHAAAgCYodAACAJCh2AAAAkqDYAQAASIJiBwAAIAmKHQAAgCQodgAAAJKg2AEA\nAEiCYgcAACAJih0AAIAkKHYAAACSoNgBAABIgmIHAAAgCX1VrwAAAEAFBQYEVvCWXhW5UWxc\nbGVzfSseWhbVudhZ96x+f/P3Ry+m6Jq37PTgk6MauOmqepUAAACqr+r7Uuy5ddMXrDnYZeDY\nlyaMMP317bRnlipVvUoAAADVWXUtdkr2/DUnGj3wyqDeXVqYIya8Nj718tZVV9KqerUAAACq\nr2pa7LKSvo/MtPTpVdf2q4tvRBsP45G90VW7VgAAANVZNb3GLjvtVyHEDabrq9fCpN/xe1L+\nr7///nt6errtZ1dX1/r166u8hgUZDAZyyZUglFxypQkll1yZcssVWk2LnTUrTQgRYLj+bokA\ngy4nOSf/11dfffXkyZO2n9u2bbts2TKV17Agb29vcsmVIJRccqUJJZdcmXILhVosFjszV9Ni\np3UxCSHic6xBxrwXi+NyLHrfsq6tIqrmjRbkSpxbozaWXHKlCSWXXMlyS1VNi53B1EqIvScz\ncoKMLrYppzNyvVtcb6yLFy/Ob6yKoly7dq2SiSaTyc3NzWKxJCYmVnJR5eLp6Wk0GrOzs1NS\nUtTM9fb21uv1mZmZaWmqviXFz89Po9GkpaVlZmaqFqrVan19fYUQycnJOTk5pc7vKAaDwcvL\nSwiRkJBgtVpVy3V1dXV3d1cUJT4+XrVQIYS7u7urq2tubm5SUlLpczuOl5eXwWDIyspKTU1V\nM9fHx0en02VkZORfFqIOf39/IURqampWVpZqoTqdzsfHRwiRlJSUm5urWq7RaPT09BRCxMfH\nK4p6z6Nubm4mk8lqtSYkJKgWKoTw8PBwcXHJyclJTk5WM7dGPSNoNBo/Pz8hREpKSnZ2tmq5\ner3eduItMTHR/im3srCNA8UHVXLRTuLq0zPYuGjrD7E9+oQIIXJSj/6Ukj2oZ1D+DO7u7vk/\n5+TkVP6JJH/IUHPsqMLc/NCakFvwTq5puaqF1sDc/NCakFsdDmYeRPLlFl0BlUOlzK2m74oV\nGsPEQc3OfDhj19HTUed+W/bCfPfgWx+o6176DQEAAGqqanrGTgjR6L5XxmW9tXL+C9cyNQ3b\ndH954lhNVa8SAABAdVZ9i53Q6G4dOfHWkVW9GgAAAP8R1fWlWAAAAJQTxQ4AAEASFDsAAABJ\nUOwAAAAkQbEDAACQBMUOAABAEhQ7AAAASVDsAAAAJEGxAwAAkATFDgAAQBIUOwAAAElQ7AAA\nACRBsQMAAJAExQ4AAEASFDsAAABJUOwAAAAkQbEDAACQBMUOAABAEhQ7AAAASVDsAAAAJEGx\nAwAAkATFDgAAQBIUOwAAAElQ7AAAACRBsQMAAJAExQ4AAEASFDsAAABJaBRFqep1qKycnJyk\npKRKLiQ+Pj4uLs7FxaV+/foOWasyunr1anJysoeHR926ddXMjYyMzMzM9PPzCwgIUDP3zJkz\niqLUrl3b29tbtVCLxfLXX38JIUJDQ93c3FTLzcjIuHjxohAiPDxcr9erlpucnHz16lWtVtuo\nUSPVQoUQsbGxCQkJbm5uoaGhauZGRUWlpqZ6eXkFBQWpmXvhwoXs7OyAgAA/Pz/VQhVFOXPm\njBCiTp06np6equVmZ2dfuHBBCBEWFmY0GlXLTU1NjYqKEkI0btxYo9GolpuQkBAbG6vX68PD\nw1ULFUJER0cnJSWZTKaQkBA1cy9evJiRkeHr6xsYGKhm7l9//WWxWKrqGSE4ONjd3V213MzM\nzMjISCFEgwYNDAZDJZdm77lbgaIoirJo0SKz2TxgwACVc6dMmWI2mydMmKBy7tChQ81m8/z5\n81XO7dq1q9lsXrdunZqhV65cMZvNZrP5p59+UjP38OHDttyYmBg1c9esWWM2myMiItQMVRRl\n3rx5ZrN5+PDhKuc+8cQTZrN52rRpKuf279/fbDYvXrxYzdCcnBzbQbVt2zY1c8+ePWvLPXHi\nhJq53333nS03LS1NzdyPPvrIbDb36dNHzVBFUWbOnGk2mx955BGVc0eNGmU2m+fMmaNybq9e\nvcxm8+eff65maGJiou2g2rdvn5q5v/zyiy03MjLSqUG8FAsAACAJih0AAIAkKHYAAACSkOHN\nEw5x7ty5c+fOmUymrl27qpn722+/RUdHBwQEtG3bVs3cw4cPp6Sk1KtXr0mTJmrm7tq1y2q1\nNm/ePDg4WLXQzMzM/fv3CyHMZrOvr69qufHx8UePHhVCREREuLi4qJZ78eLFU6dO6XS6nj17\nqhYqhDh9+nRkZKSXl1fHjh3VzD127Ni1a9eCgoJatmypZu6BAwcyMjLCw8PVvL7earXu2rVL\nCNGyZUs13yySmpp66NAhIUTHjh29vLxUy42Jifn111+FED179tTpdKrlXrhw4ezZsy4uLhER\nEaqFCiH+/PPPqKgoPz+/9u3bq5l75MiRpKSkkJCQZs2aqZm7d+/enJycJk2a1KtXT7XQnJyc\nvXv3CiHatm2r5tsHk5KSjhw5IoTo2rWryWRyXhDFDgAAQBK8FAsAACAJih0AAIAk1PvQ1Kp1\n6oPxz22LWb7uC29d3kdcbn9y+Pt/p765Zl0j17zrNo7OHPPy78Z1Xy76Y87YaYei82+r0ejc\n/YLMEf3GP9jXVVvxT8hULMk7v/hsx/c/R8YkKAbPsGZt+w8bE9E471MZ3xs5eEdC5j+JGjfP\nQHPvAY8+0NdTV6nP5Dwy4YGXzyXlb4inb1DrzreMGD0gyJi31T8/O3LmqYSiN9y0aVN5sxRL\nyt4Na7Z//+P5qDiLzlSnQdOIW+++t1fr/P8eFj84+MewaR/OaFPohg7c9t/s7jsn3cmF7Bs3\n7I1LKUWnazTGjRvXqhbkwD1blJ3jSrXNV5Ss/RtWbtlz8Pzl2FyNS+3Qhl169R96Zye9Qz/F\n9tyqpyeuS1u/doko+QAWTnv8FrsTTYH3rf5wmBDit29Xf7F17+nIqxa9qVZI4+59h9zXyzEX\nSNlfspNyFUvy3g1fFBhAmnW77e57e7bKvwfVefzaH6gdaNawQcdy6ry74q0Q4/VrB08uGv/S\nkRsfd93pqAfRC0MH/ZKWPXTJ6qFB/7qo6+jcsTMORjcYNP/tEY2EKoOznYPZeXu21GdA50Wr\ncJeWpKYUu7p3tla2btkYlzGitkkIoSiZqy6nKop19YmE6e3yrp3ceTbZI/QxWwsxenaYMXWg\nbbpiyY78ddeStUsuaRsveLCCbzVQrOkLnx2/J8Z/wOBh99fzTYuPObZ3/bznHstYuOy2unmP\nN98bHnp2eLgQQrFaYs8dW/rpkufiAxc9U9nr0F19b3vx2R62DYn5+8SmNasnHD29eNHU/I7r\n6tPrxed6VzLFmn113sSJB6Pd7xhw14Am9XSWlNO/HFj37gt7jgx/57n/lXrEOnDb7e87J93J\nBbV++oU5WblCCMWSMu2FuU0fmzoy1FMIodE4+AR5qUEO2bMlKem4UmfzFUvSsulPbj1juG1A\nvwFNw3Q5KRd+P7z+wzn7fhm5eNpA9b6goABnPX6L7ESdsZYQ4u+Ns6Z/9Mstg0cPGtPYxZr6\n1y/7P3t38pn0t6b3a1DJRPtLdlKuNfvKGxMnHYp2v2NAvwGN6+ksKaeO7//y7em7f/zXAOLs\nx29ZBmoHsmT+PXPB3qWTexWa7tgHkUan2f3Z6aHPFnh/npL94dE4Xdm+ycOB93lJB7NjUwqH\nlvYMqMKTQiHOTqwpxc6jzmAX7dbj+2JGDAoTQmTErEuwGEeEGTevOSHaRQghLNmXDyZn3zCm\nuW1+rd6v4DvsWrVpn7Xv59W7t4mKFrtTy6d9d8nntY/faOKe90UiET17u4wdvnzuttvezWsh\nRq8G10Nbtwk4d2jGoc+FqOzO1hpqX19sm/YR3ds8PHr6rC/Pvzkk/J8ZAiv/dsLdr047FF1r\nztLXmnvnfd2QuePNfSO2jp2y+OWtnWfcWcp3TDlw2+3vOyfdyQV5N25m++9esSQIITwbNm/Z\nxMeByy97kEP2bElKPq7U2Pxjy6ZvPesxY/GbbfxdbVM6dIno1Tn4wWmfLD1zy8NOOL9SKqc9\nfovfiR9/8WvdXi8+OSzvfECzVu2bGS9M+nSe6Lewkon2l+yk3F2vTj8cHTh76es35A8gnSL6\ndt/y8JQlM7/uNOuuvLdMOvvxW5aB2oFq3dwt5sDbq06bhzb51xHr2DGkds/Wsfs/zFbeNf5T\n5FIvr4wSQTd7xUWW4eaOHJxLHpGct2dLfQZU4UmhEGcn1pRr7DR637v83KK/+9326+Wth9wC\nB3Yb1ij5r5UWRQgh0qM3WhXl9nYlfudjbZNeo63ol8opOfO/vtBw2KT8wcK2TkMmjh3Yq8RP\nwdAIoTPWqWBiyYzeLZ/sWCvy6y8duMzcjJPv/RxnnjAlv9XZeDfrO6Vbnd8+e6+8C3TsttvZ\nd066k2sgZxxXJVEsCW9uu3jDI8/ntzobv1ZDZzw/tZNBvQ/FsMPZh1a6RclKiC44Jaz/uGmT\nRzl7yc7IzU0/ufDnuPYTpt7w7wHEp9mdU7rX+X3FOyV9doOD7+QKDdSV4dVw0MRutdfNeD3R\n4sSPp/CqPyLIemllgdd2Ty0/4N92jEuFrixSZ8x0XkqpI5X6TwoOT6wpZ+yEEF171F6/aYNF\n6afTiF17o4Pv7uLXqpUla+rm+Mx7/F2vfntC7xrWzbuYR6+Skxn5x/7FkSldHu9bseispL1X\nsy19b65daLp381sGNr/+a3bK3ydO6IUQwmqJOX9syf5rtz4zs2KJ9tW7PSj7h4PpVsWk1Qgh\nrDmxJ06cKDiD1uDftFGtsi8w7fJ6i6IMbV/MBwI1ua9dzp4tx9Ny2rrb+85jJ2170X2n2p1c\nHVR+z5ZLoePKeTKubUmxWPt3Kubbytt37uLUaDucdGgV3YlNmzfXCjHm7lbPrnpv9MQfenS5\nsU3r1s0bhxpdG3XoUPnAUpbsjNy0qPUWRbm/2AFkcLvc3VuOpmabPYzCyY/fMg7UjnXzEzPX\nDx//wrKj7z5idlaG1mVMO/8PPj354PQbhRBCyf7oWNzNC5qlTivTrR14n5d0MDs2pVSFRir1\nnxScnViDil3d28yWtWt3J2X1dIvZlpA1pnttval+N2+XPTui7hkafuyHWM/64/OfjjITdvTv\n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"
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
    "ggplot(players_data %>% count(official_position), aes(reorder(official_position, -n), n)) + geom_col(fill = 'green')+ labs (title = 'Number of NFL Players by Position', x = 'Official Position', y = 'Number of Players')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "84a8ca01",
   "metadata": {
    "_cell_guid": "a9a92f69-c070-479d-b7b6-f841180380d3",
    "_uuid": "9732d004-718e-4232-bf23-73d497be5012",
    "papermill": {
     "duration": 0.012158,
     "end_time": "2022-12-27T23:37:58.205600",
     "exception": false,
     "start_time": "2022-12-27T23:37:58.193442",
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
   "execution_count": 6,
   "id": "fc8b2e0c",
   "metadata": {
    "_cell_guid": "9a45890f-2139-4eac-8c0a-ee766f5181cb",
    "_uuid": "60246dbf-6e3a-4a3b-adcd-be5264da5d2d",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:37:58.232057Z",
     "iopub.status.busy": "2022-12-27T23:37:58.230422Z",
     "iopub.status.idle": "2022-12-27T23:38:13.040644Z",
     "shell.execute_reply": "2022-12-27T23:38:13.038647Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 14.826494,
     "end_time": "2022-12-27T23:38:13.043483",
     "exception": false,
     "start_time": "2022-12-27T23:37:58.216989",
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
   "execution_count": 7,
   "id": "c20e37a6",
   "metadata": {
    "_cell_guid": "2937d712-1a49-42c4-9591-4569e1b1d295",
    "_uuid": "a22726d1-a60e-4ff8-9d33-26fcabdd97fe",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:13.073220Z",
     "iopub.status.busy": "2022-12-27T23:38:13.071418Z",
     "iopub.status.idle": "2022-12-27T23:38:13.128765Z",
     "shell.execute_reply": "2022-12-27T23:38:13.126857Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.075057,
     "end_time": "2022-12-27T23:38:13.131485",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.056428",
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
   "id": "0081ef93",
   "metadata": {
    "_cell_guid": "7bc3d214-fcfe-421b-8b12-b7e9f107eaff",
    "_uuid": "fc863674-e344-4afb-b0dd-6d2f90256124",
    "papermill": {
     "duration": 0.012562,
     "end_time": "2022-12-27T23:38:13.156352",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.143790",
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
   "execution_count": 8,
   "id": "e01a82c9",
   "metadata": {
    "_cell_guid": "fa4a4c52-068c-44e8-9078-354581e39589",
    "_uuid": "347ae3e9-e3ed-48f7-ab74-113181a754ec",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:13.183380Z",
     "iopub.status.busy": "2022-12-27T23:38:13.181725Z",
     "iopub.status.idle": "2022-12-27T23:38:13.251823Z",
     "shell.execute_reply": "2022-12-27T23:38:13.249939Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.086377,
     "end_time": "2022-12-27T23:38:13.254377",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.168000",
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
   "id": "18fc9ab1",
   "metadata": {
    "_cell_guid": "4cb74d40-7a7a-49e5-9816-3334c95d2e34",
    "_uuid": "5563b3f8-183f-45b4-bbb5-4a5a48e29208",
    "papermill": {
     "duration": 0.011804,
     "end_time": "2022-12-27T23:38:13.277901",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.266097",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "To make the data in the BMI column clean and consistent, we round it off to two decimal places."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "34c284fb",
   "metadata": {
    "_cell_guid": "4afbee3b-97b6-40d0-8082-24ce0f918cba",
    "_uuid": "334a0076-e2b7-45ac-bb4e-fdbdd0a8504c",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:13.305082Z",
     "iopub.status.busy": "2022-12-27T23:38:13.303487Z",
     "iopub.status.idle": "2022-12-27T23:38:13.332165Z",
     "shell.execute_reply": "2022-12-27T23:38:13.330379Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.045203,
     "end_time": "2022-12-27T23:38:13.334722",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.289519",
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
   "id": "76373d91",
   "metadata": {
    "_cell_guid": "c5cd374b-2f72-4474-9f3c-1bddf6e0c5c5",
    "_uuid": "12a884a9-398a-426a-8bfb-9f919c0c0d5d",
    "papermill": {
     "duration": 0.012118,
     "end_time": "2022-12-27T23:38:13.358976",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.346858",
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
   "execution_count": 10,
   "id": "d81ee58a",
   "metadata": {
    "_cell_guid": "52ee2cf9-0e62-47aa-a3e0-23d8664ef26b",
    "_uuid": "904ebd83-bd68-4c81-81bb-589d928f3311",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:13.386291Z",
     "iopub.status.busy": "2022-12-27T23:38:13.384777Z",
     "iopub.status.idle": "2022-12-27T23:38:13.418045Z",
     "shell.execute_reply": "2022-12-27T23:38:13.416268Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.049511,
     "end_time": "2022-12-27T23:38:13.420508",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.370997",
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
   "execution_count": 11,
   "id": "52de8ec7",
   "metadata": {
    "_cell_guid": "938e1433-3be9-4cca-b2fd-ba1bc6a6928b",
    "_uuid": "1fe56bff-6d19-42d6-b95d-703da53b5a64",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:13.448279Z",
     "iopub.status.busy": "2022-12-27T23:38:13.446707Z",
     "iopub.status.idle": "2022-12-27T23:38:13.762916Z",
     "shell.execute_reply": "2022-12-27T23:38:13.761062Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.332676,
     "end_time": "2022-12-27T23:38:13.765371",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.432695",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nuZybSqWa/he/qqqq9f+dWu1KS0sTiURtbW1dXd0X7736FBUVpdPphoaG6urqXM51b8qZfN2b\nkslk08PP7k0dzb0pZwoKCgoLCzOZTGVl5SpeVCaT6dKly8p+mouwm/PE87WL3j927IHNW/78\nrcP/Wrb5TVeNCuGxl6vq+hUWNW1/taq+fOPy5t369Olz1FFHNZ9ctGjRMr9cchx2q/Krrbi4\nuOnOk/vfj013npqamtz/nkomk/X19Tm+yolEoqCgIJPJ5HhuQUFBU9jl/vdU001cW1ub+z8J\nTX+Kcnyoi4qK8ntvqq2tzfGfhM52b0qn001hl697U11dXe6vcjqdzn1D5+ve1Bx2+bo35f4X\nVyKRaAq71TI3z2E39MgfTDno06TINC6ccPp5O5190SF9ehZ37z2w8Or7npqz25h1Qgh1i6c/\nu6h23O79crAkAID45CLsivuuP6zvp/9ueo1d9/WHDOlXFkKYMG7EGb8+75G+Z47oXnP35VPK\nBo4ePyDHD8MBAEQi1988sYxhh154Ys2lN0+ZNK86MXTzXSdPOD6R3wUBAKy1ch12iVTFPffc\n0/L06KMmjD5q5WcAACA7+XmbMQAAq52wAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiEQ63wtYK/V6sHf7z9v2s8zde067xwEAnYdH7AAAIuERu7XJ\nqjxSWN6uc3mwEADWIh6xAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISPOyEr7f6klZIQ\nStp+Lh+zAgDt4BE7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBIpPO9AGhNrwd7t++MqRB6tf1c\nc/ee075xALAm8IgdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJNL5XkAbpFKpoqKiPC4gX9Pz\n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\nYdihF55Yc+nNUybNq04M3XzXyROOz+2LewEA4pGjN0+UDtzm9Au2WcEPEqnRR00YfVRuVgEA\nELPcfKUYAAAdTtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEIp3v\nBQBAh+j1YO/2nbEshLK2n2vu3nPaNw5WI2EHAKtTu4OyIIRebT+XoKQlYQcAMWh3UAZBGRGv\nsQMAiISwAwCIhLADAIiE19gBAO23Kq/t69auc3l5Xys8YgcAEAlhBwAQCWEHABAJYQcAEAlh\nBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEIl0vhcAANAevR7s\n3b4zFodQ3PZzzd17TvvG5ZJH7AAAIiHsAAAi4alYAIA2aPdTwMkQerX9XG16CtgjdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJFI53sBbZBOp5PJ\nfJZoSUlJp5qbx9GdbW4eR5sb/ejONjePo82NfvQaMjeTybSy89oUdslkMp3O54ILCws71dw8\nju5sc/M42tzoR3e2uXkcbW70o9eQuY2Nja3svDaFXW1tbU1NTcstvXK7gAULFnSquXkc3dnm\n5nG0udGP7mxz8zja3OhH531us6KiopXt7DV2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkUi3\n8rPx48dneSk33njj6lgMAADt11rY3XTTTVleirADAMi71sLu7bffztUyAABYVa2F3frrr5+z\ndQAAsIq8eQIAIBKtPWI3bdq0LC9l7Nixq2MxAAC0X2thN27cuCwvJZPJrI7FAADQfq2FXZOS\n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\neAAAAABJRU5ErkJggg=="
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
   "id": "49f0ef51",
   "metadata": {
    "_cell_guid": "bdf04537-c5fa-44a7-8cd7-193f01d1d74b",
    "_uuid": "c75dc770-6848-4da0-afc0-7c562432e28b",
    "papermill": {
     "duration": 0.012608,
     "end_time": "2022-12-27T23:38:13.791215",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.778607",
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
   "execution_count": 12,
   "id": "d015a622",
   "metadata": {
    "_cell_guid": "a4e9bfdf-42de-4303-a139-87affd294e9c",
    "_uuid": "a25be731-6f16-4b7b-890b-5aaa1d5b4800",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:13.819965Z",
     "iopub.status.busy": "2022-12-27T23:38:13.818296Z",
     "iopub.status.idle": "2022-12-27T23:38:13.863980Z",
     "shell.execute_reply": "2022-12-27T23:38:13.862133Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.062607,
     "end_time": "2022-12-27T23:38:13.866449",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.803842",
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
   "id": "08545d17",
   "metadata": {
    "_cell_guid": "d2fd14b7-acfd-43d9-9689-c9bfba7e2a3e",
    "_uuid": "e3547db1-f050-457d-9a96-ecce91e2dede",
    "papermill": {
     "duration": 0.013067,
     "end_time": "2022-12-27T23:38:13.892006",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.878939",
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
   "execution_count": 13,
   "id": "1ca7de16",
   "metadata": {
    "_cell_guid": "c9f79630-5ed4-4a20-bb62-365c6797cbb7",
    "_uuid": "78cf9334-4883-4978-aaf7-5951797c44c5",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:13.920492Z",
     "iopub.status.busy": "2022-12-27T23:38:13.918964Z",
     "iopub.status.idle": "2022-12-27T23:38:13.954248Z",
     "shell.execute_reply": "2022-12-27T23:38:13.952396Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.052278,
     "end_time": "2022-12-27T23:38:13.956811",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.904533",
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
   "execution_count": 14,
   "id": "43381404",
   "metadata": {
    "_cell_guid": "1bc437b3-d409-4c94-82c2-deaa70e3e5f4",
    "_uuid": "52c2d6ad-0b06-4904-ad6f-8243900d1d77",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:13.985156Z",
     "iopub.status.busy": "2022-12-27T23:38:13.983571Z",
     "iopub.status.idle": "2022-12-27T23:38:14.009726Z",
     "shell.execute_reply": "2022-12-27T23:38:14.007732Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.043883,
     "end_time": "2022-12-27T23:38:14.013157",
     "exception": false,
     "start_time": "2022-12-27T23:38:13.969274",
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
   "id": "b2af002c",
   "metadata": {
    "_cell_guid": "030b5826-3fee-4b62-8bf6-d7a679539f8f",
    "_uuid": "fb48b5e5-1fb6-4151-9bea-9223e1539f9f",
    "papermill": {
     "duration": 0.014139,
     "end_time": "2022-12-27T23:38:14.040119",
     "exception": false,
     "start_time": "2022-12-27T23:38:14.025980",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Let's take a look at pass result percentage from every game for every team by creating an aggregate table."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "5a27bb3e",
   "metadata": {
    "_cell_guid": "51b5518b-b3cc-4584-a5dd-e6c4ae93f53b",
    "_uuid": "0e92b75d-8db3-4cd5-8827-f7ae40e45921",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:14.069581Z",
     "iopub.status.busy": "2022-12-27T23:38:14.067967Z",
     "iopub.status.idle": "2022-12-27T23:38:14.147502Z",
     "shell.execute_reply": "2022-12-27T23:38:14.145602Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.09716,
     "end_time": "2022-12-27T23:38:14.150302",
     "exception": false,
     "start_time": "2022-12-27T23:38:14.053142",
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
   "id": "5cce11f7",
   "metadata": {
    "_cell_guid": "1346babe-3a11-43bc-ad5c-a0c7b7a3d2b4",
    "_uuid": "03ce4265-0763-44c6-9147-4c9561a1835c",
    "papermill": {
     "duration": 0.018223,
     "end_time": "2022-12-27T23:38:14.181661",
     "exception": false,
     "start_time": "2022-12-27T23:38:14.163438",
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
   "execution_count": 16,
   "id": "6547378c",
   "metadata": {
    "_cell_guid": "e6e4a4f4-5944-4e6c-ba79-d89be3b3ce54",
    "_uuid": "a05178e5-0706-419b-9081-40555d8ad0ec",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:14.212481Z",
     "iopub.status.busy": "2022-12-27T23:38:14.210739Z",
     "iopub.status.idle": "2022-12-27T23:38:14.229387Z",
     "shell.execute_reply": "2022-12-27T23:38:14.227362Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.036817,
     "end_time": "2022-12-27T23:38:14.232039",
     "exception": false,
     "start_time": "2022-12-27T23:38:14.195222",
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
   "id": "79814ba5",
   "metadata": {
    "_cell_guid": "a0c4298e-5a3e-46d8-b451-dd56277d0727",
    "_uuid": "84200471-2579-4838-87a4-457522647428",
    "papermill": {
     "duration": 0.01313,
     "end_time": "2022-12-27T23:38:14.258272",
     "exception": false,
     "start_time": "2022-12-27T23:38:14.245142",
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
   "execution_count": 17,
   "id": "1af3dbaa",
   "metadata": {
    "_cell_guid": "b2034ecb-cd38-4c17-b3ed-8c43c9c748a9",
    "_uuid": "9dd9d836-b2ac-40c9-a1e5-1a90e9479d8d",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:14.289101Z",
     "iopub.status.busy": "2022-12-27T23:38:14.287489Z",
     "iopub.status.idle": "2022-12-27T23:38:29.091807Z",
     "shell.execute_reply": "2022-12-27T23:38:29.089771Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 14.823796,
     "end_time": "2022-12-27T23:38:29.095476",
     "exception": false,
     "start_time": "2022-12-27T23:38:14.271680",
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
    "install.packages(\"gganimate\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "ec9196d7",
   "metadata": {
    "_cell_guid": "c5d228d8-81db-426e-a6f7-9c289924b7cd",
    "_uuid": "917ac585-33d3-4cb2-8c5b-f39efa8b5f68",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:38:29.125783Z",
     "iopub.status.busy": "2022-12-27T23:38:29.123998Z",
     "iopub.status.idle": "2022-12-27T23:39:45.731786Z",
     "shell.execute_reply": "2022-12-27T23:39:45.729700Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 76.625494,
     "end_time": "2022-12-27T23:39:45.734277",
     "exception": false,
     "start_time": "2022-12-27T23:38:29.108783",
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
    "install.packages(\"gifski\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "8a4061cc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T23:39:45.791039Z",
     "iopub.status.busy": "2022-12-27T23:39:45.789343Z",
     "iopub.status.idle": "2022-12-27T23:39:57.803459Z",
     "shell.execute_reply": "2022-12-27T23:39:57.801450Z"
    },
    "papermill": {
     "duration": 12.059228,
     "end_time": "2022-12-27T23:39:57.806666",
     "exception": false,
     "start_time": "2022-12-27T23:39:45.747438",
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
    "install.packages(\"animation\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "01cfa215",
   "metadata": {
    "_cell_guid": "045a15f6-4ef7-4030-8bc4-4113a2369cc7",
    "_uuid": "33a62255-e7ba-456d-b921-9cda3bf2b88b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:39:57.837370Z",
     "iopub.status.busy": "2022-12-27T23:39:57.835803Z",
     "iopub.status.idle": "2022-12-27T23:39:57.956555Z",
     "shell.execute_reply": "2022-12-27T23:39:57.954729Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.138236,
     "end_time": "2022-12-27T23:39:57.959051",
     "exception": false,
     "start_time": "2022-12-27T23:39:57.820815",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(\"gganimate\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "fdea489c",
   "metadata": {
    "_cell_guid": "7fa8ede0-40c2-4d02-856a-9d6e65381b2d",
    "_uuid": "c3e3453b-145d-4273-a67c-de7911f38217",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:39:57.989718Z",
     "iopub.status.busy": "2022-12-27T23:39:57.988146Z",
     "iopub.status.idle": "2022-12-27T23:39:58.014221Z",
     "shell.execute_reply": "2022-12-27T23:39:58.012351Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.045267,
     "end_time": "2022-12-27T23:39:58.017353",
     "exception": false,
     "start_time": "2022-12-27T23:39:57.972086",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(\"gifski\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "92d8d37c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-27T23:39:58.086751Z",
     "iopub.status.busy": "2022-12-27T23:39:58.085093Z",
     "iopub.status.idle": "2022-12-27T23:39:58.123368Z",
     "shell.execute_reply": "2022-12-27T23:39:58.121520Z"
    },
    "papermill": {
     "duration": 0.056551,
     "end_time": "2022-12-27T23:39:58.126623",
     "exception": false,
     "start_time": "2022-12-27T23:39:58.070072",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(\"animation\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "3e9cb2c7",
   "metadata": {
    "_cell_guid": "a59519f0-e144-4a7f-b522-76c31c89040f",
    "_uuid": "0575fe14-1ec6-476c-a20d-04da28d0e4d3",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:39:58.157302Z",
     "iopub.status.busy": "2022-12-27T23:39:58.155596Z",
     "iopub.status.idle": "2022-12-27T23:40:23.878484Z",
     "shell.execute_reply": "2022-12-27T23:40:23.875567Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 25.741925,
     "end_time": "2022-12-27T23:40:23.882039",
     "exception": false,
     "start_time": "2022-12-27T23:39:58.140114",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“Using size for a discrete variable is not advised.”\n"
     ]
    }
   ],
   "source": [
    "ggplot(completion_percentage, aes(freq, possession_team, size = pass_result, colour = pass_result)) +\n",
    "    geom_point(alpha = 0.7, show.legend = TRUE) +\n",
    "    # Animating the plot\n",
    "    labs(title = 'Week: {frame_time}', x = 'Pass Result Frequency', y = 'Team') +  \n",
    "    transition_time(week) +\n",
    "    ease_aes('linear')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5d2c54fd",
   "metadata": {
    "_cell_guid": "9517c7d8-b4f4-46ec-b648-d65f2ea19318",
    "_uuid": "56dbfed8-7ea9-43f9-9c3f-a1fcb42ff920",
    "papermill": {
     "duration": 0.015464,
     "end_time": "2022-12-27T23:40:23.920061",
     "exception": false,
     "start_time": "2022-12-27T23:40:23.904597",
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
   "execution_count": 24,
   "id": "5759b548",
   "metadata": {
    "_cell_guid": "162d95dd-8741-4402-beeb-ff520b55e780",
    "_uuid": "72426aa3-6f1d-4f5e-97f6-959e61457036",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:40:23.954947Z",
     "iopub.status.busy": "2022-12-27T23:40:23.952977Z",
     "iopub.status.idle": "2022-12-27T23:40:24.024313Z",
     "shell.execute_reply": "2022-12-27T23:40:24.021838Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.092881,
     "end_time": "2022-12-27T23:40:24.028179",
     "exception": false,
     "start_time": "2022-12-27T23:40:23.935298",
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
   "id": "0f089691",
   "metadata": {
    "_cell_guid": "1d65b0bd-3e55-4fcf-9473-44fe2a9afca3",
    "_uuid": "b52ba28f-1962-44a6-997b-dd9b5d093cd4",
    "papermill": {
     "duration": 0.01366,
     "end_time": "2022-12-27T23:40:24.055964",
     "exception": false,
     "start_time": "2022-12-27T23:40:24.042304",
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
   "execution_count": 25,
   "id": "0c5bce1f",
   "metadata": {
    "_cell_guid": "c4b31545-0223-48f7-a4b5-395d28ff6a28",
    "_uuid": "407cb158-e257-408b-9a15-2acac2526667",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:40:24.088098Z",
     "iopub.status.busy": "2022-12-27T23:40:24.086019Z",
     "iopub.status.idle": "2022-12-27T23:40:24.118310Z",
     "shell.execute_reply": "2022-12-27T23:40:24.116417Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.052074,
     "end_time": "2022-12-27T23:40:24.122156",
     "exception": false,
     "start_time": "2022-12-27T23:40:24.070082",
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
   "execution_count": 26,
   "id": "05ecdf73",
   "metadata": {
    "_cell_guid": "fd0e5492-8120-4c99-8441-737517f357f8",
    "_uuid": "c4a5b994-ca50-493e-869b-e2d06be9a275",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:40:24.164089Z",
     "iopub.status.busy": "2022-12-27T23:40:24.161942Z",
     "iopub.status.idle": "2022-12-27T23:40:24.195874Z",
     "shell.execute_reply": "2022-12-27T23:40:24.193798Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.058558,
     "end_time": "2022-12-27T23:40:24.198801",
     "exception": false,
     "start_time": "2022-12-27T23:40:24.140243",
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
   "id": "a9d7278a",
   "metadata": {
    "_cell_guid": "25780149-643a-44d0-a835-39403240f612",
    "_uuid": "b246c0cd-2487-4765-bb4e-5b96413709d9",
    "papermill": {
     "duration": 0.018812,
     "end_time": "2022-12-27T23:40:24.237578",
     "exception": false,
     "start_time": "2022-12-27T23:40:24.218766",
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
   "execution_count": 27,
   "id": "9b54e278",
   "metadata": {
    "_cell_guid": "8ac764de-3b98-40fb-b52b-f3870e9e8456",
    "_uuid": "bbe8c4a2-734e-4227-8e7e-9c70895bbb79",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:40:24.273032Z",
     "iopub.status.busy": "2022-12-27T23:40:24.271294Z",
     "iopub.status.idle": "2022-12-27T23:40:24.565339Z",
     "shell.execute_reply": "2022-12-27T23:40:24.563400Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.314763,
     "end_time": "2022-12-27T23:40:24.568098",
     "exception": false,
     "start_time": "2022-12-27T23:40:24.253335",
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
   "id": "cea6f159",
   "metadata": {
    "_cell_guid": "91a7a692-cfa1-4b00-8927-7024a622b157",
    "_uuid": "acb77f1b-3173-46ff-bac6-76aa04c67e9c",
    "papermill": {
     "duration": 0.016391,
     "end_time": "2022-12-27T23:40:24.600816",
     "exception": false,
     "start_time": "2022-12-27T23:40:24.584425",
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
   "execution_count": 28,
   "id": "52579bca",
   "metadata": {
    "_cell_guid": "e4e69c28-7bc8-4665-8a7d-71b7472247c2",
    "_uuid": "b91f4d70-6866-4fa3-9d9d-b906a79ed07a",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:40:24.635423Z",
     "iopub.status.busy": "2022-12-27T23:40:24.633483Z",
     "iopub.status.idle": "2022-12-27T23:40:24.658704Z",
     "shell.execute_reply": "2022-12-27T23:40:24.656296Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.045103,
     "end_time": "2022-12-27T23:40:24.661550",
     "exception": false,
     "start_time": "2022-12-27T23:40:24.616447",
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
   "cell_type": "code",
   "execution_count": 29,
   "id": "00951093",
   "metadata": {
    "_cell_guid": "990cedf8-79ee-4579-b333-23ddecb10092",
    "_uuid": "62fd7707-bd5f-4c56-aced-66bf62b9b4f2",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-27T23:40:24.726965Z",
     "iopub.status.busy": "2022-12-27T23:40:24.693882Z",
     "iopub.status.idle": "2022-12-27T23:40:38.479975Z",
     "shell.execute_reply": "2022-12-27T23:40:38.476300Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 13.80618,
     "end_time": "2022-12-27T23:40:38.483115",
     "exception": false,
     "start_time": "2022-12-27T23:40:24.676935",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "ggplot(pressures_tbl, aes(freq, pff_position_lined_up, colour = pff_position_lined_up)) +\n",
    "    geom_point(alpha = 0.7, show.legend = FALSE) +\n",
    "    # Animating the plot\n",
    "    labs(title = 'Game ID: {frame_time}', x = 'Percentage Pressures Allowed', y = 'Position Lined Up') +  \n",
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
   "duration": 234.84419,
   "end_time": "2022-12-27T23:40:38.723560",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-27T23:36:43.879370",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
