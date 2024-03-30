--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: poke_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poke_users (
    user_id integer NOT NULL,
    user_name character varying NOT NULL,
    user_totem_pokemon integer,
    user_password text NOT NULL,
    user_role integer
);


ALTER TABLE public.poke_users OWNER TO postgres;

--
-- Name: poke_users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poke_users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poke_users_user_id_seq OWNER TO postgres;

--
-- Name: poke_users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poke_users_user_id_seq OWNED BY public.poke_users.user_id;


--
-- Name: pokemon_abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemon_abilities (
    ability_id integer NOT NULL,
    ability_title character varying NOT NULL
);


ALTER TABLE public.pokemon_abilities OWNER TO postgres;

--
-- Name: pokemon_abilities_ability_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokemon_abilities_ability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_abilities_ability_id_seq OWNER TO postgres;

--
-- Name: pokemon_abilities_ability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokemon_abilities_ability_id_seq OWNED BY public.pokemon_abilities.ability_id;


--
-- Name: pokemon_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemon_types (
    type_id integer NOT NULL,
    type_title character varying NOT NULL
);


ALTER TABLE public.pokemon_types OWNER TO postgres;

--
-- Name: pokemon_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokemon_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_types_type_id_seq OWNER TO postgres;

--
-- Name: pokemon_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokemon_types_type_id_seq OWNED BY public.pokemon_types.type_id;


--
-- Name: pokemons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemons (
    pokemon_id integer NOT NULL,
    pokemon_title character varying NOT NULL,
    pokemon_photo text,
    pokemon_name character varying NOT NULL,
    pokemon_number integer,
    pokemon_type integer,
    pokemon_height double precision,
    pokemon_weight double precision,
    pokemon_xp_group integer,
    pokemon_abilities text,
    pokemon_breed_period integer,
    pokemon_sex_ratio character varying,
    pokemon_total_amount integer,
    pokemon_shine integer,
    pokemon_rarity double precision,
    pokemon_health integer,
    pokemon_attack integer,
    pokemon_defence integer,
    pokemon_speed integer,
    pokemon_special_attack integer,
    pokemon_special_defence integer,
    pokemon_summ integer
);


ALTER TABLE public.pokemons OWNER TO postgres;

--
-- Name: pokemons_pokemon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokemons_pokemon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemons_pokemon_id_seq OWNER TO postgres;

--
-- Name: pokemons_pokemon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokemons_pokemon_id_seq OWNED BY public.pokemons.pokemon_id;


--
-- Name: pokemons_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemons_ratings (
    rating_id integer NOT NULL,
    pokemon_id integer,
    user_id integer,
    rating integer NOT NULL
);


ALTER TABLE public.pokemons_ratings OWNER TO postgres;

--
-- Name: pokemons_ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokemons_ratings_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemons_ratings_rating_id_seq OWNER TO postgres;

--
-- Name: pokemons_ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokemons_ratings_rating_id_seq OWNED BY public.pokemons_ratings.rating_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role_title character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_role_id_seq OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- Name: user_activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_activities (
    activity_id integer NOT NULL,
    user_id integer,
    activity character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.user_activities OWNER TO postgres;

--
-- Name: user_activities_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_activities_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_activities_activity_id_seq OWNER TO postgres;

--
-- Name: user_activities_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_activities_activity_id_seq OWNED BY public.user_activities.activity_id;


--
-- Name: xp_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xp_groups (
    group_id integer NOT NULL,
    group_title character varying NOT NULL
);


ALTER TABLE public.xp_groups OWNER TO postgres;

--
-- Name: xp_groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xp_groups_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xp_groups_group_id_seq OWNER TO postgres;

--
-- Name: xp_groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xp_groups_group_id_seq OWNED BY public.xp_groups.group_id;


--
-- Name: poke_users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poke_users ALTER COLUMN user_id SET DEFAULT nextval('public.poke_users_user_id_seq'::regclass);


--
-- Name: pokemon_abilities ability_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon_abilities ALTER COLUMN ability_id SET DEFAULT nextval('public.pokemon_abilities_ability_id_seq'::regclass);


--
-- Name: pokemon_types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon_types ALTER COLUMN type_id SET DEFAULT nextval('public.pokemon_types_type_id_seq'::regclass);


--
-- Name: pokemons pokemon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons ALTER COLUMN pokemon_id SET DEFAULT nextval('public.pokemons_pokemon_id_seq'::regclass);


--
-- Name: pokemons_ratings rating_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons_ratings ALTER COLUMN rating_id SET DEFAULT nextval('public.pokemons_ratings_rating_id_seq'::regclass);


--
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- Name: user_activities activity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activities ALTER COLUMN activity_id SET DEFAULT nextval('public.user_activities_activity_id_seq'::regclass);


--
-- Name: xp_groups group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xp_groups ALTER COLUMN group_id SET DEFAULT nextval('public.xp_groups_group_id_seq'::regclass);


--
-- Data for Name: poke_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poke_users (user_id, user_name, user_totem_pokemon, user_password, user_role) FROM stdin;
2	Guest	1	0000	2
8	admin	255	$2b$12$IGq3rD/YTnJM.QFPDqBiQOWsr2qVNsdkuKMCC.eeLSZizZ.iNdLcy	1
12	pararam	478	$2b$12$FL1rHMWI0fCiFMDn3Ru06.325iEjkDw3qxJdp/kTOYpMALqfWlyIS	2
\.


--
-- Data for Name: pokemon_abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemon_abilities (ability_id, ability_title) FROM stdin;
\.


--
-- Data for Name: pokemon_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemon_types (type_id, type_title) FROM stdin;
1	Травяной Ядовитый
2	Огненный Летающий
3	Огненный Драконий
4	Водный
5	Насекомый Летающий
6	Насекомый Ядовитый
7	Нормальный Летающий
8	Тёмный Нормальный
9	Электрический
10	Электрический Психический
11	Ледяной Стальной
12	Ледяной
13	Ледяной Волшебный
14	Земляной Стальной
15	Тёмный
16	Стальной
17	Нормальный
18	Огненный Каменный
19	Психический
20	Боевой
21	Каменный Электрический
22	Психический Волшебный
23	Ядовитый Психический
24	Водный Психический
25	Ядовитый Тёмный
26	Призрачный Ядовитый
27	Электрический Травяной
28	Травяной Драконий
29	Огненный Призрачный
30	Ядовитый Волшебный
31	Ледяной Психический
32	Боевой Огненный
33	Боевой Водный
34	Водный Тёмный
35	Водный Ледяной
36	Каменный Летающий
37	Психический Летающий
38	Боевой Летающий
39	Тёмный Летающий
40	Психический Боевой
41	Электрический Драконий
42	Ядовитый Земляной
43	Стальной Земляной
44	Тёмный Ядовитый
45	Насекомый Стальной
46	Насекомый Боевой
47	Боевой Ядовитый
48	Призрачный
49	Тёмный Огненный
50	Каменный Тёмный
51	Огненный Боевой
52	Водный Земляной
53	Тёмный Призрачный
54	Стальной Волшебный
55	Боевой Психический
56	Огненный Земляной
57	Драконий Волшебный
58	Огненный
59	Драконий Летающий
60	Стальной Психический
61	Драконий Психический
62	Земляной Огненный
63	Насекомый Земляной
64	Травяной
65	Нормальный Боевой
66	Драконий Земляной
67	Боевой Стальной
68	Травяной Ледяной
69	Электрический Летающий
70	Электрический Ледяной
71	Электрический Огненный
72	Электрический Водный
73	Стальной Драконий
74	Водный Драконий
75	Призрачный Драконий
76	Травяной Летающий
77	Нормальный Волшебный
78	Травяной Боевой
79	Ледяной Огненный
80	Огненный Психический
81	Земляной Призрачный
82	Нормальный Призрачный
83	Летающий
84	Земляной Летающий
85	Драконий Ледяной
86	Водный Боевой
87	Стальной Призрачный
88	Призрачный Травяной
89	Ледяной Каменный
90	Каменный Волшебный
91	Психический Тёмный
92	Призрачный Летающий
93	Каменный
94	Призрачный Волшебный
95	Психический Драконий
96	Летающий Стальной
97	Насекомый Психический
98	Водный Каменный
99	Каменный Огненный
100	Земляной
101	Летающий Водный
102	Электрический Ядовитый
103	Огненный Насекомый
104	Тёмный Волшебный
105	Волшебный
106	Психический Нормальный
107	Электрический Тёмный
108	Волшебный Стальной
109	Ядовитый Драконий
110	Боевой Тёмный
111	Тёмный Травяной
112	Психический Ледяной
113	Психический Призрачный
114	Земляной Нормальный
115	Водный Призрачный
116	Волшебный Летающий
117	Травяной Каменный
118	Травяной Огненный
119	Травяной Водный
120	Насекомый
121	Ядовитый
122	Ядовитый Летающий
123	Насекомый Травяной
124	Водный Ядовитый
125	Каменный Земляной
126	Электрический Стальной
127	Травяной Психический
128	Земляной Каменный
129	Водный Летающий
130	Каменный Водный
131	Ледяной Летающий
132	Драконий
133	Водный Электрический
134	Водный Волшебный
135	Нормальный Психический
136	Насекомый Каменный
137	Тёмный Ледяной
138	Ледяной Земляной
139	Стальной Летающий
140	Психический Травяной
141	Водный Травяной
142	Травяной Тёмный
143	Насекомый Водный
144	Насекомый Призрачный
145	Стальной Каменный
146	Земляной Драконий
147	Каменный Психический
148	Земляной Психический
149	Каменный Травяной
150	Каменный Насекомый
151	Ледяной Водный
152	Травяной Земляной
153	Водный Стальной
154	Нормальный Водный
155	Каменный Стальной
156	Призрачный Тёмный
157	Ядовитый Насекомый
158	Ядовитый Боевой
159	Ледяной Призрачный
160	Электрический Призрачный
161	Огненный Стальной
162	Психический Огненный
163	Травяной Волшебный
164	Земляной Тёмный
165	Тёмный Боевой
166	Нормальный Травяной
167	Насекомый Электрический
168	Травяной Стальной
169	Призрачный Огненный
170	Земляной Электрический
171	Тёмный Стальной
172	Тёмный Драконий
173	Насекомый Огненный
174	Стальной Боевой
175	Каменный Боевой
176	Драконий Огненный
177	Драконий Электрический
178	Нормальный Земляной
179	Огненный Нормальный
180	Тёмный Психический
181	Ядовитый Водный
182	Электрический Нормальный
183	Каменный Драконий
184	Каменный Ледяной
185	Электрический Волшебный
186	Летающий Драконий
187	Огненный Водный
188	Травяной Призрачный
189	Огненный Тёмный
190	Боевой Ледяной
191	Насекомый Волшебный
192	Водный Насекомый
193	Ядовитый Огненный
194	Призрачный Земляной
195	Нормальный Драконий
196	Драконий Боевой
197	Психический Стальной
198	Каменный Ядовитый
199	Боевой Призрачный
200	Ледяной Насекомый
201	Драконий Призрачный
202	Насекомый Тёмный
203	Электрический Боевой
204	Травяной Нормальный
205	Ядовитый Нормальный
206	Земляной Травяной
207	Летающий Тёмный
208	Стальной Ядовитый
209	Драконий Нормальный
210	Летающий Боевой
211	Драконий Водный
212	Земляной Боевой
213	Волшебный Психический
214	Электрический Земляной
215	Боевой Электрический
216	Огненный Ядовитый
217	Призрачный Стальной
218	Тёмный Земляной
219	Драконий Тёмный
220	Волшебный Боевой
221	Боевой Драконий
222	Ядовитый Призрачный
\.


--
-- Data for Name: pokemons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemons (pokemon_id, pokemon_title, pokemon_photo, pokemon_name, pokemon_number, pokemon_type, pokemon_height, pokemon_weight, pokemon_xp_group, pokemon_abilities, pokemon_breed_period, pokemon_sex_ratio, pokemon_total_amount, pokemon_shine, pokemon_rarity, pokemon_health, pokemon_attack, pokemon_defence, pokemon_speed, pokemon_special_attack, pokemon_special_defence, pokemon_summ) FROM stdin;
1	Venusaur-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/venusaurgmax.png	venusaurgmax	3	1	2	0	1	Сверхрост   Хлорофилл	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	80	82	83	80	100	100	525
2	Венузавр	https://www.orthrusonline.ru/static/images/p/nextgen/venusaurmega.png	venusaurmega	\N	1	2.4	155.5	1	Толстая кожа	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	80	100	123	80	122	120	625
3	Charizard-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/charizardgmax.png	charizardgmax	\N	2	28	0	1	Яростное пламя   Солнечная сила	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	78	84	78	100	109	85	534
4	Чаризард	https://www.orthrusonline.ru/static/images/p/nextgen/charizardmegax.png	charizardmegax	\N	3	1.7	110.5	1	Крепкие когти	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	78	130	111	100	130	85	634
5	Чаризард	https://www.orthrusonline.ru/static/images/p/nextgen/charizardmegay.png	charizardmegay	\N	2	1.7	100.5	1	Осушение	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	78	104	78	100	159	115	634
6	Blastoise-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/blastoisegmax.png	blastoisegmax	\N	4	1.6	0	1	Всплеск   Омывка дождем	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	79	83	100	78	85	105	530
7	Бластойз	https://www.orthrusonline.ru/static/images/p/nextgen/blastoisemega.png	blastoisemega	\N	4	1.6	101.1	1	Мега-пушка	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	79	103	120	78	135	115	630
8	Butterfree-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/butterfreegmax.png	butterfreegmax	\N	5	17	0	2	Фасеточность   Тонированные линзы	10	Бесполые	0	0	100	60	45	50	70	90	80	395
9	Бидрилл	https://www.orthrusonline.ru/static/images/p/nextgen/beedrillmega.png	beedrillmega	\N	6	1.4	40.5	2	Адаптация	10	Самцы: 50% Самки: 50% 	0	0	100	65	150	40	145	15	80	495
10	Пиджеот	https://www.orthrusonline.ru/static/images/p/nextgen/pidgeotmega.png	pidgeotmega	\N	7	2.2	50.5	1	Боец-одиночка	10	Самцы: 50% Самки: 50% 	0	0	100	83	80	80	121	135	80	579
11	Раттата	https://www.orthrusonline.ru/static/images/p/nextgen/rattataalola.png	rattataalola	\N	8	0.3	3.8	2	Прожорливость   Энергичность   Толстая кожа	10	Самцы: 50% Самки: 50% 	5797	537	88	30	56	35	72	25	35	253
12	Ратикейт	https://www.orthrusonline.ru/static/images/p/nextgen/raticatealola.png	raticatealola	\N	8	0.7	25.5	2	Прожорливость   Энергичность   Толстая кожа	10	Самцы: 50% Самки: 50% 	4142	763	91.5	75	71	70	77	40	80	413
13	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachualola.png	pikachualola	\N	9	0.4	6	2	Статическое электричество   Громоотвод	7	Только самцы	10	0	99.9	35	55	40	90	50	50	320
14	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachubelle.png	pikachubelle	\N	9	0.4	6	2	Громоотвод	7	Только самки	63	0	99.5	35	55	40	90	50	50	320
15	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachucosplay.png	pikachucosplay	\N	9	0.4	6	2	Громоотвод	7	Только самки	78	0	99.4	35	55	40	90	50	50	320
16	Pikachu-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/pikachugmax.png	pikachugmax	\N	9	21	0	2	Статическое электричество   Громоотвод	7	Самцы: 50% Самки: 50% 	0	0	100	35	55	40	90	50	50	320
17	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachuhoenn.png	pikachuhoenn	\N	9	0.4	6	2	Статическое электричество   Громоотвод	7	Только самцы	28	0	99.8	35	55	40	90	50	50	320
18	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachukalos.png	pikachukalos	\N	9	0.4	6	2	Статическое электричество   Громоотвод	7	Только самцы	11	0	99.9	35	55	40	90	50	50	320
19	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachulibre.png	pikachulibre	\N	9	0.4	6	2	Громоотвод	7	Только самки	42	0	99.7	35	55	40	90	50	50	320
20	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachuoriginal.png	pikachuoriginal	\N	9	0.4	6	2	Статическое электричество   Громоотвод	7	Только самцы	36	1	99.7	35	55	40	90	50	50	320
21	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachupartner.png	pikachupartner	\N	9	0.4	6	2	Статическое электричество   Громоотвод	7	Только самцы	9	0	99.9	35	55	40	90	50	50	320
22	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachuphd.png	pikachuphd	\N	9	0.4	6	2	Громоотвод	7	Только самки	52	0	99.6	35	55	40	90	50	50	320
23	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachupopstar.png	pikachupopstar	\N	9	0.4	6	2	Громоотвод	7	Только самки	56	0	99.5	35	55	40	90	50	50	320
24	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachurockstar.png	pikachurockstar	\N	9	0.4	6	2	Громоотвод	7	Только самки	70	0	99.4	35	55	40	90	50	50	320
25	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachusinnoh.png	pikachusinnoh	\N	9	0.4	6	2	Статическое электричество   Громоотвод	7	Только самцы	21	0	99.8	35	55	40	90	50	50	320
26	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachustarter.png	pikachustarter	\N	9	0.4	6	2	Статическое электричество   Громоотвод	7	Самцы: 50% Самки: 50% 	7	0	99.9	45	80	50	120	75	60	430
27	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachuunova.png	pikachuunova	\N	9	0.4	6	2	Статическое электричество   Громоотвод	7	Только самцы	13	0	99.9	35	55	40	90	50	50	320
28	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachuworld.png	pikachuworld	\N	9	0.4	6	2	Статическое электричество   Громоотвод	7	Только самцы	10	0	99.9	45	80	50	120	75	60	430
29	Райчу	https://www.orthrusonline.ru/static/images/p/nextgen/raichualola.png	raichualola	\N	10	0.7	21	2	Сёрфер	7	Самцы: 50% Самки: 50% 	221	11	98.3	60	85	50	110	95	85	485
30	Сэндшрю	https://www.orthrusonline.ru/static/images/p/nextgen/sandshrewalola.png	sandshrewalola	\N	11	0.7	40	2	Снежные покровы   Грязевой натиск	14	Самцы: 50% Самки: 50% 	5368	295	93.8	50	75	90	40	10	35	300
31	Сэндслэш	https://www.orthrusonline.ru/static/images/p/nextgen/sandslashalola.png	sandslashalola	\N	11	1.2	55	2	Снежные покровы   Грязевой натиск	14	Самцы: 50% Самки: 50% 	1481	20	95.6	75	100	120	65	25	65	450
32	Вульпикс	https://www.orthrusonline.ru/static/images/p/nextgen/vulpixalola.png	vulpixalola	\N	12	0.6	9.9	2	Снежные покровы   Снежная тревога	14	Самцы: 25% Самки: 75% 	20072	53	87.3	38	41	40	65	50	65	299
33	Найнтэйлс	https://www.orthrusonline.ru/static/images/p/nextgen/ninetalesalola.png	ninetalesalola	\N	13	1.1	19.9	2	Снежные покровы   Снежная тревога	14	Самцы: 25% Самки: 75% 	186	17	98.6	73	67	75	109	81	100	505
34	Диглетт	https://www.orthrusonline.ru/static/images/p/nextgen/diglettalola.png	diglettalola	\N	14	0.2	1	2	Песчаный покров   Спутанные волосы   Сила песка	14	Самцы: 50% Самки: 50% 	4084	193	92.6	10	55	30	90	35	45	265
35	Дагтрио	https://www.orthrusonline.ru/static/images/p/nextgen/dugtrioalola.png	dugtrioalola	\N	14	0.7	66.6	2	Песчаный покров   Спутанные волосы   Сила песка	14	Самцы: 50% Самки: 50% 	2394	229	93.2	35	100	60	110	50	70	425
36	Мяут	https://www.orthrusonline.ru/static/images/p/nextgen/meowthalola.png	meowthalola	\N	15	0.4	4.2	2	Сбор предметов   Техничность   Нервозность	14	Самцы: 50% Самки: 50% 	5473	51	88.6	40	35	35	90	50	40	290
37	Мяут	https://www.orthrusonline.ru/static/images/p/nextgen/meowthgalar.png	meowthgalar	\N	16	0.4	7.5	2	Сбор предметов   Крепкие когти   Нервирование	14	Самцы: 50% Самки: 50% 	785	6	97.7	50	65	55	40	40	40	290
38	Meowth-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/meowthgmax.png	meowthgmax	\N	17	33	0	2	Сбор предметов   Техничность   Нервирование	14	Самцы: 50% Самки: 50% 	0	0	100	40	45	35	90	40	40	290
39	Персиан	https://www.orthrusonline.ru/static/images/p/nextgen/persianalola.png	persianalola	\N	15	1.1	33	2	Меховой плащ   Техничность   Нервозность	14	Самцы: 50% Самки: 50% 	21452	197	92.3	65	60	60	115	75	65	440
40	Гроули	https://www.orthrusonline.ru/static/images/p/nextgen/growlithehisui.png	growlithehisui	\N	18	0.8	22.7	3	Запугивание   Вспышка пламени   Каменная голова	14	Самцы: 75% Самки: 25% 	23	23	99.9	60	75	45	55	65	50	350
41	Арканайн	https://www.orthrusonline.ru/static/images/p/nextgen/arcaninehisui.png	arcaninehisui	\N	18	2	168	3	Запугивание   Вспышка пламени   Каменная голова	14	Самцы: 75% Самки: 25% 	20	12	99.8	95	115	80	90	95	80	555
42	Алаказам	https://www.orthrusonline.ru/static/images/p/nextgen/alakazammega.png	alakazammega	\N	19	1.2	48	1	Слежка	14	Самцы: 75% Самки: 25% 	0	0	100	55	50	65	150	175	105	600
43	Machamp-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/machampgmax.png	machampgmax	\N	20	25	0	1	Сила воли   Боец-одиночка   Неукротимость	14	Самцы: 75% Самки: 25% 	0	0	100	90	130	80	55	65	85	505
44	Джеодуд	https://www.orthrusonline.ru/static/images/p/nextgen/geodudealola.png	geodudealola	\N	21	0.4	20.3	1	Магнитное притяжение   Стойкость   Гальванизация	10	Самцы: 50% Самки: 50% 	7988	64	91.6	40	80	100	20	30	30	300
45	Гравелер	https://www.orthrusonline.ru/static/images/p/nextgen/graveleralola.png	graveleralola	\N	21	1	110	1	Магнитное притяжение   Стойкость   Гальванизация	10	Самцы: 50% Самки: 50% 	2878	31	95.4	55	95	115	35	45	45	390
46	Голем	https://www.orthrusonline.ru/static/images/p/nextgen/golemalola.png	golemalola	\N	21	1.7	316	1	Магнитное притяжение   Стойкость   Гальванизация	10	Самцы: 50% Самки: 50% 	228	14	98.5	80	120	130	45	55	65	495
47	Понита	https://www.orthrusonline.ru/static/images/p/nextgen/ponytagalar.png	ponytagalar	\N	19	0.8	24	2	Бегство   Пастельная вуаль   Предвидение	14	Самцы: 50% Самки: 50% 	2839	8	97.1	50	85	55	90	65	65	410
48	Рапидаш	https://www.orthrusonline.ru/static/images/p/nextgen/rapidashgalar.png	rapidashgalar	\N	22	1.7	80	2	Бегство   Пастельная вуаль   Предвидение	14	Самцы: 50% Самки: 50% 	67	4	99.5	65	100	70	105	80	80	500
49	Слоупок	https://www.orthrusonline.ru/static/images/p/nextgen/slowpokegalar.png	slowpokegalar	\N	19	1.2	36	2	Прожорливость   Собственный темп   Регенерация	14	Самцы: 50% Самки: 50% 	131	2	99.6	90	65	65	15	40	40	315
132	Ротом	https://www.orthrusonline.ru/static/images/p/nextgen/rotommow.png	rotommow	\N	27	0.3	0.3	2	Левитация	14	Бесполые	787	3	99	50	65	107	86	105	107	520
50	Слоубро	https://www.orthrusonline.ru/static/images/p/nextgen/slowbrogalar.png	slowbrogalar	\N	23	1.6	70.5	2	Набросок   Собственный темп   Регенерация	14	Самцы: 50% Самки: 50% 	36	1	99.7	95	100	95	30	100	70	490
51	Слоубро	https://www.orthrusonline.ru/static/images/p/nextgen/slowbromega.png	slowbromega	\N	24	2	120	2	Панцирь-броня	14	Самцы: 50% Самки: 50% 	0	0	100	95	75	180	30	130	80	590
52	Фарфечд	https://www.orthrusonline.ru/static/images/p/nextgen/farfetchdgalar.png	farfetchdgalar	\N	20	0.8	15	2	Неукротимость   Дерзость	14	Самцы: 50% Самки: 50% 	1970	3	98	52	95	55	55	58	62	377
53	Граймер	https://www.orthrusonline.ru/static/images/p/nextgen/grimeralola.png	grimeralola	\N	25	0.7	42	2	Ядовитое касание   Прожорливость   Мощь Алхимии	14	Самцы: 50% Самки: 50% 	3667	18	95.8	80	80	50	25	40	50	325
54	Мак	https://www.orthrusonline.ru/static/images/p/nextgen/mukalola.png	mukalola	\N	25	1	52	2	Ядовитое касание   Прожорливость   Мощь Алхимии	14	Самцы: 50% Самки: 50% 	96	6	99.3	105	105	75	50	65	100	500
55	Gengar-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/gengargmax.png	gengargmax	\N	26	20	0	1	Проклятое тело	14	Бесполые	0	0	100	60	65	60	110	130	75	500
56	Генгар	https://www.orthrusonline.ru/static/images/p/nextgen/gengarmega.png	gengarmega	\N	26	1.4	40.5	1	Тёмная метка	14	Самцы: 50% Самки: 50% 	1	1	100	60	65	80	130	170	95	600
57	Kingler-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/kinglergmax.png	kinglergmax	\N	4	19	0	2	Суперсильные когти   Панцирь-броня   Грубая сила	14	Бесполые	0	0	100	55	130	115	75	50	50	475
58	Волторб	https://www.orthrusonline.ru/static/images/p/nextgen/voltorbhisui.png	voltorbhisui	\N	27	0.5	13	2	Звуконепроницаемость   Статическое электричество   Детонация	14	Бесполые	581	2	99.5	40	30	50	100	55	55	330
59	Электрод	https://www.orthrusonline.ru/static/images/p/nextgen/electrodehisui.png	electrodehisui	\N	27	1.2	71	2	Звуконепроницаемость   Статическое электричество   Детонация	14	Бесполые	18	3	99.9	60	50	70	150	80	80	490
60	Экзегутор	https://www.orthrusonline.ru/static/images/p/nextgen/exeggutoralola.png	exeggutoralola	\N	28	10.9	415.6	3	Обыскивание   Восстановление урожая	14	Самцы: 50% Самки: 50% 	2718	24	93.5	95	105	85	45	125	75	530
61	Маровак	https://www.orthrusonline.ru/static/images/p/nextgen/marowakalola.png	marowakalola	\N	29	1	34	2	Проклятое тело   Громоотвод   Каменная голова	14	Самцы: 50% Самки: 50% 	225	23	98.7	60	80	110	45	50	80	425
62	Виззинг	https://www.orthrusonline.ru/static/images/p/nextgen/weezinggalar.png	weezinggalar	\N	30	3	16	2	Левитация   Нейтрализующий газ   Туманная волна	14	Самцы: 50% Самки: 50% 	1329	10	97.9	65	90	120	60	85	70	490
63	Кангасхан	https://www.orthrusonline.ru/static/images/p/nextgen/kangaskhanmega.png	kangaskhanmega	\N	17	2.2	100	2	Родительские узы	14	Самцы: 12.5% Самки: 87.5% 	0	0	100	105	125	100	100	60	100	590
64	Mr	https://www.orthrusonline.ru/static/images/p/nextgen/mrmimegalar.png	mrmimegalar	\N	31	1.4	56.8	2	Подъём духа   Очистка поля   Ледяное тело	17	Самцы: 50% Самки: 50% 	595	6	98.7	50	65	65	100	90	90	460
65	Пинсир	https://www.orthrusonline.ru/static/images/p/nextgen/pinsirmega.png	pinsirmega	\N	5	1.7	59	3	Поднятие в воздух	17	Самцы: 50% Самки: 50% 	0	0	100	65	155	120	105	65	90	600
66	Торос	https://www.orthrusonline.ru/static/images/p/nextgen/taurospaldea.png	taurospaldea	\N	20	1.4	88.4	3	Запугивание   Прилив гнева   Жеватель	14	Только самцы	15	1	99.9	75	110	105	100	30	70	490
67	Торос	https://www.orthrusonline.ru/static/images/p/nextgen/taurospaldeafire.png	taurospaldeafire	\N	32	1.4	88.4	3	Запугивание   Прилив гнева   Жеватель	14	Только самцы	14	3	99.9	75	110	105	100	30	70	490
68	Торос	https://www.orthrusonline.ru/static/images/p/nextgen/taurospaldeawater.png	taurospaldeawater	\N	33	1.4	88.4	3	Запугивание   Прилив гнева   Жеватель	14	Только самцы	30	2	99.8	75	110	105	100	30	70	490
69	Гаярдос	https://www.orthrusonline.ru/static/images/p/nextgen/gyaradosmega.png	gyaradosmega	\N	34	6.5	305	3	Разрыв шаблона	4	Самцы: 50% Самки: 50% 	0	0	100	95	155	109	81	70	130	640
70	Lapras-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/laprasgmax.png	laprasgmax	\N	35	24	0	3	Поглощение воды   Панцирь-броня   Гидрирование	27	Бесполые	0	0	100	130	85	80	60	85	95	535
71	Eevee-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/eeveegmax.png	eeveegmax	\N	17	18	0	2	Бегство   Адаптация   Предвидение	24	Самцы: 87.5% Самки: 12.5% 	1	1	100	55	55	50	55	45	65	325
72	Аэродактиль	https://www.orthrusonline.ru/static/images/p/nextgen/aerodactylmega.png	aerodactylmega	\N	36	2.1	79	3	Крепкие когти	24	Самцы: 87.5% Самки: 12.5% 	0	0	100	80	135	85	150	70	95	615
73	Snorlax-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/snorlaxgmax.png	snorlaxgmax	\N	17	35	0	3	Иммунитет   Толстая кожа   Прожорливость	27	Самцы: 87.5% Самки: 12.5% 	0	0	100	160	110	65	30	65	110	540
74	Артикуно	https://www.orthrusonline.ru/static/images/p/nextgen/articunogalar.png	articunogalar	\N	37	1.7	50.9	3	Состязательность	54	Бесполые	81	4	99.5	90	85	85	95	125	100	580
75	Запдос	https://www.orthrusonline.ru/static/images/p/nextgen/zapdosgalar.png	zapdosgalar	\N	38	1.6	58.2	3	Непокорность	54	Бесполые	76	3	99.5	90	125	90	100	85	90	580
76	Молтрес	https://www.orthrusonline.ru/static/images/p/nextgen/moltresgalar.png	moltresgalar	\N	39	2	66	3	Неистовство	54	Бесполые	71	4	99.6	90	85	90	90	100	125	580
77	Мьюту	https://www.orthrusonline.ru/static/images/p/nextgen/mewtwomegax.png	mewtwomegax	\N	40	2.3	127	3	Неукротимость	80	Бесполые	0	0	100	106	190	100	130	154	100	780
78	Мьюту	https://www.orthrusonline.ru/static/images/p/nextgen/mewtwomegay.png	mewtwomegay	\N	19	1.5	33	3	Бессонница	80	Бесполые	0	0	100	106	150	70	140	194	120	780
79	Тайфложн	https://www.orthrusonline.ru/static/images/p/nextgen/typhlosionhisui.png	typhlosionhisui	\N	29	1.6	69.8	1	Яростное пламя   Обыскивание	14	Самцы: 87.5% Самки: 12.5% 	39	29	99.7	73	84	78	95	119	85	534
80	Амфарос	https://www.orthrusonline.ru/static/images/p/nextgen/ampharosmega.png	ampharosmega	\N	41	1.4	61.5	1	Разрыв шаблона	14	Самцы: 50% Самки: 50% 	0	0	100	90	95	105	45	165	110	610
81	Вупер	https://www.orthrusonline.ru/static/images/p/nextgen/wooperpaldea.png	wooperpaldea	\N	42	0.4	8.5	2	Ядовитые колючки   Поглощение воды   Безразличие	14	Самцы: 50% Самки: 50% 	861	448	98.9	55	45	45	15	25	25	210
82	Слоукинг	https://www.orthrusonline.ru/static/images/p/nextgen/slowkinggalar.png	slowkinggalar	\N	23	1.8	79.5	2	Любопытная медицина   Собственный темп   Регенерация	14	Самцы: 50% Самки: 50% 	36	2	99.7	95	65	80	30	110	110	490
83	Стиликс	https://www.orthrusonline.ru/static/images/p/nextgen/steelixmega.png	steelixmega	\N	43	10.5	740	2	Сила песка	17	Самцы: 50% Самки: 50% 	0	0	100	75	125	230	30	55	95	610
84	Квилфиш	https://www.orthrusonline.ru/static/images/p/nextgen/qwilfishhisui.png	qwilfishhisui	\N	44	0.5	3.9	2	Ядовитые колючки   Быстрое плаванье   Запугивание	14	Самцы: 50% Самки: 50% 	11	1	99.9	65	95	85	85	55	55	440
85	Сизор	https://www.orthrusonline.ru/static/images/p/nextgen/scizormega.png	scizormega	\N	45	2	125	2	Техничность	17	Самцы: 50% Самки: 50% 	0	0	100	70	150	140	75	65	100	600
86	Геракросс	https://www.orthrusonline.ru/static/images/p/nextgen/heracrossmega.png	heracrossmega	\N	46	1.7	62.5	3	Развитие навыка	17	Самцы: 50% Самки: 50% 	0	0	100	80	185	115	75	40	105	600
87	Снизл	https://www.orthrusonline.ru/static/images/p/nextgen/sneaselhisui.png	sneaselhisui	\N	47	0.9	27	1	Концентрация   Острый глаз   Карманный вор	14	Самцы: 50% Самки: 50% 	10	0	99.9	55	95	55	115	35	75	430
88	Корсола	https://www.orthrusonline.ru/static/images/p/nextgen/corsolagalar.png	corsolagalar	\N	48	0.6	0.5	4	Слабая броня   Проклятое тело	14	Самцы: 25% Самки: 75% 	200	7	99	60	55	100	30	65	100	410
89	Хондум	https://www.orthrusonline.ru/static/images/p/nextgen/houndoommega.png	houndoommega	\N	49	1.9	49.5	3	Солнечная сила	14	Самцы: 50% Самки: 50% 	0	0	100	75	90	90	115	140	90	600
90	Тиранитар	https://www.orthrusonline.ru/static/images/p/nextgen/tyranitarmega.png	tyranitarmega	\N	50	2.5	255	3	Пробуждение песков	27	Самцы: 50% Самки: 50% 	0	0	100	100	164	150	71	95	120	700
91	Скептайл	https://www.orthrusonline.ru/static/images/p/nextgen/sceptilemega.png	sceptilemega	\N	28	1.9	55.2	1	Громоотвод	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	70	110	75	145	145	85	630
92	Блазикен	https://www.orthrusonline.ru/static/images/p/nextgen/blazikenmega.png	blazikenmega	\N	51	1.9	52	1	Ускорение	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	80	160	80	100	130	80	630
93	Свамперт	https://www.orthrusonline.ru/static/images/p/nextgen/swampertmega.png	swampertmega	\N	52	1.9	102	1	Быстрое плаванье	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	100	150	110	70	95	110	635
94	Зигзагун	https://www.orthrusonline.ru/static/images/p/nextgen/zigzagoongalar.png	zigzagoongalar	\N	8	0.4	17.5	2	Сбор предметов   Прожорливость   Быстрые ноги	10	Самцы: 50% Самки: 50% 	2951	17	98	38	30	41	60	30	41	240
95	Линун	https://www.orthrusonline.ru/static/images/p/nextgen/linoonegalar.png	linoonegalar	\N	8	0.5	32.5	2	Сбор предметов   Прожорливость   Быстрые ноги	10	Самцы: 50% Самки: 50% 	2944	30	97.3	78	70	61	100	50	61	420
96	Гардевуар	https://www.orthrusonline.ru/static/images/p/nextgen/gardevoirmega.png	gardevoirmega	\N	22	1.6	48.4	3	Оворожение	14	Самцы: 50% Самки: 50% 	0	0	100	68	85	65	100	165	135	618
97	Саблай	https://www.orthrusonline.ru/static/images/p/nextgen/sableyemega.png	sableyemega	\N	53	0.5	161	1	Волшебное зеркало	17	Самцы: 50% Самки: 50% 	0	0	100	50	85	125	20	85	115	480
98	Мавайл	https://www.orthrusonline.ru/static/images/p/nextgen/mawilemega.png	mawilemega	\N	54	1	23.5	4	Большая сила	14	Самцы: 50% Самки: 50% 	0	0	100	50	105	125	50	55	95	480
99	Аггрон	https://www.orthrusonline.ru/static/images/p/nextgen/aggronmega.png	aggronmega	\N	16	2.2	395	3	Фильтрация	24	Самцы: 50% Самки: 50% 	0	0	100	70	140	230	50	60	80	630
100	Медичам	https://www.orthrusonline.ru/static/images/p/nextgen/medichammega.png	medichammega	\N	55	1.3	31.5	2	Чистая сила	14	Самцы: 50% Самки: 50% 	0	0	100	60	100	85	100	80	85	510
101	Манектрик	https://www.orthrusonline.ru/static/images/p/nextgen/manectricmega.png	manectricmega	\N	9	1.8	44	3	Запугивание	14	Самцы: 50% Самки: 50% 	0	0	100	70	75	80	135	135	80	575
102	Шарпедо	https://www.orthrusonline.ru/static/images/p/nextgen/sharpedomega.png	sharpedomega	\N	34	2.5	130.3	3	Крепкая челюсть	14	Самцы: 50% Самки: 50% 	0	0	100	70	140	70	105	110	65	560
103	Камерупт	https://www.orthrusonline.ru/static/images/p/nextgen/cameruptmega.png	cameruptmega	\N	56	2.5	320.5	2	Грубая сила	14	Самцы: 50% Самки: 50% 	0	0	100	70	120	100	20	145	105	560
104	Алтария	https://www.orthrusonline.ru/static/images/p/nextgen/altariamega.png	altariamega	\N	57	1.5	20.6	5	Оворожение	14	Самцы: 50% Самки: 50% 	0	0	100	75	110	110	80	110	105	590
105	Кастформ	https://www.orthrusonline.ru/static/images/p/nextgen/castformrainy.png	castformrainy	\N	4	0.3	0.8	2	Предсказание погоды	17	Самцы: 50% Самки: 50% 	0	0	100	70	70	70	70	70	70	420
106	Кастформ	https://www.orthrusonline.ru/static/images/p/nextgen/castformsnowy.png	castformsnowy	\N	12	0.3	0.8	2	Предсказание погоды	17	Самцы: 50% Самки: 50% 	0	0	100	70	70	70	70	70	70	420
107	Кастформ	https://www.orthrusonline.ru/static/images/p/nextgen/castformsunny.png	castformsunny	\N	58	0.3	0.8	2	Предсказание погоды	17	Самцы: 50% Самки: 50% 	0	0	100	70	70	70	70	70	70	420
108	Банетт	https://www.orthrusonline.ru/static/images/p/nextgen/banettemega.png	banettemega	\N	48	1.2	13	4	Проказник	17	Самцы: 50% Самки: 50% 	0	0	100	64	165	75	75	93	83	555
109	Абсол	https://www.orthrusonline.ru/static/images/p/nextgen/absolmega.png	absolmega	\N	15	1.2	49	1	Волшебное зеркало	17	Самцы: 50% Самки: 50% 	0	0	100	65	150	60	115	115	60	565
110	Глали	https://www.orthrusonline.ru/static/images/p/nextgen/glaliemega.png	glaliemega	\N	12	2.1	350.2	2	Охлаждение	14	Самцы: 50% Самки: 50% 	0	0	100	80	120	80	100	120	80	580
111	Саламенс	https://www.orthrusonline.ru/static/images/p/nextgen/salamencemega.png	salamencemega	\N	59	1.8	112.6	3	Поднятие в воздух	27	Самцы: 50% Самки: 50% 	0	0	100	95	145	130	120	120	90	700
112	Метагросс	https://www.orthrusonline.ru/static/images/p/nextgen/metagrossmega.png	metagrossmega	\N	60	2.5	942.9	3	Крепкие когти	27	Бесполые	0	0	100	80	145	150	110	105	110	700
113	Латиас	https://www.orthrusonline.ru/static/images/p/nextgen/latiasmega.png	latiasmega	\N	61	1.8	52	3	Левитация	80	Только самки	0	0	100	80	100	120	110	140	150	700
114	Латиос	https://www.orthrusonline.ru/static/images/p/nextgen/latiosmega.png	latiosmega	\N	61	2.3	70	3	Левитация	80	Только самцы	0	0	100	80	130	100	110	160	120	700
115	Кайогр	https://www.orthrusonline.ru/static/images/p/nextgen/kyogreprimal.png	kyogreprimal	\N	4	9.8	430	3	Исконный океан	80	Бесполые	0	0	100	100	150	90	90	180	160	770
116	Граудон	https://www.orthrusonline.ru/static/images/p/nextgen/groudonprimal.png	groudonprimal	\N	62	5	999.7	3	Пустынные земли	80	Бесполые	1	1	100	100	180	160	90	150	90	770
117	Рейкваза	https://www.orthrusonline.ru/static/images/p/nextgen/rayquazamega.png	rayquazamega	\N	59	10.8	392	3	Дельта-Поток	80	Бесполые	0	0	100	105	180	100	115	180	100	780
118	Деоксис	https://www.orthrusonline.ru/static/images/p/nextgen/deoxysattack.png	deoxysattack	\N	19	1.7	60.8	3	Давление	80	Бесполые	18	0	99.9	50	180	20	150	180	20	600
119	Деоксис	https://www.orthrusonline.ru/static/images/p/nextgen/deoxysdefense.png	deoxysdefense	\N	19	1.7	60.8	3	Давление	80	Бесполые	35	0	99.8	50	70	160	90	70	160	600
120	Деоксис	https://www.orthrusonline.ru/static/images/p/nextgen/deoxysspeed.png	deoxysspeed	\N	19	1.7	60.8	3	Давление	80	Бесполые	4	1	100	50	95	90	180	95	90	600
121	Вормадам	https://www.orthrusonline.ru/static/images/p/nextgen/wormadamsandy.png	wormadamsandy	\N	63	0.5	6.5	2	Предвидение   Пыленепроницаемость	10	Только самки	302	8	97.9	60	79	105	36	59	85	424
122	Вормадам	https://www.orthrusonline.ru/static/images/p/nextgen/wormadamtrash.png	wormadamtrash	\N	45	0.5	6.5	2	Предвидение   Пыленепроницаемость	10	Только самки	293	2	98	60	69	95	36	69	95	424
123	Черрим	https://www.orthrusonline.ru/static/images/p/nextgen/cherrimsunshine.png	cherrimsunshine	\N	64	0.5	9.3	2	Дар цветов	14	Самцы: 50% Самки: 50% 	0	0	100	70	60	70	85	87	78	450
124	Лопанни	https://www.orthrusonline.ru/static/images/p/nextgen/lopunnymega.png	lopunnymega	\N	65	1.3	28.3	2	Дерзость	14	Самцы: 50% Самки: 50% 	0	0	100	65	136	94	135	54	96	580
125	Гарчомп	https://www.orthrusonline.ru/static/images/p/nextgen/garchompmega.png	garchompmega	\N	66	1.9	95	3	Сила песка	27	Самцы: 50% Самки: 50% 	0	0	100	108	170	115	92	120	95	700
126	Лукарио	https://www.orthrusonline.ru/static/images/p/nextgen/lucariomega.png	lucariomega	\N	67	1.3	57.5	1	Адаптация	17	Самцы: 87.5% Самки: 12.5% 	0	0	100	70	145	88	112	140	70	625
127	Абомасноу	https://www.orthrusonline.ru/static/images/p/nextgen/abomasnowmega.png	abomasnowmega	\N	68	2.7	185	3	Снежная тревога	14	Самцы: 50% Самки: 50% 	0	0	100	90	132	105	30	132	105	594
128	Галлэйд	https://www.orthrusonline.ru/static/images/p/nextgen/gallademega.png	gallademega	\N	40	1.6	56.4	3	Концентрация	14	Только самцы	0	0	100	68	165	95	110	65	115	618
129	Ротом	https://www.orthrusonline.ru/static/images/p/nextgen/rotomfan.png	rotomfan	\N	69	0.3	0.3	2	Левитация	14	Бесполые	804	3	98.9	50	65	107	86	105	107	520
130	Ротом	https://www.orthrusonline.ru/static/images/p/nextgen/rotomfrost.png	rotomfrost	\N	70	0.3	0.3	2	Левитация	14	Бесполые	822	2	98.9	50	65	107	86	105	107	520
131	Ротом	https://www.orthrusonline.ru/static/images/p/nextgen/rotomheat.png	rotomheat	\N	71	0.3	0.3	2	Левитация	14	Бесполые	958	2	98.5	50	65	107	86	105	107	520
133	Ротом	https://www.orthrusonline.ru/static/images/p/nextgen/rotomwash.png	rotomwash	\N	72	0.3	0.3	2	Левитация	14	Бесполые	975	15	98.1	50	65	107	86	105	107	520
134	Диалга	https://www.orthrusonline.ru/static/images/p/nextgen/dialgaorigin.png	dialgaorigin	\N	73	7	850	3	Давление   Телепатия	80	Бесполые	2	2	100	100	100	120	90	150	120	680
135	Палкия	https://www.orthrusonline.ru/static/images/p/nextgen/palkiaorigin.png	palkiaorigin	\N	74	6.3	660	3	Давление   Телепатия	80	Бесполые	1	1	100	90	100	100	120	150	120	680
136	Гиратина	https://www.orthrusonline.ru/static/images/p/nextgen/giratinaorigin.png	giratinaorigin	\N	75	6.9	650	3	Левитация	80	Бесполые	1	1	100	150	120	100	90	120	100	680
137	Шеймин	https://www.orthrusonline.ru/static/images/p/nextgen/shayminsky.png	shayminsky	\N	76	0.4	5.2	1	Небесное благословение	80	Бесполые	39	4	99.8	100	103	75	127	120	75	600
138	Самурот	https://www.orthrusonline.ru/static/images/p/nextgen/samurotthisui.png	samurotthisui	\N	34	1.5	58.2	1	Всплеск   Сметливость	14	Самцы: 87.5% Самки: 12.5% 	87	59	99.4	90	108	80	85	100	65	528
139	Аудино	https://www.orthrusonline.ru/static/images/p/nextgen/audinomega.png	audinomega	\N	77	1.5	32	4	Исцеление	14	Самцы: 50% Самки: 50% 	0	0	100	103	60	126	50	80	126	545
140	Лилигант	https://www.orthrusonline.ru/static/images/p/nextgen/lilliganthisui.png	lilliganthisui	\N	78	1.2	19.2	2	Хлорофилл   Энергичность   Травяной щит	14	Самцы: 12.5% Самки: 87.5% 	21	6	99.9	70	105	75	105	50	75	480
141	Баскулин	https://www.orthrusonline.ru/static/images/p/nextgen/basculinbluestriped.png	basculinbluestriped	\N	4	1	18	2	Каменная голова   Адаптация   Разрыв шаблона	27	Самцы: 50% Самки: 50% 	0	0	100	70	92	65	98	80	55	460
142	Баскулин	https://www.orthrusonline.ru/static/images/p/nextgen/basculinwhitestriped.png	basculinwhitestriped	\N	4	1	18	2	Нервозность   Адаптация   Разрыв шаблона	27	Самцы: 50% Самки: 50% 	27	0	99.9	70	92	65	98	80	55	460
143	Дарумака	https://www.orthrusonline.ru/static/images/p/nextgen/darumakagalar.png	darumakagalar	\N	12	0.7	40	1	Энергичность   Концентрация	14	Самцы: 50% Самки: 50% 	1021	609	98.7	70	90	45	50	15	45	315
144	Дарманитан	https://www.orthrusonline.ru/static/images/p/nextgen/darmanitangalar.png	darmanitangalar	\N	12	1.7	120	1	Горилла тактика   Режим дарумы	14	Самцы: 50% Самки: 50% 	138	73	99.2	105	140	55	95	30	55	480
145	Дарманитан	https://www.orthrusonline.ru/static/images/p/nextgen/darmanitangalarzen.png	darmanitangalarzen	\N	79	1.7	120	1	Режим дарумы	14	Самцы: 50% Самки: 50% 	0	0	100	105	160	55	135	30	55	540
146	Дарманитан	https://www.orthrusonline.ru/static/images/p/nextgen/darmanitanzen.png	darmanitanzen	\N	80	1.3	92.9	1	Режим дарумы	14	Самцы: 50% Самки: 50% 	0	0	100	105	30	105	55	140	105	540
147	Ямаск	https://www.orthrusonline.ru/static/images/p/nextgen/yamaskgalar.png	yamaskgalar	\N	81	0.5	1.5	2	Блуждающий дух	17	Самцы: 50% Самки: 50% 	251	1	98.9	38	55	85	30	30	65	303
148	Зоруа	https://www.orthrusonline.ru/static/images/p/nextgen/zoruahisui.png	zoruahisui	\N	82	0.7	12.5	1	Иллюзия	17	Самцы: 87.5% Самки: 12.5% 	101	2	99.5	35	60	40	70	85	40	330
149	Зороарк	https://www.orthrusonline.ru/static/images/p/nextgen/zoroarkhisui.png	zoroarkhisui	\N	82	1.6	73	1	Иллюзия	14	Самцы: 87.5% Самки: 12.5% 	79	12	99.4	55	100	60	110	125	60	510
150	Станфиск	https://www.orthrusonline.ru/static/images/p/nextgen/stunfiskgalar.png	stunfiskgalar	\N	14	0.7	20.5	2	Мимикрия	14	Самцы: 50% Самки: 50% 	650	12	98.5	109	81	99	32	66	84	471
151	Бравайри	https://www.orthrusonline.ru/static/images/p/nextgen/braviaryhisui.png	braviaryhisui	\N	37	1.7	43.4	3	Острый глаз   Грубая сила   Тонированные линзы	14	Только самцы	50	1	99.6	110	83	70	65	112	70	510
152	Торнадус	https://www.orthrusonline.ru/static/images/p/nextgen/tornadustherian.png	tornadustherian	\N	83	1.4	63	3	Регенерация	80	Только самцы	15	3	99.9	79	100	80	121	110	90	580
153	Тандерус	https://www.orthrusonline.ru/static/images/p/nextgen/thundurustherian.png	thundurustherian	\N	69	3	61	3	Поглощение электричества	80	Только самцы	2	2	100	79	105	70	101	145	80	580
154	Лэндорус	https://www.orthrusonline.ru/static/images/p/nextgen/landorustherian.png	landorustherian	\N	84	1.3	68	3	Запугивание	80	Только самцы	1	0	100	89	145	90	91	105	80	600
155	Кюрем	https://www.orthrusonline.ru/static/images/p/nextgen/kyuremblack.png	kyuremblack	\N	85	3.3	325	3	Теравольт	80	Бесполые	29	12	99.8	125	170	100	95	120	90	700
156	Кюрем	https://www.orthrusonline.ru/static/images/p/nextgen/kyuremwhite.png	kyuremwhite	\N	85	3.6	325	3	Турбопламя	80	Бесполые	15	4	99.9	125	120	90	95	170	100	700
157	Келдео	https://www.orthrusonline.ru/static/images/p/nextgen/keldeoresolute.png	keldeoresolute	\N	86	1.4	48.5	3	Сердце правосудия	54	Бесполые	18	6	99.9	91	72	90	108	129	90	580
158	Мелоэтта	https://www.orthrusonline.ru/static/images/p/nextgen/meloettapirouette.png	meloettapirouette	\N	65	0.6	6.5	3	Небесное благословение	80	Бесполые	42	5	99.8	100	128	90	128	77	77	600
159	Грениндзя	https://www.orthrusonline.ru/static/images/p/nextgen/greninjaash.png	greninjaash	\N	34	1.5	40	1	Боевые узы	14	Только самцы	0	0	100	72	145	67	132	153	71	640
160	Мяустик	https://www.orthrusonline.ru/static/images/p/nextgen/meowsticf.png	meowsticf	\N	19	0.6	8.5	2	Острый глаз   Проскальзывание   Состязательность	14	Самцы: 50% Самки: 50% 	174	4	98.7	74	48	76	104	83	81	466
161	Эджислэш	https://www.orthrusonline.ru/static/images/p/nextgen/aegislashblade.png	aegislashblade	\N	87	1.7	53	2	Смена позиции	14	Самцы: 50% Самки: 50% 	0	0	100	60	140	50	60	140	50	500
162	Слиггу	https://www.orthrusonline.ru/static/images/p/nextgen/sliggoohisui.png	sliggoohisui	\N	73	0.7	68.5	3	Поглотитель соков   Панцирь-броня   Липкость	27	Самцы: 50% Самки: 50% 	25	13	99.8	58	75	83	40	83	113	452
163	Гудра	https://www.orthrusonline.ru/static/images/p/nextgen/goodrahisui.png	goodrahisui	\N	73	1.7	334.1	3	Поглотитель соков   Панцирь-броня   Липкость	27	Самцы: 50% Самки: 50% 	32	8	99.7	80	100	100	60	110	150	600
164	Пампкабу	https://www.orthrusonline.ru/static/images/p/nextgen/pumpkaboolarge.png	pumpkaboolarge	\N	88	0.5	7.5	2	Сбор предметов   Обыскивание   Бессонница	14	Самцы: 50% Самки: 50% 	1933	2	95	54	66	70	46	44	55	335
165	Пампкабу	https://www.orthrusonline.ru/static/images/p/nextgen/pumpkaboosmall.png	pumpkaboosmall	\N	88	0.3	3.5	2	Сбор предметов   Обыскивание   Бессонница	14	Самцы: 50% Самки: 50% 	1889	4	94.8	44	66	70	56	44	55	335
166	Пампкабу	https://www.orthrusonline.ru/static/images/p/nextgen/pumpkaboosuper.png	pumpkaboosuper	\N	88	0.8	15	2	Сбор предметов   Обыскивание   Бессонница	14	Самцы: 50% Самки: 50% 	1844	2	94.9	59	66	70	41	44	55	335
167	Горгейст	https://www.orthrusonline.ru/static/images/p/nextgen/gourgeistlarge.png	gourgeistlarge	\N	88	1.1	14	2	Сбор предметов   Обыскивание   Бессонница	14	Самцы: 50% Самки: 50% 	167	2	99.4	75	95	122	69	58	75	494
168	Горгейст	https://www.orthrusonline.ru/static/images/p/nextgen/gourgeistsmall.png	gourgeistsmall	\N	88	0.7	9.5	2	Сбор предметов   Обыскивание   Бессонница	14	Самцы: 50% Самки: 50% 	164	0	99.4	55	85	122	99	58	75	494
169	Горгейст	https://www.orthrusonline.ru/static/images/p/nextgen/gourgeistsuper.png	gourgeistsuper	\N	88	1.7	39	2	Сбор предметов   Обыскивание   Бессонница	14	Самцы: 50% Самки: 50% 	178	4	99.2	85	100	122	54	58	75	494
170	Авалагг	https://www.orthrusonline.ru/static/images/p/nextgen/avalugghisui.png	avalugghisui	\N	89	1.4	262.4	2	Крепкая челюсть   Ледяное тело   Стойкость	14	Самцы: 50% Самки: 50% 	68	8	99.4	95	127	184	38	34	36	514
171	Зигард	https://www.orthrusonline.ru/static/images/p/nextgen/zygarde10.png	zygarde10	\N	66	1.2	33.5	3	Разлом Ауры   Мощное строение	80	Бесполые	1	1	100	54	100	71	115	61	85	486
172	Зигард	https://www.orthrusonline.ru/static/images/p/nextgen/zygardecomplete.png	zygardecomplete	\N	66	4.5	610	3	Мощное строение	80	Бесполые	0	0	100	216	100	121	85	91	95	708
173	Дианси	https://www.orthrusonline.ru/static/images/p/nextgen/dianciemega.png	dianciemega	\N	90	1.1	27.8	3	Волшебное зеркало	80	Бесполые	0	0	100	50	160	110	110	160	110	700
174	Хупа	https://www.orthrusonline.ru/static/images/p/nextgen/hoopaunbound.png	hoopaunbound	\N	91	6.5	490	3	Чародейство	80	Бесполые	1	1	100	80	160	60	80	170	130	680
175	Десиджуай	https://www.orthrusonline.ru/static/images/p/nextgen/decidueyehisui.png	decidueyehisui	\N	78	1.6	37	1	Сверхрост   Дерзость	10	Самцы: 87.5% Самки: 12.5% 	66	31	99.6	88	112	80	60	95	95	530
176	Орикорио	https://www.orthrusonline.ru/static/images/p/nextgen/oricoriopau.png	oricoriopau	\N	37	0.6	3.4	2	Танцовщик	14	Самцы: 25% Самки: 75% 	911	7	96.2	75	70	70	93	98	70	476
177	Орикорио	https://www.orthrusonline.ru/static/images/p/nextgen/oricoriopompom.png	oricoriopompom	\N	69	0.6	3.4	2	Танцовщик	14	Самцы: 25% Самки: 75% 	961	11	96.7	75	70	70	93	98	70	476
178	Орикорио	https://www.orthrusonline.ru/static/images/p/nextgen/oricoriosensu.png	oricoriosensu	\N	92	0.6	3.4	2	Танцовщик	14	Самцы: 25% Самки: 75% 	1166	8	96.2	75	70	70	93	98	70	476
179	Ликанрок	https://www.orthrusonline.ru/static/images/p/nextgen/lycanrocdusk.png	lycanrocdusk	\N	93	0.8	25	2	Крепкие когти	10	Самцы: 50% Самки: 50% 	1057	4	97.6	75	117	65	110	55	65	487
180	Ликанрок	https://www.orthrusonline.ru/static/images/p/nextgen/lycanrocmidnight.png	lycanrocmidnight	\N	93	1.1	25	2	Острый глаз   Подъём духа   Боец-одиночка	10	Самцы: 50% Самки: 50% 	229	10	98.2	85	115	75	82	55	75	487
181	Вишиваши	https://www.orthrusonline.ru/static/images/p/nextgen/wishiwashischool.png	wishiwashischool	\N	4	8.2	78.6	4	Стая	10	Самцы: 50% Самки: 50% 	0	0	100	45	140	130	30	140	135	620
182	Миниор	https://www.orthrusonline.ru/static/images/p/nextgen/miniormeteor.png	miniormeteor	\N	36	0.3	40	1	Беззащитность	17	Бесполые	0	0	100	60	60	100	60	60	100	440
183	Мимикью	https://www.orthrusonline.ru/static/images/p/nextgen/mimikyubusted.png	mimikyubusted	\N	94	0.2	0.7	2	Маскировка	14	Самцы: 50% Самки: 50% 	0	0	100	55	90	80	96	50	105	476
184	Некрозма	https://www.orthrusonline.ru/static/images/p/nextgen/necrozmaultra.png	necrozmaultra	\N	95	7.5	230	3	Нейрофорс	14	Бесполые	1	1	100	97	167	97	129	167	97	754
185	Melmetal-Gmax	https://www.orthrusonline.ru/static/images/p/nextgen/melmetalgmax.png	melmetalgmax	\N	16	25	0	3	Железный кулак	80	Бесполые	0	0	100	135	143	143	34	80	65	600
186	Риллабум	https://www.orthrusonline.ru/static/images/p/nextgen/rillaboomgmax.png	rillaboomgmax	\N	64	3	0	1	Сверхрост   Травяная волна	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	100	125	90	85	60	70	530
187	Синдерейс	https://www.orthrusonline.ru/static/images/p/nextgen/cinderacegmax.png	cinderacegmax	\N	58	3	0	1	Яростное пламя   Либеро	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	80	116	75	119	65	75	530
188	Интелеон	https://www.orthrusonline.ru/static/images/p/nextgen/inteleongmax.png	inteleongmax	\N	4	3	0	1	Всплеск   Снайпер	14	Самцы: 87.5% Самки: 12.5% 	0	0	100	70	85	65	120	125	65	530
189	Корвинайт	https://www.orthrusonline.ru/static/images/p/nextgen/corviknightgmax.png	corviknightgmax	\N	96	14	0	1	Давление   Нервирование   Зеркальная броня	10	Бесполые	0	0	100	98	87	105	67	53	85	495
190	Орбитл	https://www.orthrusonline.ru/static/images/p/nextgen/orbeetlegmax.png	orbeetlegmax	\N	97	14	0	2	Роение   Обыскивание   Телепатия	10	Бесполые	0	0	100	60	45	110	90	80	120	505
191	Дреднав	https://www.orthrusonline.ru/static/images/p/nextgen/drednawgmax.png	drednawgmax	\N	98	24	0	2	Крепкая челюсть   Панцирь-броня   Быстрое плаванье	14	Бесполые	0	0	100	90	115	90	74	48	68	485
192	Коалоссал	https://www.orthrusonline.ru/static/images/p/nextgen/coalossalgmax.png	coalossalgmax	\N	99	42	0	1	Паровой двигатель   Огненное тело   Вспышка пламени	10	Бесполые	0	0	100	110	80	120	30	80	90	510
193	Флэпл	https://www.orthrusonline.ru/static/images/p/nextgen/flapplegmax.png	flapplegmax	\N	28	24	0	5	Созревание   Прожорливость   Энергичность	14	Бесполые	0	0	100	70	110	80	70	95	60	485
194	Эплтан	https://www.orthrusonline.ru/static/images/p/nextgen/appletungmax.png	appletungmax	\N	28	24	0	5	Созревание   Прожорливость   Толстая кожа	14	Бесполые	0	0	100	110	85	80	30	100	80	485
195	Сандаконда	https://www.orthrusonline.ru/static/images/p/nextgen/sandacondagmax.png	sandacondagmax	\N	100	22	0	2	Песчаная коса   Сбрасывание кожи   Песчаный покров	14	Бесполые	0	0	100	72	107	125	71	65	70	510
196	Краморант	https://www.orthrusonline.ru/static/images/p/nextgen/cramorantgorging.png	cramorantgorging	\N	101	0.8	18	2	Глоток снаряда	14	Самцы: 50% Самки: 50% 	0	0	100	70	85	55	85	85	95	475
197	Краморант	https://www.orthrusonline.ru/static/images/p/nextgen/cramorantgulping.png	cramorantgulping	\N	101	0.8	18	2	Глоток снаряда	14	Самцы: 50% Самки: 50% 	0	0	100	70	85	55	85	85	95	475
198	Токстрисити	https://www.orthrusonline.ru/static/images/p/nextgen/toxtricitygmax.png	toxtricitygmax	\N	102	24	0	1	Панк-рок   Плюс   Техничность	17	Самцы: 50% Самки: 50% 	0	0	100	75	98	70	75	114	70	502
199	Токстрисити	https://www.orthrusonline.ru/static/images/p/nextgen/toxtricitylowkey.png	toxtricitylowkey	\N	102	1.6	40	1	Панк-рок   Минус   Техничность	17	Самцы: 50% Самки: 50% 	21	0	99.8	75	98	70	75	114	70	502
200	Токстрисити	https://www.orthrusonline.ru/static/images/p/nextgen/toxtricitylowkeygmax.png	toxtricitylowkeygmax	\N	102	24	0	1	Панк-рок   Минус   Техничность	17	Самцы: 50% Самки: 50% 	0	0	100	75	98	70	75	114	70	502
201	Сентискорч	https://www.orthrusonline.ru/static/images/p/nextgen/centiskorchgmax.png	centiskorchgmax	\N	103	75	0	2	Вспышка пламени   Белый дым   Огненное тело	14	Бесполые	0	0	100	100	115	65	65	90	90	525
202	Синисти	https://www.orthrusonline.ru/static/images/p/nextgen/sinisteaantique.png	sinisteaantique	\N	48	0.1	0.2	2	Слабая броня   Проклятое тело	14	Бесполые	0	0	100	40	45	45	50	74	54	308
203	Полтигейст	https://www.orthrusonline.ru/static/images/p/nextgen/polteageistantique.png	polteageistantique	\N	48	0.2	0.4	2	Слабая броня   Проклятое тело	14	Бесполые	0	0	100	60	65	65	70	134	114	508
204	Хаттерена	https://www.orthrusonline.ru/static/images/p/nextgen/hatterenegmax.png	hatterenegmax	\N	22	26	0	3	Исцеление   Предвидение   Волшебное зеркало	14	Только самки	0	0	100	57	90	95	29	136	103	510
205	Гриммснарл	https://www.orthrusonline.ru/static/images/p/nextgen/grimmsnarlgmax.png	grimmsnarlgmax	\N	104	32	0	2	Проказник   Обыскивание   Карманный вор	14	Бесполые	0	0	100	95	120	65	60	95	75	510
206	Алкреми	https://www.orthrusonline.ru/static/images/p/nextgen/alcremiegmax.png	alcremiegmax	\N	105	30	0	2	Сладкий покров   Ароматный покров	14	Только самки	0	0	100	65	60	75	64	110	121	495
207	Айскью	https://www.orthrusonline.ru/static/images/p/nextgen/eiscuenoice.png	eiscuenoice	\N	12	1.4	89	3	Ледяная маска	17	Самцы: 50% Самки: 50% 	0	0	100	75	80	70	130	65	50	470
208	Индиди	https://www.orthrusonline.ru/static/images/p/nextgen/indeedeef.png	indeedeef	\N	106	0.9	28	4	Собственный темп   Синхронизация   Психическая волна	27	Только самки	1227	4	98.2	70	55	65	85	95	105	475
209	Морпеко	https://www.orthrusonline.ru/static/images/p/nextgen/morpekohangry.png	morpekohangry	\N	107	0.3	3	2	Голодный режим	7	Самцы: 50% Самки: 50% 	0	0	100	58	95	58	97	70	58	436
210	Коппераджа	https://www.orthrusonline.ru/static/images/p/nextgen/copperajahgmax.png	copperajahgmax	\N	16	23	0	2	Грубая сила   Увеличение веса	17	Самцы: 50% Самки: 50% 	0	0	100	122	130	69	30	80	69	500
211	Дюралюдон	https://www.orthrusonline.ru/static/images/p/nextgen/duraludongmax.png	duraludongmax	\N	73	43	0	2	Снижение веса   Увеличение веса   Непоколебимость	20	Бесполые	0	0	100	70	95	115	85	120	50	535
212	Зэйшиан	https://www.orthrusonline.ru/static/images/p/nextgen/zaciancrowned.png	zaciancrowned	\N	108	2.8	355	3	Бесстрашный меч	80	Бесполые	1	1	100	92	170	115	148	80	115	720
213	Замазента	https://www.orthrusonline.ru/static/images/p/nextgen/zamazentacrowned.png	zamazentacrowned	\N	67	2.9	785	3	Щит бесстрашия	80	Бесполые	0	0	100	92	130	145	128	80	145	720
214	Этернатус	https://www.orthrusonline.ru/static/images/p/nextgen/eternatuseternamax.png	eternatuseternamax	\N	109	100	0	3	Давление	80	Бесполые	1	1	100	255	115	250	130	125	250	1125
215	Уршифу	https://www.orthrusonline.ru/static/images/p/nextgen/urshifugmax.png	urshifugmax	\N	110	3	0	3	Невидимый кулак	80	Самцы: 87.5% Самки: 12.5% 	0	0	100	100	130	100	97	63	60	550
216	Уршифу	https://www.orthrusonline.ru/static/images/p/nextgen/urshifurapidstrike.png	urshifurapidstrike	\N	33	1.9	105	3	Невидимый кулак	80	Самцы: 87.5% Самки: 12.5% 	75	29	99.4	100	130	100	97	63	60	550
217	Уршифу	https://www.orthrusonline.ru/static/images/p/nextgen/urshifurapidstrikegmax.png	urshifurapidstrikegmax	\N	33	1.9	105	3	Невидимый кулак	80	Самцы: 87.5% Самки: 12.5% 	0	0	100	100	130	100	97	63	60	550
218	Заруда	https://www.orthrusonline.ru/static/images/p/nextgen/zarudedada.png	zarudedada	\N	111	1.8	70	3	Травяной щит	80	Бесполые	0	0	100	105	120	105	105	70	95	600
219	Калирекс	https://www.orthrusonline.ru/static/images/p/nextgen/calyrexice.png	calyrexice	\N	112	2.4	809.1	3	Единение	80	Бесполые	38	13	99.8	100	165	150	50	85	130	680
220	Калирекс	https://www.orthrusonline.ru/static/images/p/nextgen/calyrexshadow.png	calyrexshadow	\N	113	2.4	53.6	3	Единение	80	Бесполые	51	21	99.7	100	85	80	150	165	100	680
221	Урсалуна	https://www.orthrusonline.ru/static/images/p/nextgen/ursalunabloodmoon.png	ursalunabloodmoon	\N	114	2.7	333	2	Духовное око	14	Самцы: 50% Самки: 50% 	95	68	99.3	113	70	120	52	135	65	555
222	Баскулиджен	https://www.orthrusonline.ru/static/images/p/nextgen/basculegionf.png	basculegionf	\N	115	3	110	2	Быстрое плаванье   Адаптация   Разрыв шаблона	27	Самцы: 50% Самки: 50% 	2	0	100	120	92	65	78	100	75	530
223	Энаморус	https://www.orthrusonline.ru/static/images/p/nextgen/enamorustherian.png	enamorustherian	\N	116	1.6	48	3	Пыленепроницаемость	80	Только самки	1	0	100	74	115	110	46	135	100	580
224	Маусхолд	https://www.orthrusonline.ru/static/images/p/nextgen/mausholdfour.png	mausholdfour	\N	17	0.3	2.8	4	Защита товарища   Защёчный мешок   Техничность	7	Бесполые	25	0	99.8	74	75	70	111	65	75	470
225	Даданспарс	https://www.orthrusonline.ru/static/images/p/nextgen/dudunsparcethreesegment.png	dudunsparcethreesegment	\N	17	4.5	47.4	2	Небесное благословение   Бегство   Нервозность	14	Самцы: 50% Самки: 50% 	20	3	99.8	125	100	80	55	85	75	520
226	Огерпон	https://www.orthrusonline.ru/static/images/p/nextgen/ogerponcornerstone.png	ogerponcornerstone	\N	117	1.2	39.8	3	Стойкость   Воплощение аспекта	80	Только самки	0	0	100	80	120	84	110	60	96	550
227	Огерпон	https://www.orthrusonline.ru/static/images/p/nextgen/ogerponhearthflame.png	ogerponhearthflame	\N	118	1.2	39.8	3	Разрыв шаблона   Воплощение аспекта	80	Только самки	0	0	100	80	120	84	110	60	96	550
228	Огерпон	https://www.orthrusonline.ru/static/images/p/nextgen/ogerponwellspring.png	ogerponwellspring	\N	119	1.2	39.8	3	Поглощение воды   Воплощение аспекта	80	Только самки	0	0	100	80	120	84	110	60	96	550
229	Терапагос	https://www.orthrusonline.ru/static/images/p/nextgen/terapagosstellar.png	terapagosstellar	\N	17	1.7	77	3	Тера Обнуление	80	Бесполые	0	0	100	160	105	110	85	130	110	700
230	Терапагос	https://www.orthrusonline.ru/static/images/p/nextgen/terapagosterastal.png	terapagosterastal	\N	17	0.3	16	3	Тера Оболочка	80	Бесполые	0	0	100	95	95	110	85	105	110	600
231	Бульбазавр	https://www.orthrusonline.ru/static/images/p/nextgen/bulbasaur.png	bulbasaur	\N	1	0.7	6.9	1	Сверхрост   Хлорофилл	14	Самцы: 87.5% Самки: 12.5% 	2628	51	87.8	45	49	49	45	65	65	318
232	Ивизавр	https://www.orthrusonline.ru/static/images/p/nextgen/ivysaur.png	ivysaur	\N	1	1	13	1	Сверхрост   Хлорофилл	14	Самцы: 87.5% Самки: 12.5% 	864	7	92.9	60	62	63	60	80	80	405
233	Венузавр	https://www.orthrusonline.ru/static/images/p/nextgen/venusaur.png	venusaur	\N	1	2	100	1	Сверхрост   Хлорофилл	14	Самцы: 87.5% Самки: 12.5% 	842	56	93.4	80	82	83	80	100	100	525
234	Чармандер	https://www.orthrusonline.ru/static/images/p/nextgen/charmander.png	charmander	\N	58	0.6	8.5	1	Яростное пламя   Солнечная сила	14	Самцы: 87.5% Самки: 12.5% 	3455	232	74.8	39	52	43	65	60	50	309
235	Чармилион	https://www.orthrusonline.ru/static/images/p/nextgen/charmeleon.png	charmeleon	\N	58	1.1	19	1	Яростное пламя   Солнечная сила	14	Самцы: 87.5% Самки: 12.5% 	2544	38	79.1	58	64	58	80	80	65	405
236	Чаризард	https://www.orthrusonline.ru/static/images/p/nextgen/charizard.png	charizard	\N	2	1.7	90.5	1	Яростное пламя   Солнечная сила	14	Самцы: 87.5% Самки: 12.5% 	2306	227	81.7	78	84	78	100	109	85	534
237	Сквиртл	https://www.orthrusonline.ru/static/images/p/nextgen/squirtle.png	squirtle	\N	4	0.5	9	1	Всплеск   Омывка дождем	14	Самцы: 87.5% Самки: 12.5% 	2678	60	91.7	44	48	65	43	50	64	314
238	Вартортл	https://www.orthrusonline.ru/static/images/p/nextgen/wartortle.png	wartortle	\N	4	1	22.5	1	Всплеск   Омывка дождем	14	Самцы: 87.5% Самки: 12.5% 	571	4	95.3	59	63	80	58	65	80	405
239	Бластойз	https://www.orthrusonline.ru/static/images/p/nextgen/blastoise.png	blastoise	\N	4	1.6	85.5	1	Всплеск   Омывка дождем	14	Самцы: 87.5% Самки: 12.5% 	528	26	95.8	79	83	100	78	85	105	530
240	Катерпи	https://www.orthrusonline.ru/static/images/p/nextgen/caterpie.png	caterpie	\N	120	0.3	2.9	2	Защитная пыльца   Бегство	10	Самцы: 50% Самки: 50% 	7291	269	73.4	45	30	35	45	20	20	195
241	Метапод	https://www.orthrusonline.ru/static/images/p/nextgen/metapod.png	metapod	\N	120	0.7	9.9	2	Сбрасывание кожи	10	Самцы: 50% Самки: 50% 	1380	103	94.4	50	20	55	30	25	25	205
242	Баттерфри	https://www.orthrusonline.ru/static/images/p/nextgen/butterfree.png	butterfree	\N	5	1.1	32	2	Фасеточность   Тонированные линзы	10	Самцы: 50% Самки: 50% 	8035	368	70.2	60	45	50	70	90	80	395
243	Видл	https://www.orthrusonline.ru/static/images/p/nextgen/weedle.png	weedle	\N	6	0.3	3.2	2	Защитная пыльца   Бегство	10	Самцы: 50% Самки: 50% 	6150	259	88.9	40	35	30	50	20	20	195
244	Какуна	https://www.orthrusonline.ru/static/images/p/nextgen/kakuna.png	kakuna	\N	6	0.6	10	2	Сбрасывание кожи	10	Самцы: 50% Самки: 50% 	3702	124	91.4	45	25	50	35	25	25	205
245	Бидрилл	https://www.orthrusonline.ru/static/images/p/nextgen/beedrill.png	beedrill	\N	6	1	29.5	2	Роение   Снайпер	10	Самцы: 50% Самки: 50% 	10833	364	80.8	65	90	40	75	45	80	395
246	Пиджи	https://www.orthrusonline.ru/static/images/p/nextgen/pidgey.png	pidgey	\N	7	0.3	1.8	1	Острый глаз   Косолапость   Большие клевки	10	Самцы: 50% Самки: 50% 	17841	228	62.4	40	45	40	56	35	35	251
247	Пиджеотто	https://www.orthrusonline.ru/static/images/p/nextgen/pidgeotto.png	pidgeotto	\N	7	1.1	30	1	Острый глаз   Косолапость   Большие клевки	10	Самцы: 50% Самки: 50% 	6433	254	79.8	63	60	55	71	50	50	349
248	Пиджеот	https://www.orthrusonline.ru/static/images/p/nextgen/pidgeot.png	pidgeot	\N	7	1.5	39.5	1	Острый глаз   Косолапость   Большие клевки	10	Самцы: 50% Самки: 50% 	2881	173	91.4	83	80	75	101	70	70	479
249	Раттата	https://www.orthrusonline.ru/static/images/p/nextgen/rattata.png	rattata	\N	17	0.3	3.5	2	Бегство   Сила воли   Энергичность	10	Самцы: 50% Самки: 50% 	16154	1106	62	30	56	35	72	25	35	253
250	Ратикейт	https://www.orthrusonline.ru/static/images/p/nextgen/raticate.png	raticate	\N	17	0.7	18.5	2	Бегство   Сила воли   Энергичность	10	Самцы: 50% Самки: 50% 	2335	381	88	55	81	60	97	50	70	413
251	Спироу	https://www.orthrusonline.ru/static/images/p/nextgen/spearow.png	spearow	\N	7	0.3	2	2	Острый глаз   Снайпер	10	Самцы: 50% Самки: 50% 	8138	227	81.9	40	60	30	70	31	31	262
252	Фироу	https://www.orthrusonline.ru/static/images/p/nextgen/fearow.png	fearow	\N	7	1.2	38	2	Острый глаз   Снайпер	10	Самцы: 50% Самки: 50% 	3344	149	87.9	65	90	65	100	61	61	442
253	Эканс	https://www.orthrusonline.ru/static/images/p/nextgen/ekans.png	ekans	\N	121	2	6.9	2	Запугивание   Сбрасывание кожи   Нервирование	14	Самцы: 50% Самки: 50% 	8088	81	74.5	35	60	44	55	40	54	288
254	Арбок	https://www.orthrusonline.ru/static/images/p/nextgen/arbok.png	arbok	\N	121	3.5	65	2	Запугивание   Сбрасывание кожи   Нервирование	14	Самцы: 50% Самки: 50% 	3203	132	86.7	60	95	69	80	65	79	448
255	Пикачу	https://www.orthrusonline.ru/static/images/p/nextgen/pikachu.png	pikachu	\N	9	0.4	6	2	Статическое электричество   Громоотвод	7	Самцы: 50% Самки: 50% 	24922	49	43.8	35	55	40	90	50	50	320
256	Райчу	https://www.orthrusonline.ru/static/images/p/nextgen/raichu.png	raichu	\N	9	0.8	30	2	Статическое электричество   Громоотвод	7	Самцы: 50% Самки: 50% 	468	10	96.3	60	90	55	110	90	80	485
257	Сэндшрю	https://www.orthrusonline.ru/static/images/p/nextgen/sandshrew.png	sandshrew	\N	100	0.6	12	2	Песчаный покров   Песчаная гонка	14	Самцы: 50% Самки: 50% 	5548	20	86.8	50	75	85	40	20	30	300
258	Сэндслэш	https://www.orthrusonline.ru/static/images/p/nextgen/sandslash.png	sandslash	\N	100	1	29.5	2	Песчаный покров   Песчаная гонка	14	Самцы: 50% Самки: 50% 	2662	42	87.3	75	100	110	65	45	55	450
259	Нидоран	https://www.orthrusonline.ru/static/images/p/nextgen/nidoranf.png	nidoranf	\N	121	0.4	7	1	Ядовитые колючки   Соперничество   Энергичность	14	Только самки	10429	172	80.8	55	47	52	41	40	40	275
260	Нидорина	https://www.orthrusonline.ru/static/images/p/nextgen/nidorina.png	nidorina	\N	121	0.8	20	1	Ядовитые колючки   Соперничество   Энергичность	14	Только самки	2802	109	88.4	70	62	67	56	55	55	365
261	Нидоквин	https://www.orthrusonline.ru/static/images/p/nextgen/nidoqueen.png	nidoqueen	\N	42	1.3	60	1	Ядовитые колючки   Соперничество   Грубая сила	14	Только самки	93	33	99.3	90	92	87	76	75	85	505
262	Нидоран	https://www.orthrusonline.ru/static/images/p/nextgen/nidoranm.png	nidoranm	\N	121	0.5	9	1	Ядовитые колючки   Соперничество   Энергичность	14	Только самцы	9952	182	82.2	46	57	40	50	40	40	273
263	Нидорино	https://www.orthrusonline.ru/static/images/p/nextgen/nidorino.png	nidorino	\N	121	0.9	19.5	1	Ядовитые колючки   Соперничество   Энергичность	14	Только самцы	3230	109	88.2	61	72	57	65	55	55	365
264	Нидокинг	https://www.orthrusonline.ru/static/images/p/nextgen/nidoking.png	nidoking	\N	42	1.4	62	1	Ядовитые колючки   Соперничество   Грубая сила	14	Только самцы	126	27	99.1	81	102	77	85	85	75	505
265	Клефейри	https://www.orthrusonline.ru/static/images/p/nextgen/clefairy.png	clefairy	\N	105	0.6	7.5	4	Очарование   Волшебный щит   Защита товарища	7	Самцы: 25% Самки: 75% 	11186	90	89.2	70	45	48	35	60	65	323
266	Клефейбл	https://www.orthrusonline.ru/static/images/p/nextgen/clefable.png	clefable	\N	105	1.3	40	4	Очарование   Волшебный щит   Безразличие	7	Самцы: 25% Самки: 75% 	341	43	98	95	70	73	60	95	90	483
267	Вульпикс	https://www.orthrusonline.ru/static/images/p/nextgen/vulpix.png	vulpix	\N	58	0.6	9.9	2	Вспышка пламени   Осушение	14	Самцы: 25% Самки: 75% 	25340	94	65.4	38	41	40	65	50	65	299
268	Найнтэйлс	https://www.orthrusonline.ru/static/images/p/nextgen/ninetales.png	ninetales	\N	58	1.1	19.9	2	Вспышка пламени   Осушение	14	Самцы: 25% Самки: 75% 	419	39	97	73	76	75	100	81	100	505
269	Джиглипаф	https://www.orthrusonline.ru/static/images/p/nextgen/jigglypuff.png	jigglypuff	\N	77	0.5	5.5	4	Очарование   Состязательность   Защита товарища	7	Самцы: 25% Самки: 75% 	5155	164	88.1	115	45	20	20	45	25	270
270	Виглитаф	https://www.orthrusonline.ru/static/images/p/nextgen/wigglytuff.png	wigglytuff	\N	77	1	12	4	Очарование   Состязательность   Обыскивание	7	Самцы: 25% Самки: 75% 	52	23	99.6	140	70	45	45	85	50	435
271	Зубат	https://www.orthrusonline.ru/static/images/p/nextgen/zubat.png	zubat	\N	122	0.8	7.5	2	Концентрация   Проскальзывание	10	Самцы: 50% Самки: 50% 	55899	359	64	40	45	35	55	30	40	245
272	Голбат	https://www.orthrusonline.ru/static/images/p/nextgen/golbat.png	golbat	\N	122	1.6	55	2	Концентрация   Проскальзывание	10	Самцы: 50% Самки: 50% 	10916	299	70.5	75	80	70	90	65	75	455
273	Оддиш	https://www.orthrusonline.ru/static/images/p/nextgen/oddish.png	oddish	\N	1	0.5	5.4	1	Хлорофилл   Бегство	14	Самцы: 50% Самки: 50% 	24423	229	61.6	45	50	55	30	75	65	320
274	Глум	https://www.orthrusonline.ru/static/images/p/nextgen/gloom.png	gloom	\N	1	0.8	8.6	1	Хлорофилл   Зловоние	14	Самцы: 50% Самки: 50% 	4163	181	83.6	60	65	70	40	85	75	395
275	Вайлплюм	https://www.orthrusonline.ru/static/images/p/nextgen/vileplume.png	vileplume	\N	1	1.2	18.6	1	Хлорофилл   Эффект споры	14	Самцы: 50% Самки: 50% 	265	47	98.1	75	80	85	50	110	90	490
276	Парас	https://www.orthrusonline.ru/static/images/p/nextgen/paras.png	paras	\N	123	0.3	5.4	2	Эффект споры   Сухая кожа   Влажность	14	Самцы: 50% Самки: 50% 	6801	92	79.4	35	70	55	25	45	55	285
277	Парасект	https://www.orthrusonline.ru/static/images/p/nextgen/parasect.png	parasect	\N	123	1	29.5	2	Эффект споры   Сухая кожа   Влажность	14	Самцы: 50% Самки: 50% 	863	29	94.7	60	95	80	30	60	80	405
278	Венонат	https://www.orthrusonline.ru/static/images/p/nextgen/venonat.png	venonat	\N	6	1	30	2	Фасеточность   Тонированные линзы   Бегство	14	Самцы: 50% Самки: 50% 	13010	48	78.3	60	55	50	45	40	55	305
279	Веномот	https://www.orthrusonline.ru/static/images/p/nextgen/venomoth.png	venomoth	\N	6	1.5	12.5	2	Защитная пыльца   Тонированные линзы   Призрачная кожа	14	Самцы: 50% Самки: 50% 	4289	50	85.4	70	65	60	90	90	75	450
280	Диглетт	https://www.orthrusonline.ru/static/images/p/nextgen/diglett.png	diglett	\N	100	0.2	0.8	2	Песчаный покров   Аренная ловушка   Сила песка	14	Самцы: 50% Самки: 50% 	10308	582	81	10	55	25	95	35	45	265
281	Дагтрио	https://www.orthrusonline.ru/static/images/p/nextgen/dugtrio.png	dugtrio	\N	100	0.7	33.3	2	Песчаный покров   Аренная ловушка   Сила песка	14	Самцы: 50% Самки: 50% 	5124	401	79.5	35	100	50	120	50	70	425
282	Мяут	https://www.orthrusonline.ru/static/images/p/nextgen/meowth.png	meowth	\N	17	0.4	4.2	2	Сбор предметов   Техничность   Нервирование	14	Самцы: 50% Самки: 50% 	7576	137	80.6	40	45	35	90	40	40	290
283	Персиан	https://www.orthrusonline.ru/static/images/p/nextgen/persian.png	persian	\N	17	1	32	2	Гибкость   Техничность   Нервирование	14	Самцы: 50% Самки: 50% 	1021	17	94.1	65	70	60	115	65	65	440
284	Псидак	https://www.orthrusonline.ru/static/images/p/nextgen/psyduck.png	psyduck	\N	4	0.8	19.6	2	Влажность   Девятое небо   Быстрое плаванье	14	Самцы: 50% Самки: 50% 	20092	129	68.6	50	52	48	55	65	50	320
285	Голдак	https://www.orthrusonline.ru/static/images/p/nextgen/golduck.png	golduck	\N	4	1.7	76.6	2	Влажность   Девятое небо   Быстрое плаванье	14	Самцы: 50% Самки: 50% 	2266	53	90.4	80	82	78	85	95	80	500
286	Манки	https://www.orthrusonline.ru/static/images/p/nextgen/mankey.png	mankey	\N	20	0.5	28	2	Подъём духа   Прилив гнева   Непокорность	14	Самцы: 50% Самки: 50% 	26679	526	78	40	80	35	70	35	45	305
287	Праймеп	https://www.orthrusonline.ru/static/images/p/nextgen/primeape.png	primeape	\N	20	1	32	2	Подъём духа   Прилив гнева   Непокорность	14	Самцы: 50% Самки: 50% 	8134	216	83	65	105	60	95	60	70	455
288	Гроули	https://www.orthrusonline.ru/static/images/p/nextgen/growlithe.png	growlithe	\N	58	0.7	19	3	Запугивание   Вспышка пламени   Сердце правосудия	14	Самцы: 75% Самки: 25% 	28889	98	37.1	55	70	45	60	70	50	350
289	Арканайн	https://www.orthrusonline.ru/static/images/p/nextgen/arcanine.png	arcanine	\N	58	1.9	155	3	Запугивание   Вспышка пламени   Сердце правосудия	14	Самцы: 75% Самки: 25% 	620	45	95.9	90	110	80	95	100	80	555
290	Поливаг	https://www.orthrusonline.ru/static/images/p/nextgen/poliwag.png	poliwag	\N	4	0.6	12.4	1	Поглощение воды   Влажность   Быстрое плаванье	14	Самцы: 50% Самки: 50% 	10331	33	88.4	40	50	40	90	40	40	300
1020	Космоем	https://www.orthrusonline.ru/static/images/p/nextgen/cosmoem.png	cosmoem	\N	19	0.1	999.9	3	Стойкость	80	Бесполые	1	0	100	43	29	131	37	29	131	400
291	Поливирл	https://www.orthrusonline.ru/static/images/p/nextgen/poliwhirl.png	poliwhirl	\N	4	1	20	1	Поглощение воды   Влажность   Быстрое плаванье	14	Самцы: 50% Самки: 50% 	827	11	96.7	65	65	65	90	50	50	385
292	Поливрат	https://www.orthrusonline.ru/static/images/p/nextgen/poliwrath.png	poliwrath	\N	86	1.3	54	1	Поглощение воды   Влажность   Быстрое плаванье	14	Самцы: 50% Самки: 50% 	188	13	98.8	90	95	95	70	70	90	510
293	Абра	https://www.orthrusonline.ru/static/images/p/nextgen/abra.png	abra	\N	19	0.9	19.5	1	Синхронизация   Концентрация   Волшебный щит	14	Самцы: 75% Самки: 25% 	21198	31	76.7	25	20	15	90	105	55	310
294	Кадабра	https://www.orthrusonline.ru/static/images/p/nextgen/kadabra.png	kadabra	\N	19	1.3	56.5	1	Синхронизация   Концентрация   Волшебный щит	14	Самцы: 75% Самки: 25% 	1840	9	95	40	35	30	105	120	70	400
295	Алаказам	https://www.orthrusonline.ru/static/images/p/nextgen/alakazam.png	alakazam	\N	19	1.5	48	1	Синхронизация   Концентрация   Волшебный щит	14	Самцы: 75% Самки: 25% 	948	17	93.4	55	50	45	120	135	95	500
296	Мачоп	https://www.orthrusonline.ru/static/images/p/nextgen/machop.png	machop	\N	20	0.8	19.5	1	Сила воли   Боец-одиночка   Неукротимость	14	Самцы: 75% Самки: 25% 	15606	40	85.4	70	80	50	35	35	35	305
297	Мачок	https://www.orthrusonline.ru/static/images/p/nextgen/machoke.png	machoke	\N	20	1.5	70.5	1	Сила воли   Боец-одиночка   Неукротимость	14	Самцы: 75% Самки: 25% 	48687	175	81.1	80	100	70	45	50	60	405
298	Мачамп	https://www.orthrusonline.ru/static/images/p/nextgen/machamp.png	machamp	\N	20	1.6	130	1	Сила воли   Боец-одиночка   Неукротимость	14	Самцы: 75% Самки: 25% 	17082	88	86.3	90	130	80	55	65	85	505
299	Белспраут	https://www.orthrusonline.ru/static/images/p/nextgen/bellsprout.png	bellsprout	\N	1	0.7	4	1	Хлорофилл   Прожорливость	14	Самцы: 50% Самки: 50% 	7421	161	80	50	75	35	40	70	30	300
300	Випинбел	https://www.orthrusonline.ru/static/images/p/nextgen/weepinbell.png	weepinbell	\N	1	1	6.4	1	Хлорофилл   Прожорливость	14	Самцы: 50% Самки: 50% 	3227	164	89.1	65	90	50	55	85	45	390
301	Виктрибел	https://www.orthrusonline.ru/static/images/p/nextgen/victreebel.png	victreebel	\N	1	1.7	15.5	1	Хлорофилл   Прожорливость	14	Самцы: 50% Самки: 50% 	361	33	97.6	80	105	65	70	100	70	490
302	Тентакул	https://www.orthrusonline.ru/static/images/p/nextgen/tentacool.png	tentacool	\N	124	0.9	45.5	3	Чистое тело   Жидкая грязь   Омывка дождем	14	Самцы: 50% Самки: 50% 	14117	23	89.6	40	40	35	70	50	100	335
303	Тентакруэль	https://www.orthrusonline.ru/static/images/p/nextgen/tentacruel.png	tentacruel	\N	124	1.6	55	3	Чистое тело   Жидкая грязь   Омывка дождем	14	Самцы: 50% Самки: 50% 	3902	13	92.9	80	70	65	100	80	120	515
304	Джеодуд	https://www.orthrusonline.ru/static/images/p/nextgen/geodude.png	geodude	\N	125	0.4	20	1	Каменная голова   Стойкость   Песчаный покров	10	Самцы: 50% Самки: 50% 	21287	284	66.2	40	80	100	20	30	30	300
305	Гравелер	https://www.orthrusonline.ru/static/images/p/nextgen/graveler.png	graveler	\N	125	1	105	1	Каменная голова   Стойкость   Песчаный покров	10	Самцы: 50% Самки: 50% 	9976	291	80.1	55	95	115	35	45	45	390
306	Голем	https://www.orthrusonline.ru/static/images/p/nextgen/golem.png	golem	\N	125	1.4	300	1	Каменная голова   Стойкость   Песчаный покров	10	Самцы: 50% Самки: 50% 	3457	185	88.9	80	120	130	45	55	65	495
307	Понита	https://www.orthrusonline.ru/static/images/p/nextgen/ponyta.png	ponyta	\N	58	1	30	2	Бегство   Вспышка пламени   Огненное тело	14	Самцы: 50% Самки: 50% 	44961	251	51.4	50	85	55	90	65	65	410
308	Рапидаш	https://www.orthrusonline.ru/static/images/p/nextgen/rapidash.png	rapidash	\N	58	1.7	95	2	Бегство   Вспышка пламени   Огненное тело	14	Самцы: 50% Самки: 50% 	1758	83	92.6	65	100	70	105	80	80	500
309	Слоупок	https://www.orthrusonline.ru/static/images/p/nextgen/slowpoke.png	slowpoke	\N	24	1.2	36	2	Забвение   Собственный темп   Регенерация	14	Самцы: 50% Самки: 50% 	6641	51	93.9	90	65	65	15	40	40	315
310	Слоубро	https://www.orthrusonline.ru/static/images/p/nextgen/slowbro.png	slowbro	\N	24	1.6	78.5	2	Забвение   Собственный темп   Регенерация	14	Самцы: 50% Самки: 50% 	251	25	98.3	95	75	110	30	100	80	490
311	Магнемайт	https://www.orthrusonline.ru/static/images/p/nextgen/magnemite.png	magnemite	\N	126	0.3	6	2	Магнитное притяжение   Стойкость   Анализ	14	Бесполые	10552	124	89.7	25	35	70	45	95	55	325
312	Магнетон	https://www.orthrusonline.ru/static/images/p/nextgen/magneton.png	magneton	\N	126	1	60	2	Магнитное притяжение   Стойкость   Анализ	14	Бесполые	1219	54	94.1	50	60	95	70	120	70	465
313	Фарфечд	https://www.orthrusonline.ru/static/images/p/nextgen/farfetchd.png	farfetchd	\N	7	0.8	15	2	Острый глаз   Концентрация   Непокорность	14	Самцы: 50% Самки: 50% 	7716	270	69.6	52	90	55	60	58	62	377
314	Додо	https://www.orthrusonline.ru/static/images/p/nextgen/doduo.png	doduo	\N	7	1.4	39.2	2	Бегство   Раннее пробуждение   Косолапость	14	Самцы: 50% Самки: 50% 	12343	104	74.8	35	85	45	75	35	35	310
315	Додрио	https://www.orthrusonline.ru/static/images/p/nextgen/dodrio.png	dodrio	\N	7	1.8	85.2	2	Бегство   Раннее пробуждение   Косолапость	14	Самцы: 50% Самки: 50% 	47300	178	87.3	60	110	70	110	60	60	470
316	Сил	https://www.orthrusonline.ru/static/images/p/nextgen/seel.png	seel	\N	4	1.1	90	2	Толстая кожа   Гидрирование   Ледяное тело	14	Самцы: 50% Самки: 50% 	6777	41	89	65	45	55	45	45	70	325
317	Дьюгонг	https://www.orthrusonline.ru/static/images/p/nextgen/dewgong.png	dewgong	\N	35	1.7	120	2	Толстая кожа   Гидрирование   Ледяное тело	14	Самцы: 50% Самки: 50% 	598	22	96.6	90	70	80	70	70	95	475
318	Граймер	https://www.orthrusonline.ru/static/images/p/nextgen/grimer.png	grimer	\N	121	0.9	30	2	Зловоние   Липкий захват   Ядовитое касание	14	Самцы: 50% Самки: 50% 	10459	138	83.7	80	80	50	25	40	50	325
319	Мак	https://www.orthrusonline.ru/static/images/p/nextgen/muk.png	muk	\N	121	1.2	30	2	Зловоние   Липкий захват   Ядовитое касание	14	Самцы: 50% Самки: 50% 	2585	64	91.8	105	105	75	50	65	100	500
320	Шелдер	https://www.orthrusonline.ru/static/images/p/nextgen/shellder.png	shellder	\N	4	0.3	4	3	Панцирь-броня   Развитие навыка   Пыленепроницаемость	14	Самцы: 50% Самки: 50% 	37845	84	80.6	30	65	100	40	45	25	305
321	Клойстер	https://www.orthrusonline.ru/static/images/p/nextgen/cloyster.png	cloyster	\N	35	1.5	132.5	3	Панцирь-броня   Развитие навыка   Пыленепроницаемость	14	Самцы: 50% Самки: 50% 	648	36	96.3	50	95	180	70	85	45	525
322	Гастли	https://www.orthrusonline.ru/static/images/p/nextgen/gastly.png	gastly	\N	26	1.3	0.1	1	Левитация	14	Самцы: 50% Самки: 50% 	46304	229	74.1	30	35	30	80	100	35	310
323	Хонтер	https://www.orthrusonline.ru/static/images/p/nextgen/haunter.png	haunter	\N	26	1.6	0.1	1	Левитация	14	Самцы: 50% Самки: 50% 	15298	113	86.2	45	50	45	95	115	55	405
324	Генгар	https://www.orthrusonline.ru/static/images/p/nextgen/gengar.png	gengar	\N	26	1.5	40.5	1	Проклятое тело	14	Самцы: 50% Самки: 50% 	2545	119	86.1	60	65	60	110	130	75	500
325	Оникс	https://www.orthrusonline.ru/static/images/p/nextgen/onix.png	onix	\N	125	8.8	210	2	Каменная голова   Стойкость   Слабая броня	17	Самцы: 50% Самки: 50% 	23938	156	55.4	35	45	160	70	30	45	385
326	Дроузи	https://www.orthrusonline.ru/static/images/p/nextgen/drowzee.png	drowzee	\N	19	1	32.4	2	Бессонница   Оповещение   Концентрация	14	Самцы: 50% Самки: 50% 	8876	197	81.7	60	48	45	42	43	90	328
327	Гипно	https://www.orthrusonline.ru/static/images/p/nextgen/hypno.png	hypno	\N	19	1.6	75.6	2	Бессонница   Оповещение   Концентрация	14	Самцы: 50% Самки: 50% 	1425	70	93.5	85	73	70	67	73	115	483
328	Крабби	https://www.orthrusonline.ru/static/images/p/nextgen/krabby.png	krabby	\N	4	0.4	6.5	2	Суперсильные когти   Панцирь-броня   Грубая сила	14	Самцы: 50% Самки: 50% 	23772	169	78.7	30	105	90	50	25	25	325
329	Кинглер	https://www.orthrusonline.ru/static/images/p/nextgen/kingler.png	kingler	\N	4	1.3	60	2	Суперсильные когти   Панцирь-броня   Грубая сила	14	Самцы: 50% Самки: 50% 	690	33	95.1	55	130	115	75	50	50	475
330	Волторб	https://www.orthrusonline.ru/static/images/p/nextgen/voltorb.png	voltorb	\N	9	0.5	10.4	2	Звуконепроницаемость   Статическое электричество   Детонация	14	Бесполые	9597	176	81.6	40	30	50	100	55	55	330
331	Электрод	https://www.orthrusonline.ru/static/images/p/nextgen/electrode.png	electrode	\N	9	1.2	66.6	2	Звуконепроницаемость   Статическое электричество   Детонация	14	Бесполые	315	42	97.8	60	50	70	150	80	80	490
332	Экзегут	https://www.orthrusonline.ru/static/images/p/nextgen/exeggcute.png	exeggcute	\N	127	0.4	2.5	3	Хлорофилл   Восстановление урожая	14	Самцы: 50% Самки: 50% 	13458	40	84	60	40	80	40	60	45	325
333	Экзегутор	https://www.orthrusonline.ru/static/images/p/nextgen/exeggutor.png	exeggutor	\N	127	2	120	3	Хлорофилл   Восстановление урожая	14	Самцы: 50% Самки: 50% 	118	6	99.1	95	95	85	55	125	75	530
334	Кубон	https://www.orthrusonline.ru/static/images/p/nextgen/cubone.png	cubone	\N	100	0.4	6.5	2	Каменная голова   Громоотвод   Боевая броня	14	Самцы: 50% Самки: 50% 	13924	163	69.7	50	50	95	35	40	50	320
335	Маровак	https://www.orthrusonline.ru/static/images/p/nextgen/marowak.png	marowak	\N	100	1	45	2	Каменная голова   Громоотвод   Боевая броня	14	Самцы: 50% Самки: 50% 	6314	180	79.3	60	80	110	45	50	80	425
336	Хитмонли	https://www.orthrusonline.ru/static/images/p/nextgen/hitmonlee.png	hitmonlee	\N	20	1.5	49.8	2	Гибкость   Опрометчивость   Освобождение	17	Только самцы	344	5	98.7	50	120	53	87	35	110	455
337	Хитмончан	https://www.orthrusonline.ru/static/images/p/nextgen/hitmonchan.png	hitmonchan	\N	20	1.4	50.2	2	Острый глаз   Железный кулак   Концентрация	17	Только самцы	107	1	99.4	50	105	79	76	35	110	455
338	Ликитунг	https://www.orthrusonline.ru/static/images/p/nextgen/lickitung.png	lickitung	\N	17	1.2	65.5	2	Собственный темп   Забвение   Девятое небо	14	Самцы: 50% Самки: 50% 	1875	4	97.1	90	55	75	30	60	75	385
339	Коффинг	https://www.orthrusonline.ru/static/images/p/nextgen/koffing.png	koffing	\N	121	0.6	1	2	Левитация   Нейтрализующий газ   Зловоние	14	Самцы: 50% Самки: 50% 	13214	138	83.5	40	65	95	35	60	45	340
340	Виззинг	https://www.orthrusonline.ru/static/images/p/nextgen/weezing.png	weezing	\N	121	1.2	9.5	2	Левитация   Нейтрализующий газ   Зловоние	14	Самцы: 50% Самки: 50% 	807	32	95.9	65	90	120	60	85	70	490
341	Райхорн	https://www.orthrusonline.ru/static/images/p/nextgen/rhyhorn.png	rhyhorn	\N	128	1	115	3	Громоотвод   Каменная голова   Опрометчивость	14	Самцы: 50% Самки: 50% 	22771	87	66.9	80	85	95	25	30	30	345
342	Райдон	https://www.orthrusonline.ru/static/images/p/nextgen/rhydon.png	rhydon	\N	128	1.9	120	3	Громоотвод   Каменная голова   Опрометчивость	14	Самцы: 50% Самки: 50% 	1672	24	93.9	105	130	120	40	45	45	485
343	Ченси	https://www.orthrusonline.ru/static/images/p/nextgen/chansey.png	chansey	\N	17	1.1	34.6	4	Естественное исцеление   Небесное благословение   Исцеление	27	Самцы: 12.5% Самки: 87.5% 	5823	17	92.3	250	5	5	50	35	105	450
344	Танжела	https://www.orthrusonline.ru/static/images/p/nextgen/tangela.png	tangela	\N	64	1	35	2	Хлорофилл   Травяной щит   Регенерация	14	Самцы: 50% Самки: 50% 	15743	103	83.4	65	55	115	60	100	40	435
345	Кангасхан	https://www.orthrusonline.ru/static/images/p/nextgen/kangaskhan.png	kangaskhan	\N	17	2.2	80	2	Раннее пробуждение   Дерзость   Концентрация	14	Самцы: 12.5% Самки: 87.5% 	13014	52	72.9	105	95	80	90	40	80	490
346	Хорси	https://www.orthrusonline.ru/static/images/p/nextgen/horsea.png	horsea	\N	4	0.4	8	2	Быстрое плаванье   Снайпер   Влажность	14	Самцы: 50% Самки: 50% 	10924	19	93.6	30	40	70	60	70	25	295
347	Сидра	https://www.orthrusonline.ru/static/images/p/nextgen/seadra.png	seadra	\N	4	1.2	25	2	Ядовитые колючки   Снайпер   Влажность	14	Самцы: 50% Самки: 50% 	611	10	97.6	55	65	95	85	95	45	440
348	Голдин	https://www.orthrusonline.ru/static/images/p/nextgen/goldeen.png	goldeen	\N	4	0.6	15	2	Быстрое плаванье   Водяные покровы   Громоотвод	14	Самцы: 50% Самки: 50% 	4411	123	89.2	45	67	60	63	35	50	320
349	Сикинг	https://www.orthrusonline.ru/static/images/p/nextgen/seaking.png	seaking	\N	4	1.3	39	2	Быстрое плаванье   Водяные покровы   Громоотвод	14	Самцы: 50% Самки: 50% 	326	25	98	80	92	65	68	65	80	450
350	Старью	https://www.orthrusonline.ru/static/images/p/nextgen/staryu.png	staryu	\N	4	0.8	34.5	3	Свечение   Естественное исцеление   Анализ	14	Бесполые	13089	35	85	30	45	55	85	70	55	340
351	Старми	https://www.orthrusonline.ru/static/images/p/nextgen/starmie.png	starmie	\N	24	1.1	80	3	Свечение   Естественное исцеление   Анализ	14	Бесполые	337	27	97.5	60	75	85	115	100	85	520
352	Мистер Майм	https://www.orthrusonline.ru/static/images/p/nextgen/mrmime.png	mrmime	\N	22	1.3	54.5	2	Звуконепроницаемость   Фильтрация   Техничность	17	Самцы: 50% Самки: 50% 	3130	29	92.8	40	45	65	90	100	120	460
353	Сайтер	https://www.orthrusonline.ru/static/images/p/nextgen/scyther.png	scyther	\N	5	1.5	56	2	Роение   Техничность   Неукротимость	17	Самцы: 50% Самки: 50% 	19443	33	80	70	110	80	105	55	80	500
354	Джинкс	https://www.orthrusonline.ru/static/images/p/nextgen/jynx.png	jynx	\N	31	1.4	40.6	2	Забвение   Оповещение   Сухая кожа	17	Только самки	1626	55	95.1	65	50	35	95	115	95	455
355	Электабаз	https://www.orthrusonline.ru/static/images/p/nextgen/electabuzz.png	electabuzz	\N	9	1.1	30	2	Статическое электричество   Подъём духа	17	Самцы: 75% Самки: 25% 	480	0	98.3	65	83	57	105	95	85	490
356	Магмар	https://www.orthrusonline.ru/static/images/p/nextgen/magmar.png	magmar	\N	58	1.3	44.5	2	Огненное тело   Подъём духа	17	Самцы: 75% Самки: 25% 	404	2	98.7	65	95	57	93	100	85	495
357	Пинсир	https://www.orthrusonline.ru/static/images/p/nextgen/pinsir.png	pinsir	\N	120	1.5	55	3	Суперсильные когти   Разрыв шаблона   Ловкость	17	Самцы: 50% Самки: 50% 	23061	103	76.7	65	125	100	85	55	70	500
358	Торос	https://www.orthrusonline.ru/static/images/p/nextgen/tauros.png	tauros	\N	17	1.4	88.4	3	Запугивание   Прилив гнева   Грубая сила	14	Только самцы	10857	24	75.1	75	100	95	110	40	70	490
359	Мэджикарп	https://www.orthrusonline.ru/static/images/p/nextgen/magikarp.png	magikarp	\N	4	0.9	10	3	Быстрое плаванье   Нервозность	4	Самцы: 50% Самки: 50% 	75252	207	68.9	20	10	55	80	15	20	200
360	Гаярдос	https://www.orthrusonline.ru/static/images/p/nextgen/gyarados.png	gyarados	\N	129	6.5	235	3	Запугивание   Ловкость	4	Самцы: 50% Самки: 50% 	5480	179	83.3	95	125	79	81	60	100	540
361	Лапрас	https://www.orthrusonline.ru/static/images/p/nextgen/lapras.png	lapras	\N	35	2.5	220	3	Поглощение воды   Панцирь-броня   Гидрирование	27	Самцы: 50% Самки: 50% 	6907	27	91.4	130	85	80	60	85	95	535
362	Дитто	https://www.orthrusonline.ru/static/images/p/nextgen/ditto.png	ditto	\N	17	0.3	4	2	Гибкость   Самозванец	14	Бесполые	10101	152	92.4	48	48	48	48	48	48	288
363	Иви	https://www.orthrusonline.ru/static/images/p/nextgen/eevee.png	eevee	\N	17	0.3	6.5	2	Бегство   Адаптация   Предвидение	24	Самцы: 87.5% Самки: 12.5% 	5972	20	93.8	55	55	50	55	45	65	325
364	Вапореон	https://www.orthrusonline.ru/static/images/p/nextgen/vaporeon.png	vaporeon	\N	4	1	29	2	Поглощение воды   Гидрирование	24	Самцы: 87.5% Самки: 12.5% 	168	14	98.8	130	65	60	65	110	95	525
365	Джолтеон	https://www.orthrusonline.ru/static/images/p/nextgen/jolteon.png	jolteon	\N	9	0.8	24.5	2	Поглощение электричества   Быстрые ноги	24	Самцы: 87.5% Самки: 12.5% 	210	10	98.4	65	65	60	130	110	95	525
366	Флареон	https://www.orthrusonline.ru/static/images/p/nextgen/flareon.png	flareon	\N	58	0.9	25	2	Вспышка пламени   Сила воли	24	Самцы: 87.5% Самки: 12.5% 	176	11	98.6	65	130	60	65	95	110	525
367	Поригон	https://www.orthrusonline.ru/static/images/p/nextgen/porygon.png	porygon	\N	17	0.8	36.5	2	Слежка   Загрузка   Анализ	14	Бесполые	1706	688	96.6	65	60	70	40	85	75	395
368	Оманайт	https://www.orthrusonline.ru/static/images/p/nextgen/omanyte.png	omanyte	\N	130	0.4	7.5	2	Быстрое плаванье   Панцирь-броня   Слабая броня	20	Самцы: 87.5% Самки: 12.5% 	4761	18	94.9	35	40	100	35	90	55	355
369	Омастар	https://www.orthrusonline.ru/static/images/p/nextgen/omastar.png	omastar	\N	130	1	35	2	Быстрое плаванье   Панцирь-броня   Слабая броня	20	Самцы: 87.5% Самки: 12.5% 	108	7	99.1	70	60	125	55	115	70	495
370	Кабуто	https://www.orthrusonline.ru/static/images/p/nextgen/kabuto.png	kabuto	\N	130	0.5	11.5	2	Быстрое плаванье   Боевая броня   Слабая броня	20	Самцы: 87.5% Самки: 12.5% 	1640	3	97.1	30	80	90	55	55	45	355
371	Кабутопс	https://www.orthrusonline.ru/static/images/p/nextgen/kabutops.png	kabutops	\N	130	1.3	40.5	2	Быстрое плаванье   Боевая броня   Слабая броня	20	Самцы: 87.5% Самки: 12.5% 	62	6	99.5	60	115	105	80	65	70	495
372	Аэродактиль	https://www.orthrusonline.ru/static/images/p/nextgen/aerodactyl.png	aerodactyl	\N	36	1.8	59	3	Каменная голова   Давление   Нервирование	24	Самцы: 87.5% Самки: 12.5% 	189	37	99.1	80	105	65	130	60	75	515
373	Снорлакс	https://www.orthrusonline.ru/static/images/p/nextgen/snorlax.png	snorlax	\N	17	2.1	460	3	Иммунитет   Толстая кожа   Прожорливость	27	Самцы: 87.5% Самки: 12.5% 	311	55	98.1	160	110	65	30	65	110	540
374	Артикуно	https://www.orthrusonline.ru/static/images/p/nextgen/articuno.png	articuno	\N	131	1.7	55.4	3	Давление   Снежные покровы	54	Бесполые	70	10	99.6	90	85	100	85	95	125	580
375	Запдос	https://www.orthrusonline.ru/static/images/p/nextgen/zapdos.png	zapdos	\N	69	1.6	52.6	3	Давление   Статическое электричество	54	Бесполые	76	9	99.6	90	90	85	100	125	90	580
376	Молтрес	https://www.orthrusonline.ru/static/images/p/nextgen/moltres.png	moltres	\N	2	2	60	3	Давление   Огненное тело	54	Бесполые	71	9	99.6	90	100	90	90	125	85	580
377	Дратини	https://www.orthrusonline.ru/static/images/p/nextgen/dratini.png	dratini	\N	132	1.8	3.3	3	Сбрасывание кожи   Чудесная чешуя	27	Самцы: 50% Самки: 50% 	1418	272	97.1	41	64	45	50	50	50	300
378	Драгонайр	https://www.orthrusonline.ru/static/images/p/nextgen/dragonair.png	dragonair	\N	132	4	16.5	3	Сбрасывание кожи   Чудесная чешуя	27	Самцы: 50% Самки: 50% 	1052	21	96.9	61	84	65	70	70	70	420
379	Драгонайт	https://www.orthrusonline.ru/static/images/p/nextgen/dragonite.png	dragonite	\N	59	2.2	210	3	Концентрация   Мульти-чешуя	27	Самцы: 50% Самки: 50% 	452	74	96.8	91	134	95	80	100	100	600
380	Мьюту	https://www.orthrusonline.ru/static/images/p/nextgen/mewtwo.png	mewtwo	\N	19	2	122	3	Давление   Нервирование	80	Бесполые	47	14	99.6	106	110	90	130	154	90	680
381	Мью	https://www.orthrusonline.ru/static/images/p/nextgen/mew.png	mew	\N	19	0.4	4	1	Синхронизация	80	Бесполые	101	44	99.2	100	100	100	100	100	100	600
382	Чикорита	https://www.orthrusonline.ru/static/images/p/nextgen/chikorita.png	chikorita	\N	64	0.9	6.4	1	Сверхрост   Травяной щит	14	Самцы: 87.5% Самки: 12.5% 	719	72	96.6	45	49	65	45	49	65	318
383	Бэйлиф	https://www.orthrusonline.ru/static/images/p/nextgen/bayleef.png	bayleef	\N	64	1.2	15.8	1	Сверхрост   Травяной щит	14	Самцы: 87.5% Самки: 12.5% 	213	5	98.2	60	62	80	60	63	80	405
384	Меганиум	https://www.orthrusonline.ru/static/images/p/nextgen/meganium.png	meganium	\N	64	1.8	100.5	1	Сверхрост   Травяной щит	14	Самцы: 87.5% Самки: 12.5% 	228	30	98.1	80	82	100	80	83	100	525
385	Синдаквил	https://www.orthrusonline.ru/static/images/p/nextgen/cyndaquil.png	cyndaquil	\N	58	0.5	7.9	1	Яростное пламя   Вспышка пламени	14	Самцы: 87.5% Самки: 12.5% 	941	315	96.6	39	52	43	65	60	50	309
386	Квилава	https://www.orthrusonline.ru/static/images/p/nextgen/quilava.png	quilava	\N	58	0.9	19	1	Яростное пламя   Вспышка пламени	14	Самцы: 87.5% Самки: 12.5% 	581	17	95.2	58	64	58	80	80	65	405
387	Тайфложн	https://www.orthrusonline.ru/static/images/p/nextgen/typhlosion.png	typhlosion	\N	58	1.7	79.5	1	Яростное пламя   Вспышка пламени	14	Самцы: 87.5% Самки: 12.5% 	365	47	97	78	84	78	100	109	85	534
388	Тотодайл	https://www.orthrusonline.ru/static/images/p/nextgen/totodile.png	totodile	\N	4	0.6	9.5	1	Всплеск   Грубая сила	14	Самцы: 87.5% Самки: 12.5% 	2505	368	94.7	50	65	64	43	44	48	314
389	Кроконав	https://www.orthrusonline.ru/static/images/p/nextgen/croconaw.png	croconaw	\N	4	1.1	25	1	Всплеск   Грубая сила	14	Самцы: 87.5% Самки: 12.5% 	214	14	98.2	65	80	80	58	59	63	405
390	Фералигатр	https://www.orthrusonline.ru/static/images/p/nextgen/feraligatr.png	feraligatr	\N	4	2.3	88.8	1	Всплеск   Грубая сила	14	Самцы: 87.5% Самки: 12.5% 	399	48	96.8	85	105	100	78	79	83	530
391	Сентрет	https://www.orthrusonline.ru/static/images/p/nextgen/sentret.png	sentret	\N	17	0.8	6	2	Бегство   Острый глаз   Обыскивание	10	Самцы: 50% Самки: 50% 	3459	168	93.4	35	46	34	20	35	45	215
1075	Краморант	https://www.orthrusonline.ru/static/images/p/nextgen/cramorant.png	cramorant	\N	101	0.8	18	2	Глоток снаряда	14	Бесполые	1229	21	97.9	70	85	55	85	85	95	475
392	Фуррет	https://www.orthrusonline.ru/static/images/p/nextgen/furret.png	furret	\N	17	1.8	32.5	2	Бегство   Острый глаз   Обыскивание	10	Самцы: 50% Самки: 50% 	5767	487	77.7	85	76	64	90	45	55	415
393	Хут-хут	https://www.orthrusonline.ru/static/images/p/nextgen/hoothoot.png	hoothoot	\N	7	0.7	21.2	2	Бессонница   Острый глаз   Тонированные линзы	10	Самцы: 50% Самки: 50% 	5117	113	89.6	60	30	30	50	36	56	262
394	Ноктаул	https://www.orthrusonline.ru/static/images/p/nextgen/noctowl.png	noctowl	\N	7	1.6	40.8	2	Бессонница   Острый глаз   Тонированные линзы	10	Самцы: 50% Самки: 50% 	2509	71	93.2	100	50	50	70	86	96	452
395	Ледиба	https://www.orthrusonline.ru/static/images/p/nextgen/ledyba.png	ledyba	\N	5	1	10.8	4	Роение   Раннее пробуждение   Нервозность	10	Самцы: 50% Самки: 50% 	4694	219	84	40	20	30	55	40	80	265
396	Ледиан	https://www.orthrusonline.ru/static/images/p/nextgen/ledian.png	ledian	\N	5	1.4	35.6	4	Роение   Раннее пробуждение   Железный кулак	10	Самцы: 50% Самки: 50% 	4171	129	85.1	55	35	50	85	55	110	390
397	Спинарак	https://www.orthrusonline.ru/static/images/p/nextgen/spinarak.png	spinarak	\N	6	0.5	8.5	4	Роение   Бессонница   Снайпер	10	Самцы: 50% Самки: 50% 	53051	83	0	40	60	40	30	40	40	250
398	Ариадос	https://www.orthrusonline.ru/static/images/p/nextgen/ariados.png	ariados	\N	6	1.1	33.5	4	Роение   Бессонница   Снайпер	10	Самцы: 50% Самки: 50% 	3584	92	85.1	70	90	70	40	60	70	400
399	Кробат	https://www.orthrusonline.ru/static/images/p/nextgen/crobat.png	crobat	\N	122	1.8	75	2	Концентрация   Проскальзывание	10	Самцы: 50% Самки: 50% 	966	60	93.7	85	90	80	130	70	80	535
400	Чинчоу	https://www.orthrusonline.ru/static/images/p/nextgen/chinchou.png	chinchou	\N	133	0.5	12	3	Поглощение электричества   Свечение   Поглощение воды	14	Самцы: 50% Самки: 50% 	6963	11	93.9	75	38	38	67	56	56	330
401	Лантурн	https://www.orthrusonline.ru/static/images/p/nextgen/lanturn.png	lanturn	\N	133	1.2	22.5	3	Поглощение электричества   Свечение   Поглощение воды	14	Самцы: 50% Самки: 50% 	1172	10	96.1	125	58	58	67	76	76	460
402	Пичу	https://www.orthrusonline.ru/static/images/p/nextgen/pichu.png	pichu	\N	9	0.3	2	2	Статическое электричество   Громоотвод	7	Самцы: 50% Самки: 50% 	3870	9	89.4	20	40	15	60	35	35	205
403	Клеффа	https://www.orthrusonline.ru/static/images/p/nextgen/cleffa.png	cleffa	\N	105	0.3	3	4	Очарование   Волшебный щит   Защита товарища	7	Самцы: 25% Самки: 75% 	3425	58	92.1	50	25	28	15	45	55	218
404	Иглибаф	https://www.orthrusonline.ru/static/images/p/nextgen/igglybuff.png	igglybuff	\N	77	0.3	1	4	Очарование   Состязательность   Защита товарища	7	Самцы: 25% Самки: 75% 	1692	63	93.3	90	30	15	15	40	20	210
405	Тогепи	https://www.orthrusonline.ru/static/images/p/nextgen/togepi.png	togepi	\N	105	0.3	1.5	4	Энергичность   Небесное благословение   Сверхудачливость	7	Самцы: 87.5% Самки: 12.5% 	182	4	98.9	35	20	65	20	40	65	245
406	Тогетик	https://www.orthrusonline.ru/static/images/p/nextgen/togetic.png	togetic	\N	116	0.6	3.2	4	Энергичность   Небесное благословение   Сверхудачливость	7	Самцы: 87.5% Самки: 12.5% 	93	0	99.6	55	40	85	40	80	105	405
407	Нату	https://www.orthrusonline.ru/static/images/p/nextgen/natu.png	natu	\N	37	0.2	2	2	Синхронизация   Раннее пробуждение   Волшебное зеркало	14	Самцы: 50% Самки: 50% 	2268	11	96	40	50	45	70	70	45	320
408	Ксату	https://www.orthrusonline.ru/static/images/p/nextgen/xatu.png	xatu	\N	37	1.5	15	2	Синхронизация   Раннее пробуждение   Волшебное зеркало	14	Самцы: 50% Самки: 50% 	2732	28	95	65	75	70	95	95	70	470
409	Марип	https://www.orthrusonline.ru/static/images/p/nextgen/mareep.png	mareep	\N	9	0.6	7.8	1	Статическое электричество   Плюс	14	Самцы: 50% Самки: 50% 	12013	97	84.5	55	40	40	35	65	45	280
410	Флафи	https://www.orthrusonline.ru/static/images/p/nextgen/flaaffy.png	flaaffy	\N	9	0.8	13.3	1	Статическое электричество   Плюс	14	Самцы: 50% Самки: 50% 	2093	5	94.1	70	55	55	45	80	60	365
411	Амфарос	https://www.orthrusonline.ru/static/images/p/nextgen/ampharos.png	ampharos	\N	9	1.4	61.5	1	Статическое электричество   Плюс	14	Самцы: 50% Самки: 50% 	730	9	96.2	90	75	85	55	115	90	510
412	Белоссом	https://www.orthrusonline.ru/static/images/p/nextgen/bellossom.png	bellossom	\N	64	0.4	5.8	1	Хлорофилл   Исцеление	14	Самцы: 50% Самки: 50% 	1005	69	96.5	75	80	95	50	90	100	490
413	Мэрил	https://www.orthrusonline.ru/static/images/p/nextgen/marill.png	marill	\N	134	0.4	8.5	4	Толстая кожа   Большая сила   Поглотитель соков	7	Самцы: 50% Самки: 50% 	9207	124	76.2	70	20	50	40	20	50	250
414	Азумэрил	https://www.orthrusonline.ru/static/images/p/nextgen/azumarill.png	azumarill	\N	134	0.8	28.5	4	Толстая кожа   Большая сила   Поглотитель соков	7	Самцы: 50% Самки: 50% 	2103	79	89.2	100	50	80	50	60	80	420
415	Судовудо	https://www.orthrusonline.ru/static/images/p/nextgen/sudowoodo.png	sudowoodo	\N	93	1.2	38	2	Стойкость   Каменная голова   Нервозность	14	Самцы: 50% Самки: 50% 	2929	8	89.9	70	100	115	30	30	65	410
416	Политод	https://www.orthrusonline.ru/static/images/p/nextgen/politoed.png	politoed	\N	4	1.1	33.9	1	Поглощение воды   Влажность   Изморось	14	Самцы: 50% Самки: 50% 	862	58	96.7	90	75	75	70	90	100	500
417	Хоппип	https://www.orthrusonline.ru/static/images/p/nextgen/hoppip.png	hoppip	\N	76	0.4	0.5	1	Хлорофилл   Травяной щит   Проскальзывание	14	Самцы: 50% Самки: 50% 	7815	64	85.3	35	35	40	50	35	55	250
418	Скиплум	https://www.orthrusonline.ru/static/images/p/nextgen/skiploom.png	skiploom	\N	76	0.6	1	1	Хлорофилл   Травяной щит   Проскальзывание	14	Самцы: 50% Самки: 50% 	7630	429	79.8	55	45	50	80	45	65	340
419	Джамплафф	https://www.orthrusonline.ru/static/images/p/nextgen/jumpluff.png	jumpluff	\N	76	0.8	3	1	Хлорофилл   Травяной щит   Проскальзывание	14	Самцы: 50% Самки: 50% 	15575	140	87.3	75	55	70	110	55	95	460
420	Айпом	https://www.orthrusonline.ru/static/images/p/nextgen/aipom.png	aipom	\N	17	0.8	11.5	4	Бегство   Сбор предметов   Развитие навыка	14	Самцы: 50% Самки: 50% 	7836	81	86.6	55	70	55	85	40	55	360
421	Санкерн	https://www.orthrusonline.ru/static/images/p/nextgen/sunkern.png	sunkern	\N	64	0.3	1.8	1	Хлорофилл   Солнечная сила   Раннее пробуждение	14	Самцы: 50% Самки: 50% 	3918	142	88.1	30	30	30	30	30	30	180
422	Санфлора	https://www.orthrusonline.ru/static/images/p/nextgen/sunflora.png	sunflora	\N	64	0.8	8.5	1	Хлорофилл   Солнечная сила   Раннее пробуждение	14	Самцы: 50% Самки: 50% 	22774	117	79.5	75	75	55	30	105	85	425
423	Янма	https://www.orthrusonline.ru/static/images/p/nextgen/yanma.png	yanma	\N	5	1.2	38	2	Ускорение   Фасеточность   Обыскивание	14	Самцы: 50% Самки: 50% 	13472	96	79	65	65	45	95	75	45	390
424	Вупер	https://www.orthrusonline.ru/static/images/p/nextgen/wooper.png	wooper	\N	52	0.4	8.5	2	Влажность   Поглощение воды   Безразличие	14	Самцы: 50% Самки: 50% 	55384	236	63.2	55	45	45	15	25	25	210
425	Квагсайр	https://www.orthrusonline.ru/static/images/p/nextgen/quagsire.png	quagsire	\N	52	1.4	75	2	Влажность   Поглощение воды   Безразличие	14	Самцы: 50% Самки: 50% 	1862	51	92.5	95	85	85	35	65	65	430
426	Эспеон	https://www.orthrusonline.ru/static/images/p/nextgen/espeon.png	espeon	\N	19	0.9	26.5	2	Синхронизация   Волшебное зеркало	24	Самцы: 87.5% Самки: 12.5% 	258	26	98.2	65	65	60	110	130	95	525
427	Умбреон	https://www.orthrusonline.ru/static/images/p/nextgen/umbreon.png	umbreon	\N	15	1	27	2	Синхронизация   Концентрация	24	Самцы: 87.5% Самки: 12.5% 	327	50	97.6	95	65	110	65	60	130	525
428	Муркроу	https://www.orthrusonline.ru/static/images/p/nextgen/murkrow.png	murkrow	\N	39	0.5	2.1	1	Бессонница   Сверхудачливость   Проказник	14	Самцы: 50% Самки: 50% 	12249	81	82.7	60	85	42	91	85	42	405
429	Слоукинг	https://www.orthrusonline.ru/static/images/p/nextgen/slowking.png	slowking	\N	24	2	79.5	2	Забвение   Собственный темп   Регенерация	14	Самцы: 50% Самки: 50% 	246	18	98.6	95	75	80	30	100	110	490
430	Мисдривус	https://www.orthrusonline.ru/static/images/p/nextgen/misdreavus.png	misdreavus	\N	48	0.7	1	4	Левитация	17	Самцы: 50% Самки: 50% 	7597	30	88.1	60	60	60	85	85	85	435
431	Анноун	https://www.orthrusonline.ru/static/images/p/nextgen/unown.png	unown	\N	19	0.5	5	2	Левитация	27	Бесполые	153920	86	89	48	72	48	48	72	48	336
432	Ваббафет	https://www.orthrusonline.ru/static/images/p/nextgen/wobbuffet.png	wobbuffet	\N	19	1.3	28.5	2	Тёмная метка   Телепатия	14	Самцы: 50% Самки: 50% 	7124	67	81	190	33	58	33	33	58	405
433	Жирафариг	https://www.orthrusonline.ru/static/images/p/nextgen/girafarig.png	girafarig	\N	135	1.5	41.5	2	Концентрация   Раннее пробуждение   Поглотитель соков	14	Самцы: 50% Самки: 50% 	5021	61	87.9	70	80	65	85	90	65	455
434	Пинеко	https://www.orthrusonline.ru/static/images/p/nextgen/pineco.png	pineco	\N	120	0.6	7.2	2	Стойкость   Пыленепроницаемость	14	Самцы: 50% Самки: 50% 	18743	49	20.2	50	65	90	15	35	35	290
435	Форетресс	https://www.orthrusonline.ru/static/images/p/nextgen/forretress.png	forretress	\N	45	1.2	125.8	2	Стойкость   Пыленепроницаемость	14	Самцы: 50% Самки: 50% 	739	13	94.3	75	90	140	40	60	60	465
436	Данспарс	https://www.orthrusonline.ru/static/images/p/nextgen/dunsparce.png	dunsparce	\N	17	1.5	14	2	Небесное благословение   Бегство   Нервозность	14	Самцы: 50% Самки: 50% 	6557	38	81.8	100	70	70	45	65	65	415
437	Глайгер	https://www.orthrusonline.ru/static/images/p/nextgen/gligar.png	gligar	\N	84	1.1	64.8	1	Суперсильные когти   Песчаный покров   Иммунитет	14	Самцы: 50% Самки: 50% 	14915	16	87.3	65	75	105	85	35	65	430
438	Стиликс	https://www.orthrusonline.ru/static/images/p/nextgen/steelix.png	steelix	\N	43	9.2	400	2	Каменная голова   Стойкость   Грубая сила	17	Самцы: 50% Самки: 50% 	307	32	97.9	75	85	200	30	55	65	510
439	Снаббул	https://www.orthrusonline.ru/static/images/p/nextgen/snubbull.png	snubbull	\N	105	0.6	7.8	4	Запугивание   Бегство   Нервозность	14	Самцы: 25% Самки: 75% 	5684	63	90.2	60	80	50	30	40	40	300
440	Гранбул	https://www.orthrusonline.ru/static/images/p/nextgen/granbull.png	granbull	\N	105	1.4	48.7	4	Запугивание   Быстрые ноги   Нервозность	14	Самцы: 25% Самки: 75% 	2022	52	92.9	90	120	75	45	60	60	450
441	Квилфиш	https://www.orthrusonline.ru/static/images/p/nextgen/qwilfish.png	qwilfish	\N	124	0.5	3.9	2	Ядовитые колючки   Быстрое плаванье   Запугивание	14	Самцы: 50% Самки: 50% 	2525	17	95.3	65	95	85	85	55	55	440
442	Сизор	https://www.orthrusonline.ru/static/images/p/nextgen/scizor.png	scizor	\N	45	1.8	118	2	Роение   Техничность   Снижение веса	17	Самцы: 50% Самки: 50% 	357	34	97.5	70	130	100	65	55	80	500
443	Шакл	https://www.orthrusonline.ru/static/images/p/nextgen/shuckle.png	shuckle	\N	136	0.6	20.5	1	Стойкость   Прожорливость   Порочность	14	Самцы: 50% Самки: 50% 	7326	14	87.9	20	10	230	5	10	230	505
444	Геракросс	https://www.orthrusonline.ru/static/images/p/nextgen/heracross.png	heracross	\N	46	1.5	54	3	Роение   Сила воли   Ловкость	17	Самцы: 50% Самки: 50% 	7160	30	87.1	80	125	75	85	40	95	500
445	Снизл	https://www.orthrusonline.ru/static/images/p/nextgen/sneasel.png	sneasel	\N	137	0.9	28	1	Концентрация   Острый глаз   Карманный вор	14	Самцы: 50% Самки: 50% 	38476	522	67.8	55	95	55	115	35	75	430
446	Теддиурса	https://www.orthrusonline.ru/static/images/p/nextgen/teddiursa.png	teddiursa	\N	17	0.6	8.8	2	Сбор предметов   Быстрые ноги   Сбор мёда	14	Самцы: 50% Самки: 50% 	7074	752	90	60	80	50	40	50	50	330
447	Урсаринг	https://www.orthrusonline.ru/static/images/p/nextgen/ursaring.png	ursaring	\N	17	1.8	125.8	2	Сила воли   Быстрые ноги   Нервирование	14	Самцы: 50% Самки: 50% 	8391	89	81.5	90	130	75	55	75	75	500
448	Слагма	https://www.orthrusonline.ru/static/images/p/nextgen/slugma.png	slugma	\N	58	0.7	35	2	Магмовая броня   Огненное тело   Слабая броня	14	Самцы: 50% Самки: 50% 	3626	27	96.4	40	40	40	20	70	40	250
449	Магкарго	https://www.orthrusonline.ru/static/images/p/nextgen/magcargo.png	magcargo	\N	18	0.8	55	2	Магмовая броня   Огненное тело   Слабая броня	14	Самцы: 50% Самки: 50% 	3561	45	92.4	60	50	120	30	90	80	430
450	Свайнуб	https://www.orthrusonline.ru/static/images/p/nextgen/swinub.png	swinub	\N	138	0.4	6.5	3	Забвение   Снежные покровы   Толстая кожа	14	Самцы: 50% Самки: 50% 	16112	113	83.9	50	50	40	50	30	30	250
451	Пилосвайн	https://www.orthrusonline.ru/static/images/p/nextgen/piloswine.png	piloswine	\N	138	1.1	55.8	3	Забвение   Снежные покровы   Толстая кожа	14	Самцы: 50% Самки: 50% 	6581	60	85.2	100	100	80	50	60	60	450
452	Корсола	https://www.orthrusonline.ru/static/images/p/nextgen/corsola.png	corsola	\N	98	0.6	5	4	Энергичность   Естественное исцеление   Регенерация	14	Самцы: 25% Самки: 75% 	7545	264	85	65	55	95	35	65	95	410
453	Реморэйд	https://www.orthrusonline.ru/static/images/p/nextgen/remoraid.png	remoraid	\N	4	0.6	12	2	Энергичность   Снайпер   Переменчивое настроение	14	Самцы: 50% Самки: 50% 	5394	108	92.2	35	65	35	65	65	35	300
454	Октилери	https://www.orthrusonline.ru/static/images/p/nextgen/octillery.png	octillery	\N	4	0.9	28.5	2	Присоски   Снайпер   Переменчивое настроение	14	Самцы: 50% Самки: 50% 	2591	38	93.7	75	105	75	45	105	75	480
455	Делибёрд	https://www.orthrusonline.ru/static/images/p/nextgen/delibird.png	delibird	\N	131	0.9	16	4	Подъём духа   Энергичность   Бессонница	14	Самцы: 50% Самки: 50% 	2860	210	90	45	55	45	75	65	45	330
456	Мантин	https://www.orthrusonline.ru/static/images/p/nextgen/mantine.png	mantine	\N	129	2.1	220	3	Быстрое плаванье   Поглощение воды   Водяные покровы	17	Самцы: 50% Самки: 50% 	3260	16	95.4	85	40	70	70	80	140	485
457	Скармори	https://www.orthrusonline.ru/static/images/p/nextgen/skarmory.png	skarmory	\N	139	1.7	50.5	3	Острый глаз   Стойкость   Слабая броня	17	Самцы: 50% Самки: 50% 	1220	367	96.9	65	80	140	70	40	70	465
458	Хондаур	https://www.orthrusonline.ru/static/images/p/nextgen/houndour.png	houndour	\N	49	0.6	10.8	3	Раннее пробуждение   Вспышка пламени   Нервирование	14	Самцы: 50% Самки: 50% 	734	2	96.6	45	60	30	65	80	50	330
459	Хондум	https://www.orthrusonline.ru/static/images/p/nextgen/houndoom.png	houndoom	\N	49	1.4	35	3	Раннее пробуждение   Вспышка пламени   Нервирование	14	Самцы: 50% Самки: 50% 	225	11	98.3	75	90	50	95	110	80	500
460	Кингдра	https://www.orthrusonline.ru/static/images/p/nextgen/kingdra.png	kingdra	\N	74	1.8	152	2	Быстрое плаванье   Снайпер   Влажность	14	Самцы: 50% Самки: 50% 	124	11	99	75	95	95	85	95	95	540
461	Фанпи	https://www.orthrusonline.ru/static/images/p/nextgen/phanpy.png	phanpy	\N	100	0.5	33.5	2	Сбор предметов   Песчаный покров	14	Самцы: 50% Самки: 50% 	6965	34	83.3	90	60	60	40	40	40	330
462	Донфан	https://www.orthrusonline.ru/static/images/p/nextgen/donphan.png	donphan	\N	100	1.1	120	2	Стойкость   Песчаный покров	14	Самцы: 50% Самки: 50% 	3816	49	90	90	120	120	50	60	60	500
463	Поригон2	https://www.orthrusonline.ru/static/images/p/nextgen/porygon2.png	porygon2	\N	17	0.6	32.5	2	Слежка   Загрузка   Анализ	14	Бесполые	194	71	98.9	85	80	90	60	105	95	515
464	Стантлер	https://www.orthrusonline.ru/static/images/p/nextgen/stantler.png	stantler	\N	17	1.4	71.2	3	Запугивание   Обыскивание   Поглотитель соков	14	Самцы: 50% Самки: 50% 	9823	135	80.2	73	95	62	85	85	65	465
465	Смиргл	https://www.orthrusonline.ru/static/images/p/nextgen/smeargle.png	smeargle	\N	17	1.2	58	4	Собственный темп   Техничность   Переменчивое настроение	14	Самцы: 50% Самки: 50% 	1501	93	96.1	55	20	35	75	20	45	250
466	Тирог	https://www.orthrusonline.ru/static/images/p/nextgen/tyrogue.png	tyrogue	\N	20	0.7	21	2	Сила воли   Неукротимость   Подъём духа	17	Только самцы	73	2	99.5	35	35	35	35	35	35	210
467	Хитмонтоп	https://www.orthrusonline.ru/static/images/p/nextgen/hitmontop.png	hitmontop	\N	20	1.4	48	2	Запугивание   Техничность   Неукротимость	17	Только самцы	114	3	99.4	50	95	95	70	35	110	455
468	Смучам	https://www.orthrusonline.ru/static/images/p/nextgen/smoochum.png	smoochum	\N	31	0.4	6	2	Забвение   Оповещение   Гидрирование	17	Только самки	1131	112	95.9	45	30	15	65	85	65	305
469	Элекид	https://www.orthrusonline.ru/static/images/p/nextgen/elekid.png	elekid	\N	9	0.6	23.5	2	Статическое электричество   Подъём духа	17	Самцы: 75% Самки: 25% 	206	7	98.9	45	63	37	95	65	55	360
470	Магби	https://www.orthrusonline.ru/static/images/p/nextgen/magby.png	magby	\N	58	0.7	21.4	2	Огненное тело   Подъём духа	17	Самцы: 75% Самки: 25% 	213	7	98.8	45	75	37	83	70	55	365
471	Милтанк	https://www.orthrusonline.ru/static/images/p/nextgen/miltank.png	miltank	\N	17	1.2	75.5	3	Толстая кожа   Дерзость   Поглотитель соков	14	Только самки	3956	12	94.5	95	80	105	100	40	70	490
472	Блисси	https://www.orthrusonline.ru/static/images/p/nextgen/blissey.png	blissey	\N	17	1.5	46.8	4	Естественное исцеление   Небесное благословение   Исцеление	27	Самцы: 12.5% Самки: 87.5% 	375	20	97.7	255	10	10	55	75	135	540
473	Райкоу	https://www.orthrusonline.ru/static/images/p/nextgen/raikou.png	raikou	\N	9	1.9	178	3	Давление   Концентрация	54	Бесполые	100	10	99.4	90	85	75	115	115	100	580
474	Энтей	https://www.orthrusonline.ru/static/images/p/nextgen/entei.png	entei	\N	58	2.1	198	3	Давление   Концентрация	54	Бесполые	174	5	99.4	115	115	85	100	90	75	580
475	Суйкун	https://www.orthrusonline.ru/static/images/p/nextgen/suicune.png	suicune	\N	4	2	187	3	Давление   Концентрация	54	Бесполые	114	20	99.4	100	75	115	85	90	115	580
476	Ларвитар	https://www.orthrusonline.ru/static/images/p/nextgen/larvitar.png	larvitar	\N	125	0.6	72	3	Сила воли   Песчаный покров	27	Самцы: 50% Самки: 50% 	1490	718	98.1	50	64	50	41	45	50	300
477	Пьюпитар	https://www.orthrusonline.ru/static/images/p/nextgen/pupitar.png	pupitar	\N	125	1.2	152	3	Сбрасывание кожи	27	Самцы: 50% Самки: 50% 	59	19	99.5	70	84	70	51	65	70	410
478	Тиранитар	https://www.orthrusonline.ru/static/images/p/nextgen/tyranitar.png	tyranitar	\N	50	2	202	3	Пробуждение песков   Нервирование	27	Самцы: 50% Самки: 50% 	500	140	97.2	100	134	110	61	95	100	600
479	Лугия	https://www.orthrusonline.ru/static/images/p/nextgen/lugia.png	lugia	\N	37	5.2	216	3	Давление   Мульти-чешуя	80	Бесполые	26	6	99.8	106	90	130	110	90	154	680
480	Хо-ох	https://www.orthrusonline.ru/static/images/p/nextgen/hooh.png	hooh	\N	2	3.8	199	3	Давление   Регенерация	80	Бесполые	39	12	99.7	106	130	90	90	110	154	680
481	Селеби	https://www.orthrusonline.ru/static/images/p/nextgen/celebi.png	celebi	\N	140	0.6	5	1	Естественное исцеление	80	Бесполые	57	42	99.6	100	100	100	100	100	100	600
482	Трикко	https://www.orthrusonline.ru/static/images/p/nextgen/treecko.png	treecko	\N	64	0.5	5	1	Сверхрост   Освобождение	14	Самцы: 87.5% Самки: 12.5% 	769	97	95.2	40	45	35	70	65	55	310
483	Гровайл	https://www.orthrusonline.ru/static/images/p/nextgen/grovyle.png	grovyle	\N	64	0.9	21.6	1	Сверхрост   Освобождение	14	Самцы: 87.5% Самки: 12.5% 	528	10	95.7	50	65	45	95	85	65	405
484	Скептайл	https://www.orthrusonline.ru/static/images/p/nextgen/sceptile.png	sceptile	\N	64	1.7	52.2	1	Сверхрост   Освобождение	14	Самцы: 87.5% Самки: 12.5% 	430	51	96.5	70	85	65	120	105	85	530
485	Торчик	https://www.orthrusonline.ru/static/images/p/nextgen/torchic.png	torchic	\N	58	0.4	2.5	1	Яростное пламя   Ускорение	14	Самцы: 87.5% Самки: 12.5% 	921	54	94.1	45	60	40	45	70	50	310
486	Комбаскен	https://www.orthrusonline.ru/static/images/p/nextgen/combusken.png	combusken	\N	51	0.9	19.5	1	Яростное пламя   Ускорение	14	Самцы: 87.5% Самки: 12.5% 	593	10	95.1	60	85	60	55	85	60	405
487	Блазикен	https://www.orthrusonline.ru/static/images/p/nextgen/blaziken.png	blaziken	\N	51	1.9	52	1	Яростное пламя   Ускорение	14	Самцы: 87.5% Самки: 12.5% 	754	67	94.1	80	120	70	80	110	70	530
488	Мадкип	https://www.orthrusonline.ru/static/images/p/nextgen/mudkip.png	mudkip	\N	4	0.4	7.6	1	Всплеск   Влажность	14	Самцы: 87.5% Самки: 12.5% 	1533	60	90.8	50	70	50	40	50	50	310
489	Марштомп	https://www.orthrusonline.ru/static/images/p/nextgen/marshtomp.png	marshtomp	\N	52	0.7	28	1	Всплеск   Влажность	14	Самцы: 87.5% Самки: 12.5% 	1156	23	90.5	70	85	70	50	60	70	405
490	Свамперт	https://www.orthrusonline.ru/static/images/p/nextgen/swampert.png	swampert	\N	52	1.5	81.9	1	Всплеск   Влажность	14	Самцы: 87.5% Самки: 12.5% 	896	89	92.8	100	110	90	60	85	90	535
491	Пучиена	https://www.orthrusonline.ru/static/images/p/nextgen/poochyena.png	poochyena	\N	15	0.5	13.6	2	Бегство   Быстрые ноги   Нервозность	10	Самцы: 50% Самки: 50% 	15264	168	74.6	35	55	35	35	30	30	220
492	Майтиена	https://www.orthrusonline.ru/static/images/p/nextgen/mightyena.png	mightyena	\N	15	1	37	2	Запугивание   Быстрые ноги   Ловкость	10	Самцы: 50% Самки: 50% 	6128	197	77.6	70	90	70	70	60	60	420
493	Зигзагун	https://www.orthrusonline.ru/static/images/p/nextgen/zigzagoon.png	zigzagoon	\N	17	0.4	17.5	2	Сбор предметов   Прожорливость   Быстрые ноги	10	Самцы: 50% Самки: 50% 	13391	93	84.4	38	30	41	60	30	41	240
494	Линун	https://www.orthrusonline.ru/static/images/p/nextgen/linoone.png	linoone	\N	17	0.5	32.5	2	Сбор предметов   Прожорливость   Быстрые ноги	10	Самцы: 50% Самки: 50% 	1491	77	92.8	78	70	61	100	50	61	420
495	Вурмпл	https://www.orthrusonline.ru/static/images/p/nextgen/wurmple.png	wurmple	\N	120	0.3	3.6	2	Защитная пыльца   Бегство	10	Самцы: 50% Самки: 50% 	14611	129	32.5	45	45	35	20	20	30	195
496	Силкун	https://www.orthrusonline.ru/static/images/p/nextgen/silcoon.png	silcoon	\N	120	0.6	10	2	Сбрасывание кожи	10	Самцы: 50% Самки: 50% 	898	10	94.6	50	35	55	15	25	25	205
497	Бьютифлай	https://www.orthrusonline.ru/static/images/p/nextgen/beautifly.png	beautifly	\N	5	1	28.4	2	Роение   Соперничество	10	Самцы: 50% Самки: 50% 	8277	108	67.5	60	70	50	65	100	50	395
498	Каскун	https://www.orthrusonline.ru/static/images/p/nextgen/cascoon.png	cascoon	\N	120	0.7	11.5	2	Сбрасывание кожи	10	Самцы: 50% Самки: 50% 	451	13	96.9	50	35	55	15	25	25	205
499	Дастокс	https://www.orthrusonline.ru/static/images/p/nextgen/dustox.png	dustox	\N	6	1.2	31.6	2	Защитная пыльца   Фасеточность	10	Самцы: 50% Самки: 50% 	3361	45	79.2	60	50	70	65	50	90	385
500	Лотад	https://www.orthrusonline.ru/static/images/p/nextgen/lotad.png	lotad	\N	141	0.5	2.6	1	Быстрое плаванье   Омывка дождем   Собственный темп	10	Самцы: 50% Самки: 50% 	10712	31	81.8	40	30	30	30	40	50	220
501	Ломбрэ	https://www.orthrusonline.ru/static/images/p/nextgen/lombre.png	lombre	\N	141	1.2	32.5	1	Быстрое плаванье   Омывка дождем   Собственный темп	10	Самцы: 50% Самки: 50% 	1043	7	96.1	60	50	50	50	60	70	340
502	Лудиколо	https://www.orthrusonline.ru/static/images/p/nextgen/ludicolo.png	ludicolo	\N	141	1.5	55	1	Быстрое плаванье   Омывка дождем   Собственный темп	10	Самцы: 50% Самки: 50% 	495	20	97.9	80	70	70	70	90	100	480
503	Сидот	https://www.orthrusonline.ru/static/images/p/nextgen/seedot.png	seedot	\N	64	0.5	4	1	Хлорофилл   Раннее пробуждение   Карманный вор	10	Самцы: 50% Самки: 50% 	5468	21	89.3	40	40	50	30	30	30	220
504	Назлиф	https://www.orthrusonline.ru/static/images/p/nextgen/nuzleaf.png	nuzleaf	\N	142	1	28	1	Хлорофилл   Раннее пробуждение   Карманный вор	10	Самцы: 50% Самки: 50% 	2895	26	87.9	70	70	40	60	60	40	340
505	Шифтри	https://www.orthrusonline.ru/static/images/p/nextgen/shiftry.png	shiftry	\N	142	1.3	59.6	1	Хлорофилл   Ветрокрыл   Карманный вор	10	Самцы: 50% Самки: 50% 	242	10	98.1	90	100	60	80	90	60	480
506	Тэйллоу	https://www.orthrusonline.ru/static/images/p/nextgen/taillow.png	taillow	\N	7	0.3	2.3	1	Сила воли   Дерзость	10	Самцы: 50% Самки: 50% 	15470	47	86.1	40	55	30	85	30	30	270
507	Свеллоу	https://www.orthrusonline.ru/static/images/p/nextgen/swellow.png	swellow	\N	7	0.7	19.8	1	Сила воли   Дерзость	10	Самцы: 50% Самки: 50% 	1017	23	95.6	60	85	60	125	75	50	455
508	Вингал	https://www.orthrusonline.ru/static/images/p/nextgen/wingull.png	wingull	\N	129	0.6	9.5	2	Острый глаз   Гидрирование   Омывка дождем	14	Самцы: 50% Самки: 50% 	12074	248	84.3	40	30	30	85	55	30	270
509	Пелиппер	https://www.orthrusonline.ru/static/images/p/nextgen/pelipper.png	pelipper	\N	129	1.2	28	2	Острый глаз   Изморось   Омывка дождем	14	Самцы: 50% Самки: 50% 	12580	103	86.4	60	50	100	65	95	70	440
510	Ральтс	https://www.orthrusonline.ru/static/images/p/nextgen/ralts.png	ralts	\N	22	0.4	6.6	3	Синхронизация   Слежка   Телепатия	14	Самцы: 50% Самки: 50% 	9483	8	92.9	28	25	25	40	45	35	198
511	Кирлия	https://www.orthrusonline.ru/static/images/p/nextgen/kirlia.png	kirlia	\N	22	0.8	20.2	3	Синхронизация   Слежка   Телепатия	14	Самцы: 50% Самки: 50% 	127	3	99	38	35	35	50	65	55	278
512	Гардевуар	https://www.orthrusonline.ru/static/images/p/nextgen/gardevoir.png	gardevoir	\N	22	1.6	48.4	3	Синхронизация   Слежка   Телепатия	14	Самцы: 50% Самки: 50% 	715	42	94.6	68	65	65	80	125	115	518
513	Сурскит	https://www.orthrusonline.ru/static/images/p/nextgen/surskit.png	surskit	\N	143	0.5	1.7	2	Быстрое плаванье   Омывка дождем	10	Самцы: 50% Самки: 50% 	26752	151	80.4	40	30	32	65	50	52	269
514	Маскурейн	https://www.orthrusonline.ru/static/images/p/nextgen/masquerain.png	masquerain	\N	5	0.8	3.6	2	Запугивание   Нервирование	10	Самцы: 50% Самки: 50% 	2458	52	85.1	70	60	62	80	100	82	454
515	Шрумиш	https://www.orthrusonline.ru/static/images/p/nextgen/shroomish.png	shroomish	\N	64	0.4	4.5	6	Эффект споры   Лечение ядом   Быстрые ноги	10	Самцы: 50% Самки: 50% 	4315	10	96.4	60	40	60	35	40	60	295
516	Брелум	https://www.orthrusonline.ru/static/images/p/nextgen/breloom.png	breloom	\N	78	1.2	39.2	6	Эффект споры   Лечение ядом   Техничность	10	Самцы: 50% Самки: 50% 	151	9	98.8	60	130	80	70	60	60	460
517	Слакот	https://www.orthrusonline.ru/static/images/p/nextgen/slakoth.png	slakoth	\N	17	0.8	24	3	Ленивость	10	Самцы: 50% Самки: 50% 	607	332	98.7	60	60	60	30	35	35	280
518	Вигорот	https://www.orthrusonline.ru/static/images/p/nextgen/vigoroth.png	vigoroth	\N	17	1.4	46.5	3	Подъём духа	10	Самцы: 50% Самки: 50% 	24	15	99.8	80	80	80	90	55	55	440
519	Слакинг	https://www.orthrusonline.ru/static/images/p/nextgen/slaking.png	slaking	\N	17	2	130.5	3	Ленивость	10	Самцы: 50% Самки: 50% 	86	53	99.3	150	160	100	100	95	65	670
520	Нинкада	https://www.orthrusonline.ru/static/images/p/nextgen/nincada.png	nincada	\N	63	0.5	5.5	5	Фасеточность   Бегство	10	Самцы: 50% Самки: 50% 	3214	3	95.4	31	45	90	40	30	30	266
521	Нинджаск	https://www.orthrusonline.ru/static/images/p/nextgen/ninjask.png	ninjask	\N	5	0.8	12	5	Ускорение   Проскальзывание	10	Самцы: 50% Самки: 50% 	707	7	97.3	61	90	45	160	50	50	456
522	Шединья	https://www.orthrusonline.ru/static/images/p/nextgen/shedinja.png	shedinja	\N	144	0.8	1.2	5	Чудесный щит	10	Бесполые	823	7	96.7	1	90	45	40	30	30	236
523	Висмур	https://www.orthrusonline.ru/static/images/p/nextgen/whismur.png	whismur	\N	17	0.6	16.3	1	Звуконепроницаемость   Нервозность	14	Самцы: 50% Самки: 50% 	3927	39	93.1	64	51	23	28	51	23	240
524	Лаудред	https://www.orthrusonline.ru/static/images/p/nextgen/loudred.png	loudred	\N	17	1	40.5	1	Звуконепроницаемость   Дерзость	14	Самцы: 50% Самки: 50% 	6179	27	87.8	84	71	43	48	71	43	360
525	Эксплауд	https://www.orthrusonline.ru/static/images/p/nextgen/exploud.png	exploud	\N	17	1.5	84	1	Звуконепроницаемость   Дерзость	14	Самцы: 50% Самки: 50% 	409	18	97	104	91	63	68	91	73	490
526	Макухита	https://www.orthrusonline.ru/static/images/p/nextgen/makuhita.png	makuhita	\N	20	1	86.4	6	Толстая кожа   Сила воли   Грубая сила	14	Самцы: 75% Самки: 25% 	3340	10	94.1	72	60	30	25	20	30	237
527	Харияма	https://www.orthrusonline.ru/static/images/p/nextgen/hariyama.png	hariyama	\N	20	2.3	253.8	6	Толстая кожа   Сила воли   Грубая сила	14	Самцы: 75% Самки: 25% 	235	7	98.2	144	120	60	50	40	60	474
528	Азурилл	https://www.orthrusonline.ru/static/images/p/nextgen/azurill.png	azurill	\N	77	0.2	2	4	Толстая кожа   Большая сила   Поглотитель соков	7	Самцы: 25% Самки: 75% 	2735	119	87.8	50	20	40	20	20	40	190
529	Носпас	https://www.orthrusonline.ru/static/images/p/nextgen/nosepass.png	nosepass	\N	93	1	97	2	Стойкость   Магнитное притяжение   Сила песка	14	Самцы: 50% Самки: 50% 	3669	10	95.4	30	45	135	30	45	90	375
530	Скитти	https://www.orthrusonline.ru/static/images/p/nextgen/skitty.png	skitty	\N	17	0.6	11	4	Очарование   Нормализация   Призрачная кожа	10	Самцы: 25% Самки: 75% 	4449	33	83.6	50	45	45	50	35	35	260
531	Делкэтти	https://www.orthrusonline.ru/static/images/p/nextgen/delcatty.png	delcatty	\N	17	1.1	32.6	4	Очарование   Нормализация   Призрачная кожа	10	Самцы: 25% Самки: 75% 	38	8	99.7	70	65	65	90	55	55	400
532	Саблай	https://www.orthrusonline.ru/static/images/p/nextgen/sableye.png	sableye	\N	53	0.5	11	1	Острый глаз   Задерживание   Проказник	17	Самцы: 50% Самки: 50% 	6269	82	91.6	50	75	75	50	65	65	380
533	Мавайл	https://www.orthrusonline.ru/static/images/p/nextgen/mawile.png	mawile	\N	54	0.6	11.5	4	Суперсильные когти   Запугивание   Грубая сила	14	Самцы: 50% Самки: 50% 	9968	41	88.5	50	85	85	50	55	55	380
534	Арон	https://www.orthrusonline.ru/static/images/p/nextgen/aron.png	aron	\N	145	0.4	60	3	Стойкость   Каменная голова   Увеличение веса	24	Самцы: 50% Самки: 50% 	18859	123	90.1	50	70	100	30	40	40	330
535	Лайрон	https://www.orthrusonline.ru/static/images/p/nextgen/lairon.png	lairon	\N	145	0.9	120	3	Стойкость   Каменная голова   Увеличение веса	24	Самцы: 50% Самки: 50% 	13051	68	71.2	60	90	140	40	50	50	430
536	Аггрон	https://www.orthrusonline.ru/static/images/p/nextgen/aggron.png	aggron	\N	145	2.1	360	3	Стойкость   Каменная голова   Увеличение веса	24	Самцы: 50% Самки: 50% 	942	28	93.4	70	110	180	50	60	60	530
537	Медитайт	https://www.orthrusonline.ru/static/images/p/nextgen/meditite.png	meditite	\N	55	0.6	11.2	2	Чистая сила   Телепатия	14	Самцы: 50% Самки: 50% 	10772	119	84.5	30	40	55	60	40	55	280
538	Медичам	https://www.orthrusonline.ru/static/images/p/nextgen/medicham.png	medicham	\N	55	1.3	31.5	2	Чистая сила   Телепатия	14	Самцы: 50% Самки: 50% 	1231	65	94.3	60	60	75	80	60	75	410
539	Электрайк	https://www.orthrusonline.ru/static/images/p/nextgen/electrike.png	electrike	\N	9	0.6	15.2	3	Статическое электричество   Громоотвод   Минус	14	Самцы: 50% Самки: 50% 	6240	51	86.3	40	45	40	65	65	40	295
540	Манектрик	https://www.orthrusonline.ru/static/images/p/nextgen/manectric.png	manectric	\N	9	1.5	40.2	3	Статическое электричество   Громоотвод   Минус	14	Самцы: 50% Самки: 50% 	3500	71	88.9	70	75	60	105	105	60	475
541	Плюсл	https://www.orthrusonline.ru/static/images/p/nextgen/plusle.png	plusle	\N	9	0.4	4.2	2	Плюс   Громоотвод	14	Самцы: 50% Самки: 50% 	833	7	98.8	60	50	40	95	85	75	405
542	Минун	https://www.orthrusonline.ru/static/images/p/nextgen/minun.png	minun	\N	9	0.4	4.2	2	Минус   Поглощение электричества	14	Самцы: 50% Самки: 50% 	912	5	98.6	60	40	50	95	75	85	405
543	Волбит	https://www.orthrusonline.ru/static/images/p/nextgen/volbeat.png	volbeat	\N	120	0.7	17.7	5	Свечение   Роение   Проказник	10	Только самцы	3222	68	91.7	65	73	75	85	47	85	430
544	Иллюмайз	https://www.orthrusonline.ru/static/images/p/nextgen/illumise.png	illumise	\N	120	0.6	17.7	6	Забвение   Тонированные линзы   Проказник	10	Только самки	2345	22	92.8	65	47	75	85	73	85	430
545	Розалия	https://www.orthrusonline.ru/static/images/p/nextgen/roselia.png	roselia	\N	1	0.3	2	1	Естественное исцеление   Ядовитые колючки   Травяной щит	14	Самцы: 50% Самки: 50% 	27282	293	60.4	50	60	45	65	100	80	400
546	Гульпин	https://www.orthrusonline.ru/static/images/p/nextgen/gulpin.png	gulpin	\N	121	0.4	10.3	6	Жидкая грязь   Липкий захват   Прожорливость	14	Самцы: 50% Самки: 50% 	399	2	98.4	70	43	53	40	43	53	302
547	Свалот	https://www.orthrusonline.ru/static/images/p/nextgen/swalot.png	swalot	\N	121	1.7	80	6	Жидкая грязь   Липкий захват   Прожорливость	14	Самцы: 50% Самки: 50% 	241	2	98.7	100	73	83	55	73	83	467
548	Карванья	https://www.orthrusonline.ru/static/images/p/nextgen/carvanha.png	carvanha	\N	34	0.8	20.8	3	Грубая кожа   Ускорение	14	Самцы: 50% Самки: 50% 	6346	43	93.1	45	90	20	65	65	20	305
549	Шарпедо	https://www.orthrusonline.ru/static/images/p/nextgen/sharpedo.png	sharpedo	\N	34	1.8	88.8	3	Грубая кожа   Ускорение	14	Самцы: 50% Самки: 50% 	517	14	97.2	70	120	40	95	95	40	460
550	Вайлмер	https://www.orthrusonline.ru/static/images/p/nextgen/wailmer.png	wailmer	\N	4	2	130	6	Водяные покровы   Забвение   Давление	27	Самцы: 50% Самки: 50% 	6138	75	93	130	70	35	60	70	35	400
551	Вайлорд	https://www.orthrusonline.ru/static/images/p/nextgen/wailord.png	wailord	\N	4	14.5	398	6	Водяные покровы   Забвение   Давление	27	Самцы: 50% Самки: 50% 	151	15	98.8	170	90	45	60	90	45	500
552	Нумель	https://www.orthrusonline.ru/static/images/p/nextgen/numel.png	numel	\N	56	0.7	24	2	Забвение   Простота   Собственный темп	14	Самцы: 50% Самки: 50% 	5747	17	93.2	60	60	40	35	65	45	305
553	Камерупт	https://www.orthrusonline.ru/static/images/p/nextgen/camerupt.png	camerupt	\N	56	1.9	220	2	Магмовая броня   Твердый камень   Прилив гнева	14	Самцы: 50% Самки: 50% 	1008	11	96.1	70	100	70	40	105	75	460
554	Торкол	https://www.orthrusonline.ru/static/images/p/nextgen/torkoal.png	torkoal	\N	58	0.5	80.4	2	Белый дым   Осушение   Панцирь-броня	14	Самцы: 50% Самки: 50% 	4414	53	93	70	85	140	20	85	70	470
555	Споинк	https://www.orthrusonline.ru/static/images/p/nextgen/spoink.png	spoink	\N	19	0.7	30.6	4	Толстая кожа   Собственный темп   Прожорливость	14	Самцы: 50% Самки: 50% 	2669	37	91.7	60	25	35	60	70	80	330
556	Грумпиг	https://www.orthrusonline.ru/static/images/p/nextgen/grumpig.png	grumpig	\N	19	0.9	71.5	4	Толстая кожа   Собственный темп   Прожорливость	14	Самцы: 50% Самки: 50% 	151	10	98.8	80	45	65	80	90	110	470
557	Спинда	https://www.orthrusonline.ru/static/images/p/nextgen/spinda.png	spinda	\N	17	1.1	5	4	Собственный темп   Косолапость   Порочность	10	Самцы: 50% Самки: 50% 	3231	54	87.8	60	60	60	60	60	60	360
558	Трапинч	https://www.orthrusonline.ru/static/images/p/nextgen/trapinch.png	trapinch	\N	100	0.7	15	1	Суперсильные когти   Аренная ловушка   Грубая сила	14	Самцы: 50% Самки: 50% 	2645	3	96.2	45	100	45	10	45	45	290
559	Вибрава	https://www.orthrusonline.ru/static/images/p/nextgen/vibrava.png	vibrava	\N	146	1.1	15.3	1	Левитация	14	Самцы: 50% Самки: 50% 	52	0	99.6	50	70	50	70	50	50	340
560	Флайгон	https://www.orthrusonline.ru/static/images/p/nextgen/flygon.png	flygon	\N	146	2	82	1	Левитация	14	Самцы: 50% Самки: 50% 	1165	27	96.6	80	100	80	100	80	80	520
561	Какнея	https://www.orthrusonline.ru/static/images/p/nextgen/cacnea.png	cacnea	\N	64	0.4	51.3	1	Песчаный покров   Поглощение воды	14	Самцы: 50% Самки: 50% 	5234	47	92.1	50	85	40	35	85	40	335
562	Кактурн	https://www.orthrusonline.ru/static/images/p/nextgen/cacturne.png	cacturne	\N	142	1.3	77.4	1	Песчаный покров   Поглощение воды	14	Самцы: 50% Самки: 50% 	876	28	96.3	70	115	60	55	115	60	475
563	Сваблю	https://www.orthrusonline.ru/static/images/p/nextgen/swablu.png	swablu	\N	7	0.4	1.2	5	Естественное исцеление   Девятое небо	14	Самцы: 50% Самки: 50% 	5411	5	90.4	45	40	60	50	40	75	310
564	Алтария	https://www.orthrusonline.ru/static/images/p/nextgen/altaria.png	altaria	\N	59	1.1	20.6	5	Естественное исцеление   Девятое небо	14	Самцы: 50% Самки: 50% 	456	17	96.6	75	70	90	80	70	105	490
565	Зангус	https://www.orthrusonline.ru/static/images/p/nextgen/zangoose.png	zangoose	\N	17	1.3	40.3	5	Иммунитет   Ярость от отравления	14	Самцы: 50% Самки: 50% 	2235	10	96.2	73	115	60	90	60	60	458
566	Севайпер	https://www.orthrusonline.ru/static/images/p/nextgen/seviper.png	seviper	\N	121	2.7	52.5	6	Сбрасывание кожи   Проскальзывание	14	Самцы: 50% Самки: 50% 	1483	9	96.6	73	100	60	65	100	60	458
567	Лунатон	https://www.orthrusonline.ru/static/images/p/nextgen/lunatone.png	lunatone	\N	147	1	168	4	Левитация	17	Бесполые	885	16	97.3	90	55	65	70	95	85	460
568	Солрок	https://www.orthrusonline.ru/static/images/p/nextgen/solrock.png	solrock	\N	147	1.2	154	4	Левитация	17	Бесполые	2049	17	92.5	90	95	85	70	55	65	460
569	Барбоч	https://www.orthrusonline.ru/static/images/p/nextgen/barboach.png	barboach	\N	52	0.4	1.9	2	Забвение   Предвидение   Гидрирование	14	Самцы: 50% Самки: 50% 	14200	39	84.9	50	48	43	60	46	41	288
570	Вискаш	https://www.orthrusonline.ru/static/images/p/nextgen/whiscash.png	whiscash	\N	52	0.9	23.6	2	Забвение   Предвидение   Гидрирование	14	Самцы: 50% Самки: 50% 	672	20	97.1	110	78	73	60	76	71	468
571	Корфиш	https://www.orthrusonline.ru/static/images/p/nextgen/corphish.png	corphish	\N	4	0.6	11.5	6	Суперсильные когти   Панцирь-броня   Адаптация	10	Самцы: 50% Самки: 50% 	7220	17	87.7	43	80	65	35	50	35	308
572	Кроудант	https://www.orthrusonline.ru/static/images/p/nextgen/crawdaunt.png	crawdaunt	\N	34	1.1	32.8	6	Суперсильные когти   Панцирь-броня   Адаптация	10	Самцы: 50% Самки: 50% 	354	5	97.3	63	120	85	55	90	55	468
573	Балтой	https://www.orthrusonline.ru/static/images/p/nextgen/baltoy.png	baltoy	\N	148	0.5	21.5	2	Левитация	14	Бесполые	295	2	99.2	40	40	55	55	40	70	300
574	Клэйдол	https://www.orthrusonline.ru/static/images/p/nextgen/claydol.png	claydol	\N	148	1.5	108	2	Левитация	14	Бесполые	934	1	97.1	60	70	105	75	70	120	500
575	Лилип	https://www.orthrusonline.ru/static/images/p/nextgen/lileep.png	lileep	\N	149	1	23.8	5	Присоски   Водоотвод	20	Самцы: 87.5% Самки: 12.5% 	1465	9	97.7	66	41	77	23	61	87	355
576	Крадили	https://www.orthrusonline.ru/static/images/p/nextgen/cradily.png	cradily	\N	149	1.5	60.4	5	Присоски   Водоотвод	20	Самцы: 87.5% Самки: 12.5% 	1315	7	96.8	86	81	97	43	81	107	495
577	Анорит	https://www.orthrusonline.ru/static/images/p/nextgen/anorith.png	anorith	\N	150	0.7	12.5	5	Боевая броня   Быстрое плаванье	20	Самцы: 87.5% Самки: 12.5% 	197	74	99.3	45	95	50	75	40	50	355
578	Армальдо	https://www.orthrusonline.ru/static/images/p/nextgen/armaldo.png	armaldo	\N	150	1.5	68.2	5	Боевая броня   Быстрое плаванье	20	Самцы: 87.5% Самки: 12.5% 	92	8	99.4	75	125	100	45	70	80	495
579	Фибас	https://www.orthrusonline.ru/static/images/p/nextgen/feebas.png	feebas	\N	4	0.6	7.4	5	Быстрое плаванье   Забвение   Адаптация	14	Самцы: 50% Самки: 50% 	7805	8	95.2	20	15	20	80	10	55	200
580	Майлотик	https://www.orthrusonline.ru/static/images/p/nextgen/milotic.png	milotic	\N	4	6.2	162	5	Чудесная чешуя   Состязательность   Очарование	14	Самцы: 50% Самки: 50% 	303	35	97.8	95	60	79	81	100	125	540
581	Кастформ	https://www.orthrusonline.ru/static/images/p/nextgen/castform.png	castform	\N	17	0.3	0.8	2	Предсказание погоды	17	Самцы: 50% Самки: 50% 	2151	6	96.2	70	70	70	70	70	70	420
582	Кеклеон	https://www.orthrusonline.ru/static/images/p/nextgen/kecleon.png	kecleon	\N	17	1	22	1	Изменение цвета   Изменчивость	14	Самцы: 50% Самки: 50% 	6126	20	84.9	60	90	70	40	60	120	440
583	Шаппет	https://www.orthrusonline.ru/static/images/p/nextgen/shuppet.png	shuppet	\N	48	0.6	2.3	4	Бессонница   Обыскивание   Проклятое тело	17	Самцы: 50% Самки: 50% 	11394	197	90.9	44	75	35	45	63	33	295
584	Банетт	https://www.orthrusonline.ru/static/images/p/nextgen/banette.png	banette	\N	48	1.1	12.5	4	Бессонница   Обыскивание   Проклятое тело	17	Самцы: 50% Самки: 50% 	2530	45	94.6	64	115	65	65	83	63	455
585	Даскулл	https://www.orthrusonline.ru/static/images/p/nextgen/duskull.png	duskull	\N	48	0.8	15	4	Левитация   Обыскивание	17	Самцы: 50% Самки: 50% 	1758	8	97.7	20	40	90	25	30	90	295
586	Дасклопс	https://www.orthrusonline.ru/static/images/p/nextgen/dusclops.png	dusclops	\N	48	1.6	30.6	4	Давление   Обыскивание	17	Самцы: 50% Самки: 50% 	583	7	97.7	40	70	130	25	60	130	455
587	Тропиус	https://www.orthrusonline.ru/static/images/p/nextgen/tropius.png	tropius	\N	76	2	100	3	Хлорофилл   Солнечная сила   Восстановление урожая	17	Самцы: 50% Самки: 50% 	8673	10	87.8	99	68	83	51	72	87	460
588	Чаймеко	https://www.orthrusonline.ru/static/images/p/nextgen/chimecho.png	chimecho	\N	19	0.6	1	4	Левитация	17	Самцы: 50% Самки: 50% 	1494	28	93.1	75	50	80	65	95	90	455
589	Абсол	https://www.orthrusonline.ru/static/images/p/nextgen/absol.png	absol	\N	15	1.2	47	1	Давление   Сверхудачливость   Сердце правосудия	17	Самцы: 50% Самки: 50% 	13135	60	83.1	65	130	60	75	75	60	465
590	Вайнаут	https://www.orthrusonline.ru/static/images/p/nextgen/wynaut.png	wynaut	\N	19	0.6	14	2	Тёмная метка   Телепатия	14	Самцы: 50% Самки: 50% 	709	1	97.2	95	23	48	23	23	48	260
591	Снорант	https://www.orthrusonline.ru/static/images/p/nextgen/snorunt.png	snorunt	\N	12	0.7	16.8	2	Концентрация   Ледяное тело   Переменчивое настроение	14	Самцы: 50% Самки: 50% 	6776	77	92.1	50	50	50	50	50	50	300
592	Глали	https://www.orthrusonline.ru/static/images/p/nextgen/glalie.png	glalie	\N	12	1.5	256.5	2	Концентрация   Ледяное тело   Переменчивое настроение	14	Самцы: 50% Самки: 50% 	3999	24	94.5	80	80	80	80	80	80	480
593	Сфил	https://www.orthrusonline.ru/static/images/p/nextgen/spheal.png	spheal	\N	151	0.8	39.5	1	Толстая кожа   Ледяное тело   Забвение	14	Самцы: 50% Самки: 50% 	7679	78	91.5	70	40	50	25	55	50	290
594	Силео	https://www.orthrusonline.ru/static/images/p/nextgen/sealeo.png	sealeo	\N	151	1.1	87.6	1	Толстая кожа   Ледяное тело   Забвение	14	Самцы: 50% Самки: 50% 	2045	35	96.7	90	60	70	45	75	70	410
595	Валрейн	https://www.orthrusonline.ru/static/images/p/nextgen/walrein.png	walrein	\N	151	1.4	150.6	1	Толстая кожа   Ледяное тело   Забвение	14	Самцы: 50% Самки: 50% 	872	28	96.3	110	80	90	65	95	90	530
596	Кламперл	https://www.orthrusonline.ru/static/images/p/nextgen/clamperl.png	clamperl	\N	4	0.4	52.5	5	Панцирь-броня   Нервозность	14	Самцы: 50% Самки: 50% 	8099	27	90.5	35	64	85	32	74	55	345
597	Хантейл	https://www.orthrusonline.ru/static/images/p/nextgen/huntail.png	huntail	\N	4	1.7	27	5	Быстрое плаванье   Водяные покровы	14	Самцы: 50% Самки: 50% 	106	2	99.2	55	104	105	52	94	75	485
598	Горбисс	https://www.orthrusonline.ru/static/images/p/nextgen/gorebyss.png	gorebyss	\N	4	1.8	22.6	5	Быстрое плаванье   Гидрирование	14	Самцы: 50% Самки: 50% 	95	3	99.3	55	84	105	52	114	75	485
599	Реликант	https://www.orthrusonline.ru/static/images/p/nextgen/relicanth.png	relicanth	\N	98	1	23.4	3	Быстрое плаванье   Каменная голова   Стойкость	27	Самцы: 87.5% Самки: 12.5% 	2662	8	93.7	100	90	130	55	45	65	485
600	Лавдиск	https://www.orthrusonline.ru/static/images/p/nextgen/luvdisc.png	luvdisc	\N	4	0.6	8.7	4	Быстрое плаванье   Гидрирование	14	Самцы: 25% Самки: 75% 	4059	99	84.6	43	30	55	97	40	65	330
601	Багон	https://www.orthrusonline.ru/static/images/p/nextgen/bagon.png	bagon	\N	132	0.6	42.1	3	Каменная голова   Грубая сила	27	Самцы: 50% Самки: 50% 	674	267	98.6	45	75	60	50	40	30	300
602	Шеллгон	https://www.orthrusonline.ru/static/images/p/nextgen/shelgon.png	shelgon	\N	132	1.1	110.5	3	Каменная голова   Пыленепроницаемость	27	Самцы: 50% Самки: 50% 	33	11	99.7	65	95	100	50	60	50	420
603	Саламенс	https://www.orthrusonline.ru/static/images/p/nextgen/salamence.png	salamence	\N	59	1.5	102.6	3	Запугивание   Ловкость	27	Самцы: 50% Самки: 50% 	286	97	98.1	95	135	80	100	110	80	600
604	Белдам	https://www.orthrusonline.ru/static/images/p/nextgen/beldum.png	beldum	\N	60	0.6	95.2	3	Чистое тело   Снижение веса	27	Бесполые	1577	670	97.4	40	55	80	30	35	60	300
605	Метанг	https://www.orthrusonline.ru/static/images/p/nextgen/metang.png	metang	\N	60	1.2	202.5	3	Чистое тело   Снижение веса	27	Бесполые	72	19	99.4	60	75	100	50	55	80	420
606	Метагросс	https://www.orthrusonline.ru/static/images/p/nextgen/metagross.png	metagross	\N	60	1.6	550	3	Чистое тело   Снижение веса	27	Бесполые	451	141	97.1	80	135	130	70	95	90	600
607	Реджирок	https://www.orthrusonline.ru/static/images/p/nextgen/regirock.png	regirock	\N	93	1.7	230	3	Чистое тело   Стойкость	54	Бесполые	39	4	99.7	80	100	200	50	50	100	580
608	Реджиайс	https://www.orthrusonline.ru/static/images/p/nextgen/regice.png	regice	\N	12	1.8	175	3	Чистое тело   Ледяное тело	54	Бесполые	47	17	99.7	80	50	100	50	100	200	580
609	Реджистил	https://www.orthrusonline.ru/static/images/p/nextgen/registeel.png	registeel	\N	16	1.9	205	3	Чистое тело   Снижение веса	54	Бесполые	40	16	99.7	80	75	150	50	75	150	580
610	Латиас	https://www.orthrusonline.ru/static/images/p/nextgen/latias.png	latias	\N	61	1.4	40	3	Левитация	80	Только самки	93	57	99.5	80	80	90	110	110	130	600
611	Латиос	https://www.orthrusonline.ru/static/images/p/nextgen/latios.png	latios	\N	61	2	60	3	Левитация	80	Только самцы	120	71	99.4	80	90	80	110	130	110	600
612	Кайогр	https://www.orthrusonline.ru/static/images/p/nextgen/kyogre.png	kyogre	\N	4	4.5	352	3	Изморось	80	Бесполые	7	1	99.9	100	100	90	90	150	140	670
613	Граудон	https://www.orthrusonline.ru/static/images/p/nextgen/groudon.png	groudon	\N	100	3.5	950	3	Осушение	80	Бесполые	4	1	100	100	150	140	90	100	90	670
614	Рейкваза	https://www.orthrusonline.ru/static/images/p/nextgen/rayquaza.png	rayquaza	\N	59	7	206.5	3	Воздушный замок	80	Бесполые	44	23	99.7	105	150	90	95	150	90	680
615	Джирачи	https://www.orthrusonline.ru/static/images/p/nextgen/jirachi.png	jirachi	\N	60	0.3	1.1	3	Небесное благословение	80	Бесполые	56	27	99.6	100	100	100	100	100	100	600
616	Деоксис	https://www.orthrusonline.ru/static/images/p/nextgen/deoxys.png	deoxys	\N	19	1.7	60.8	3	Давление	80	Бесполые	18	9	99.9	50	150	50	150	150	50	600
617	Тортвиг	https://www.orthrusonline.ru/static/images/p/nextgen/turtwig.png	turtwig	\N	64	0.4	10.2	1	Сверхрост   Панцирь-броня	14	Самцы: 87.5% Самки: 12.5% 	870	94	94.6	55	68	64	31	45	55	318
618	Гротл	https://www.orthrusonline.ru/static/images/p/nextgen/grotle.png	grotle	\N	64	1.1	97	1	Сверхрост   Панцирь-броня	14	Самцы: 87.5% Самки: 12.5% 	325	11	97.3	75	89	85	36	55	65	405
619	Тортерра	https://www.orthrusonline.ru/static/images/p/nextgen/torterra.png	torterra	\N	152	2.2	310	1	Сверхрост   Панцирь-броня	14	Самцы: 87.5% Самки: 12.5% 	589	56	95.3	95	109	105	56	75	85	525
620	Чимчар	https://www.orthrusonline.ru/static/images/p/nextgen/chimchar.png	chimchar	\N	58	0.5	6.2	1	Яростное пламя   Железный кулак	14	Самцы: 87.5% Самки: 12.5% 	879	120	94.9	44	58	44	61	58	44	309
621	Монферно	https://www.orthrusonline.ru/static/images/p/nextgen/monferno.png	monferno	\N	51	0.9	22	1	Яростное пламя   Железный кулак	14	Самцы: 87.5% Самки: 12.5% 	1176	12	90.3	64	78	52	81	78	52	405
622	Инфернейп	https://www.orthrusonline.ru/static/images/p/nextgen/infernape.png	infernape	\N	51	1.2	55	1	Яростное пламя   Железный кулак	14	Самцы: 87.5% Самки: 12.5% 	839	104	93.2	76	104	71	108	104	71	534
623	Пиплап	https://www.orthrusonline.ru/static/images/p/nextgen/piplup.png	piplup	\N	4	0.4	5.2	1	Всплеск   Состязательность	14	Самцы: 87.5% Самки: 12.5% 	1969	61	94.7	53	51	53	40	61	56	314
624	Принплап	https://www.orthrusonline.ru/static/images/p/nextgen/prinplup.png	prinplup	\N	4	0.8	23	1	Всплеск   Состязательность	14	Самцы: 87.5% Самки: 12.5% 	342	8	97.2	64	66	68	50	81	76	405
625	Эмполеон	https://www.orthrusonline.ru/static/images/p/nextgen/empoleon.png	empoleon	\N	153	1.7	84.5	1	Всплеск   Состязательность	14	Самцы: 87.5% Самки: 12.5% 	404	22	96.8	84	86	88	60	111	101	530
626	Старли	https://www.orthrusonline.ru/static/images/p/nextgen/starly.png	starly	\N	7	0.3	2	1	Острый глаз   Опрометчивость	10	Самцы: 50% Самки: 50% 	34734	192	20.1	40	55	30	60	30	30	245
627	Старэвиа	https://www.orthrusonline.ru/static/images/p/nextgen/staravia.png	staravia	\N	7	0.6	15.5	1	Запугивание   Опрометчивость	10	Самцы: 50% Самки: 50% 	15866	206	40.1	55	75	50	80	40	40	340
628	Стараптор	https://www.orthrusonline.ru/static/images/p/nextgen/staraptor.png	staraptor	\N	7	1.2	24.9	1	Запугивание   Опрометчивость	10	Самцы: 50% Самки: 50% 	3794	120	75	85	120	70	100	50	60	485
629	Бидуф	https://www.orthrusonline.ru/static/images/p/nextgen/bidoof.png	bidoof	\N	17	0.5	20	2	Простота   Безразличие   Переменчивое настроение	10	Самцы: 50% Самки: 50% 	12332	342	59.9	59	45	40	31	35	40	250
630	Бибарель	https://www.orthrusonline.ru/static/images/p/nextgen/bibarel.png	bibarel	\N	154	1	31.5	2	Простота   Безразличие   Переменчивое настроение	10	Самцы: 50% Самки: 50% 	3286	178	81.6	79	85	60	71	55	60	410
631	Крикетот	https://www.orthrusonline.ru/static/images/p/nextgen/kricketot.png	kricketot	\N	120	0.3	2.2	1	Сбрасывание кожи   Бегство	10	Самцы: 50% Самки: 50% 	12566	502	59.4	37	25	41	25	25	41	194
632	Крикетун	https://www.orthrusonline.ru/static/images/p/nextgen/kricketune.png	kricketune	\N	120	1	25.5	1	Роение   Техничность	10	Самцы: 50% Самки: 50% 	25319	188	81.3	77	85	51	65	55	51	384
633	Шинкс	https://www.orthrusonline.ru/static/images/p/nextgen/shinx.png	shinx	\N	9	0.5	9.5	1	Соперничество   Запугивание   Сила воли	14	Самцы: 50% Самки: 50% 	34595	125	46.4	45	65	34	45	40	34	263
634	Люксио	https://www.orthrusonline.ru/static/images/p/nextgen/luxio.png	luxio	\N	9	0.9	30.5	1	Соперничество   Запугивание   Сила воли	14	Самцы: 50% Самки: 50% 	11077	72	70.6	60	85	49	60	60	49	363
635	Люксрэй	https://www.orthrusonline.ru/static/images/p/nextgen/luxray.png	luxray	\N	9	1.4	42	1	Соперничество   Запугивание   Сила воли	14	Самцы: 50% Самки: 50% 	3134	58	80.2	80	120	79	70	95	79	523
636	Бадью	https://www.orthrusonline.ru/static/images/p/nextgen/budew.png	budew	\N	1	0.2	1.2	1	Естественное исцеление   Ядовитые колючки   Травяной щит	14	Самцы: 50% Самки: 50% 	13871	303	48.3	40	30	35	55	50	70	280
637	Роузрейд	https://www.orthrusonline.ru/static/images/p/nextgen/roserade.png	roserade	\N	1	0.9	14.5	1	Естественное исцеление   Ядовитые колючки   Техничность	14	Самцы: 50% Самки: 50% 	110	35	99.2	60	70	65	90	125	105	515
638	Крэнидос	https://www.orthrusonline.ru/static/images/p/nextgen/cranidos.png	cranidos	\N	93	0.9	31.5	5	Разрыв шаблона   Грубая сила	20	Самцы: 87.5% Самки: 12.5% 	250	79	99.1	67	125	40	58	30	30	350
639	Рампардос	https://www.orthrusonline.ru/static/images/p/nextgen/rampardos.png	rampardos	\N	93	1.6	102.5	5	Разрыв шаблона   Грубая сила	20	Самцы: 87.5% Самки: 12.5% 	604	24	98.3	97	165	60	58	65	50	495
640	Шилдон	https://www.orthrusonline.ru/static/images/p/nextgen/shieldon.png	shieldon	\N	155	0.5	57	5	Стойкость   Звуконепроницаемость	20	Самцы: 87.5% Самки: 12.5% 	503	1	97.9	30	42	118	30	42	88	350
641	Бастиодон	https://www.orthrusonline.ru/static/images/p/nextgen/bastiodon.png	bastiodon	\N	155	1.3	149.5	5	Стойкость   Звуконепроницаемость	20	Самцы: 87.5% Самки: 12.5% 	156	2	99	60	52	168	30	47	138	495
642	Бурми	https://www.orthrusonline.ru/static/images/p/nextgen/burmy.png	burmy	\N	120	0.2	3.4	2	Сбрасывание кожи   Пыленепроницаемость	10	Самцы: 50% Самки: 50% 	6851	34	79.8	40	29	45	36	29	45	224
643	Вормадам	https://www.orthrusonline.ru/static/images/p/nextgen/wormadam.png	wormadam	\N	123	0.5	6.5	2	Предвидение   Пыленепроницаемость	10	Только самки	1547	30	90.6	60	59	85	36	79	105	424
644	Мотим	https://www.orthrusonline.ru/static/images/p/nextgen/mothim.png	mothim	\N	5	0.9	23.3	2	Роение   Тонированные линзы	10	Только самцы	1281	41	92.8	70	94	50	66	94	50	424
645	Комби	https://www.orthrusonline.ru/static/images/p/nextgen/combee.png	combee	\N	5	0.3	5.5	1	Сбор мёда   Энергичность	10	Самцы: 87.5% Самки: 12.5% 	5307	10	87.6	30	30	42	70	30	42	244
646	Веспиквин	https://www.orthrusonline.ru/static/images/p/nextgen/vespiquen.png	vespiquen	\N	5	1.2	38.5	1	Давление   Нервирование	10	Только самки	246	8	98.1	70	80	102	40	80	102	474
647	Пачирису	https://www.orthrusonline.ru/static/images/p/nextgen/pachirisu.png	pachirisu	\N	9	0.4	3.9	2	Бегство   Сбор предметов   Поглощение электричества	7	Самцы: 50% Самки: 50% 	13573	82	58.8	60	45	70	95	45	90	405
648	Буизель	https://www.orthrusonline.ru/static/images/p/nextgen/buizel.png	buizel	\N	4	0.7	29.5	2	Быстрое плаванье   Водяные покровы	14	Самцы: 50% Самки: 50% 	14938	100	73.2	55	65	35	85	60	30	330
649	Флотзел	https://www.orthrusonline.ru/static/images/p/nextgen/floatzel.png	floatzel	\N	4	1.1	33.5	2	Быстрое плаванье   Водяные покровы	14	Самцы: 50% Самки: 50% 	4030	114	82.6	85	105	55	115	85	50	495
650	Черуби	https://www.orthrusonline.ru/static/images/p/nextgen/cherubi.png	cherubi	\N	64	0.4	3.3	2	Хлорофилл	14	Самцы: 50% Самки: 50% 	9317	204	74.4	45	35	45	35	62	53	275
651	Черрим	https://www.orthrusonline.ru/static/images/p/nextgen/cherrim.png	cherrim	\N	64	0.5	9.3	2	Дар цветов	14	Самцы: 50% Самки: 50% 	1042	49	93.2	70	60	70	85	87	78	450
652	Шеллос	https://www.orthrusonline.ru/static/images/p/nextgen/shellos.png	shellos	\N	4	0.3	6.3	2	Липкий захват   Водоотвод   Сила песка	14	Самцы: 50% Самки: 50% 	27316	268	76.9	76	48	48	34	57	62	325
653	Гастродон	https://www.orthrusonline.ru/static/images/p/nextgen/gastrodon.png	gastrodon	\N	52	0.9	29.9	2	Липкий захват   Водоотвод   Сила песка	14	Самцы: 50% Самки: 50% 	21816	153	61.1	111	83	68	39	92	82	475
654	Эмбипом	https://www.orthrusonline.ru/static/images/p/nextgen/ambipom.png	ambipom	\N	17	1.2	20.3	4	Техничность   Сбор предметов   Развитие навыка	14	Самцы: 50% Самки: 50% 	1074	35	95.5	75	100	66	115	60	66	482
655	Дрифлун	https://www.orthrusonline.ru/static/images/p/nextgen/drifloon.png	drifloon	\N	92	0.4	1.2	6	Детонация   Освобождение   Вспышка ярости	20	Самцы: 50% Самки: 50% 	10869	26	83.6	90	50	34	70	60	44	348
656	Дрифблим	https://www.orthrusonline.ru/static/images/p/nextgen/drifblim.png	drifblim	\N	92	1.2	15	6	Детонация   Освобождение   Вспышка ярости	20	Самцы: 50% Самки: 50% 	3463	59	88.2	150	80	44	80	90	54	498
657	Банири	https://www.orthrusonline.ru/static/images/p/nextgen/buneary.png	buneary	\N	17	0.4	5.5	2	Бегство   Неуклюжесть   Гибкость	14	Самцы: 50% Самки: 50% 	27557	324	50	55	66	44	85	44	56	350
658	Лопанни	https://www.orthrusonline.ru/static/images/p/nextgen/lopunny.png	lopunny	\N	17	1.2	33.3	2	Очарование   Неуклюжесть   Гибкость	14	Самцы: 50% Самки: 50% 	691	41	95.4	65	76	84	105	54	96	480
659	Мисмагиус	https://www.orthrusonline.ru/static/images/p/nextgen/mismagius.png	mismagius	\N	48	0.9	4.4	4	Левитация	17	Самцы: 50% Самки: 50% 	90	11	99.3	60	60	60	105	105	105	495
660	Ханчкроу	https://www.orthrusonline.ru/static/images/p/nextgen/honchkrow.png	honchkrow	\N	39	0.9	27.3	1	Бессонница   Сверхудачливость   Ловкость	14	Самцы: 50% Самки: 50% 	85	14	99.4	100	125	52	71	105	52	505
661	Глэймяу	https://www.orthrusonline.ru/static/images/p/nextgen/glameow.png	glameow	\N	17	0.5	3.9	4	Гибкость   Собственный темп   Острый глаз	14	Самцы: 25% Самки: 75% 	7940	107	75.8	49	55	42	85	42	37	310
662	Парагли	https://www.orthrusonline.ru/static/images/p/nextgen/purugly.png	purugly	\N	17	1	43.8	4	Толстая кожа   Собственный темп   Непокорность	14	Самцы: 25% Самки: 75% 	627	31	95.2	71	82	64	112	64	59	452
663	Чинлинг	https://www.orthrusonline.ru/static/images/p/nextgen/chingling.png	chingling	\N	19	0.2	0.6	4	Левитация	17	Самцы: 50% Самки: 50% 	5370	61	73	45	30	50	45	65	50	285
664	Станки	https://www.orthrusonline.ru/static/images/p/nextgen/stunky.png	stunky	\N	25	0.4	19.2	2	Зловоние   Детонация   Острый глаз	14	Самцы: 50% Самки: 50% 	12939	247	69.2	63	63	47	74	41	41	329
665	Скантанк	https://www.orthrusonline.ru/static/images/p/nextgen/skuntank.png	skuntank	\N	25	1	38	2	Зловоние   Детонация   Острый глаз	14	Самцы: 50% Самки: 50% 	1920	87	89.5	103	93	67	84	71	61	479
666	Бронзор	https://www.orthrusonline.ru/static/images/p/nextgen/bronzor.png	bronzor	\N	60	0.5	60.5	2	Левитация   Жаропрочность   Увеличение веса	14	Бесполые	6140	33	81.2	57	24	86	23	24	86	300
667	Бронзонг	https://www.orthrusonline.ru/static/images/p/nextgen/bronzong.png	bronzong	\N	60	1.3	187	2	Левитация   Жаропрочность   Увеличение веса	14	Бесполые	3734	66	90	67	89	116	33	79	116	500
668	Бонслай	https://www.orthrusonline.ru/static/images/p/nextgen/bonsly.png	bonsly	\N	93	0.5	15	2	Стойкость   Каменная голова   Нервозность	14	Самцы: 50% Самки: 50% 	1492	5	96	50	80	95	10	10	45	290
669	Майм Мл	https://www.orthrusonline.ru/static/images/p/nextgen/mimejr.png	mimejr	\N	22	0.6	13	2	Звуконепроницаемость   Фильтрация   Техничность	17	Самцы: 50% Самки: 50% 	6090	58	80.5	20	25	45	60	70	90	310
670	Хэппини	https://www.orthrusonline.ru/static/images/p/nextgen/happiny.png	happiny	\N	17	0.6	24.4	4	Естественное исцеление   Небесное благословение   Защита товарища	27	Самцы: 12.5% Самки: 87.5% 	649	2	98.2	100	5	5	30	15	65	220
671	Чатот	https://www.orthrusonline.ru/static/images/p/nextgen/chatot.png	chatot	\N	7	0.5	1.9	1	Острый глаз   Косолапость   Большие клевки	14	Самцы: 50% Самки: 50% 	13399	149	72.5	76	65	45	91	92	42	411
672	Спиритомб	https://www.orthrusonline.ru/static/images/p/nextgen/spiritomb.png	spiritomb	\N	156	1	108	2	Давление   Проскальзывание	20	Самцы: 50% Самки: 50% 	1404	24	96.7	50	92	108	35	92	108	485
673	Гибл	https://www.orthrusonline.ru/static/images/p/nextgen/gible.png	gible	\N	66	0.7	20.5	3	Песчаный покров   Грубая кожа	27	Самцы: 50% Самки: 50% 	449	7	98.5	58	70	45	42	40	45	300
674	Габайт	https://www.orthrusonline.ru/static/images/p/nextgen/gabite.png	gabite	\N	66	1.4	56	3	Песчаный покров   Грубая кожа	27	Самцы: 50% Самки: 50% 	39	1	99.7	68	90	65	82	50	55	410
675	Гарчомп	https://www.orthrusonline.ru/static/images/p/nextgen/garchomp.png	garchomp	\N	66	1.9	95	3	Песчаный покров   Грубая кожа	27	Самцы: 50% Самки: 50% 	223	36	98.3	108	130	95	102	80	85	600
676	Манчлакс	https://www.orthrusonline.ru/static/images/p/nextgen/munchlax.png	munchlax	\N	17	0.6	105	3	Сбор предметов   Толстая кожа   Прожорливость	27	Самцы: 87.5% Самки: 12.5% 	275	11	98.8	135	85	40	5	40	85	390
731	Ошавот	https://www.orthrusonline.ru/static/images/p/nextgen/oshawott.png	oshawott	\N	4	0.5	5.9	1	Всплеск   Панцирь-броня	14	Самцы: 87.5% Самки: 12.5% 	1339	632	96.4	55	55	45	45	63	45	308
677	Риолу	https://www.orthrusonline.ru/static/images/p/nextgen/riolu.png	riolu	\N	20	0.7	20.2	1	Неукротимость   Концентрация   Проказник	17	Самцы: 87.5% Самки: 12.5% 	961	7	95.3	40	70	40	60	35	40	285
678	Лукарио	https://www.orthrusonline.ru/static/images/p/nextgen/lucario.png	lucario	\N	67	1.2	54	1	Неукротимость   Концентрация   Сердце правосудия	17	Самцы: 87.5% Самки: 12.5% 	1521	52	95.3	70	110	70	90	115	70	525
679	Гиппопотас	https://www.orthrusonline.ru/static/images/p/nextgen/hippopotas.png	hippopotas	\N	100	0.8	49.5	3	Пробуждение песков   Сила песка	20	Самцы: 50% Самки: 50% 	5645	5	92.9	68	72	78	32	38	42	330
680	Гипподон	https://www.orthrusonline.ru/static/images/p/nextgen/hippowdon.png	hippowdon	\N	100	2	300	3	Пробуждение песков   Сила песка	20	Самцы: 50% Самки: 50% 	4820	20	93	108	112	118	47	68	72	525
681	Скорупи	https://www.orthrusonline.ru/static/images/p/nextgen/skorupi.png	skorupi	\N	157	0.8	12	3	Боевая броня   Снайпер   Острый глаз	14	Самцы: 50% Самки: 50% 	9138	13	90.9	40	50	90	65	30	55	330
682	Драпион	https://www.orthrusonline.ru/static/images/p/nextgen/drapion.png	drapion	\N	25	1.3	61.5	3	Боевая броня   Снайпер   Острый глаз	14	Самцы: 50% Самки: 50% 	405	13	97	70	90	110	95	60	75	500
683	Кроганк	https://www.orthrusonline.ru/static/images/p/nextgen/croagunk.png	croagunk	\N	158	0.7	23	2	Предвидение   Сухая кожа   Ядовитое касание	7	Самцы: 50% Самки: 50% 	25301	211	67.2	48	61	40	50	61	40	300
684	Токсикроук	https://www.orthrusonline.ru/static/images/p/nextgen/toxicroak.png	toxicroak	\N	158	1.3	44.4	2	Предвидение   Сухая кожа   Ядовитое касание	14	Самцы: 50% Самки: 50% 	7133	139	76.5	83	106	65	85	86	65	490
685	Карнивайн	https://www.orthrusonline.ru/static/images/p/nextgen/carnivine.png	carnivine	\N	64	1.4	27	3	Левитация	17	Самцы: 50% Самки: 50% 	3022	23	88.8	74	100	72	46	90	72	454
686	Финнеон	https://www.orthrusonline.ru/static/images/p/nextgen/finneon.png	finneon	\N	4	0.4	7	5	Быстрое плаванье   Водоотвод   Водяные покровы	14	Самцы: 50% Самки: 50% 	3392	29	93.1	49	49	56	66	49	61	330
687	Люминеон	https://www.orthrusonline.ru/static/images/p/nextgen/lumineon.png	lumineon	\N	4	1.2	24	5	Быстрое плаванье   Водоотвод   Водяные покровы	14	Самцы: 50% Самки: 50% 	1873	21	93.7	69	69	76	91	69	86	460
688	Мантайк	https://www.orthrusonline.ru/static/images/p/nextgen/mantyke.png	mantyke	\N	129	1	65	3	Быстрое плаванье   Поглощение воды   Водяные покровы	17	Самцы: 50% Самки: 50% 	840	1	96.7	45	20	50	50	60	120	345
689	Сновер	https://www.orthrusonline.ru/static/images/p/nextgen/snover.png	snover	\N	68	1	50.5	3	Снежная тревога   Звуконепроницаемость	14	Самцы: 50% Самки: 50% 	11559	472	87.5	60	62	50	40	62	60	334
690	Абомасноу	https://www.orthrusonline.ru/static/images/p/nextgen/abomasnow.png	abomasnow	\N	68	2.2	135.5	3	Снежная тревога   Звуконепроницаемость	14	Самцы: 50% Самки: 50% 	5963	182	87.8	90	92	75	60	92	85	494
691	Вивайл	https://www.orthrusonline.ru/static/images/p/nextgen/weavile.png	weavile	\N	137	1.1	34	1	Давление   Карманный вор	14	Самцы: 50% Самки: 50% 	457	39	97.3	70	120	65	125	45	85	510
692	Магнезон	https://www.orthrusonline.ru/static/images/p/nextgen/magnezone.png	magnezone	\N	126	1.2	180	2	Магнитное притяжение   Стойкость   Анализ	14	Бесполые	533	46	97	70	70	115	60	130	90	535
693	Ликилики	https://www.orthrusonline.ru/static/images/p/nextgen/lickilicky.png	lickilicky	\N	17	1.7	140	2	Собственный темп   Забвение   Девятое небо	14	Самцы: 50% Самки: 50% 	584	5	98.1	110	85	95	50	80	95	515
694	Райпериор	https://www.orthrusonline.ru/static/images/p/nextgen/rhyperior.png	rhyperior	\N	128	2.4	282.8	3	Громоотвод   Твердый камень   Опрометчивость	14	Самцы: 50% Самки: 50% 	225	16	98.5	115	140	130	40	55	55	535
695	Тангроуз	https://www.orthrusonline.ru/static/images/p/nextgen/tangrowth.png	tangrowth	\N	64	2	128.6	2	Хлорофилл   Травяной щит   Регенерация	14	Самцы: 50% Самки: 50% 	1374	30	93.8	100	100	125	50	110	50	535
696	Элективайр	https://www.orthrusonline.ru/static/images/p/nextgen/electivire.png	electivire	\N	9	1.8	138.6	2	Разогрев мотора   Подъём духа	17	Самцы: 75% Самки: 25% 	143	22	98.9	75	123	67	95	95	85	540
697	Магмотар	https://www.orthrusonline.ru/static/images/p/nextgen/magmortar.png	magmortar	\N	58	1.6	68	2	Огненное тело   Подъём духа	17	Самцы: 75% Самки: 25% 	105	10	99.2	75	95	67	83	125	95	540
698	Тогекисс	https://www.orthrusonline.ru/static/images/p/nextgen/togekiss.png	togekiss	\N	116	1.5	38	4	Энергичность   Небесное благословение   Сверхудачливость	7	Самцы: 87.5% Самки: 12.5% 	141	33	99	85	50	95	80	120	115	545
699	Янмега	https://www.orthrusonline.ru/static/images/p/nextgen/yanmega.png	yanmega	\N	5	1.9	51.5	2	Ускорение   Тонированные линзы   Обыскивание	14	Самцы: 50% Самки: 50% 	2074	29	91.5	86	76	86	95	116	56	515
700	Лифеон	https://www.orthrusonline.ru/static/images/p/nextgen/leafeon.png	leafeon	\N	64	1	25.5	2	Травяной щит   Хлорофилл	24	Самцы: 87.5% Самки: 12.5% 	1263	13	96.5	65	110	130	95	60	65	525
701	Глэсеон	https://www.orthrusonline.ru/static/images/p/nextgen/glaceon.png	glaceon	\N	12	0.8	25.9	2	Снежные покровы   Ледяное тело	24	Самцы: 87.5% Самки: 12.5% 	2395	20	95.5	65	60	110	65	130	95	525
702	Глайскор	https://www.orthrusonline.ru/static/images/p/nextgen/gliscor.png	gliscor	\N	84	2	42.5	1	Суперсильные когти   Песчаный покров   Лечение ядом	14	Самцы: 50% Самки: 50% 	1299	52	95.3	75	95	125	95	45	75	510
703	Мамосвайн	https://www.orthrusonline.ru/static/images/p/nextgen/mamoswine.png	mamoswine	\N	138	2.5	291	3	Забвение   Снежные покровы   Толстая кожа	14	Самцы: 50% Самки: 50% 	594	21	95.7	110	130	80	80	70	60	530
704	Поригон-Z	https://www.orthrusonline.ru/static/images/p/nextgen/porygonz.png	porygonz	\N	17	0.9	34	2	Адаптация   Загрузка   Анализ	14	Бесполые	252	76	98.3	85	80	70	90	135	75	535
705	Галлэйд	https://www.orthrusonline.ru/static/images/p/nextgen/gallade.png	gallade	\N	40	1.6	52	3	Неукротимость   Сметливость   Сердце правосудия	14	Только самцы	187	22	98.6	68	125	65	80	65	115	518
706	Пробопасс	https://www.orthrusonline.ru/static/images/p/nextgen/probopass.png	probopass	\N	155	1.4	340	2	Стойкость   Магнитное притяжение   Сила песка	14	Самцы: 50% Самки: 50% 	87	4	99.4	60	55	145	40	75	150	525
707	Даскнуар	https://www.orthrusonline.ru/static/images/p/nextgen/dusknoir.png	dusknoir	\N	48	2.2	106.6	4	Давление   Обыскивание	17	Самцы: 50% Самки: 50% 	699	14	98.4	45	100	135	45	65	135	525
708	Фросласс	https://www.orthrusonline.ru/static/images/p/nextgen/froslass.png	froslass	\N	159	1.3	26.6	2	Снежные покровы   Проклятое тело	14	Только самки	98	11	99.2	70	80	70	110	80	70	480
709	Ротом	https://www.orthrusonline.ru/static/images/p/nextgen/rotom.png	rotom	\N	160	0.3	0.3	2	Левитация	14	Бесполые	1763	12	96.3	50	50	77	91	95	77	440
710	Юкси	https://www.orthrusonline.ru/static/images/p/nextgen/uxie.png	uxie	\N	19	0.3	0.3	3	Левитация	54	Бесполые	41	3	99.7	75	75	130	95	75	130	580
711	Месприт	https://www.orthrusonline.ru/static/images/p/nextgen/mesprit.png	mesprit	\N	19	0.3	0.3	3	Левитация	54	Бесполые	41	1	99.7	80	105	105	80	105	105	580
712	Азелф	https://www.orthrusonline.ru/static/images/p/nextgen/azelf.png	azelf	\N	19	0.3	0.3	3	Левитация	54	Бесполые	46	8	99.7	75	125	70	115	125	70	580
713	Диалга	https://www.orthrusonline.ru/static/images/p/nextgen/dialga.png	dialga	\N	73	5.4	683	3	Давление   Телепатия	80	Бесполые	24	8	99.8	100	120	120	90	150	100	680
714	Палкия	https://www.orthrusonline.ru/static/images/p/nextgen/palkia.png	palkia	\N	74	4.2	336	3	Давление   Телепатия	80	Бесполые	18	3	99.9	90	120	100	100	150	120	680
715	Хитран	https://www.orthrusonline.ru/static/images/p/nextgen/heatran.png	heatran	\N	161	1.7	430	3	Вспышка пламени   Огненное тело	80	Самцы: 50% Самки: 50% 	26	10	99.8	91	90	106	77	130	106	600
716	Реджигигас	https://www.orthrusonline.ru/static/images/p/nextgen/regigigas.png	regigigas	\N	17	3.7	420	3	Медленный старт	80	Бесполые	24	0	99.8	110	160	110	100	80	110	670
717	Гиратина	https://www.orthrusonline.ru/static/images/p/nextgen/giratina.png	giratina	\N	75	4.5	750	3	Давление   Телепатия	80	Бесполые	22	9	99.8	150	100	120	90	100	120	680
718	Кресселия	https://www.orthrusonline.ru/static/images/p/nextgen/cresselia.png	cresselia	\N	19	1.5	85.6	3	Левитация	80	Только самки	29	6	99.8	120	70	120	85	75	130	600
719	Фион	https://www.orthrusonline.ru/static/images/p/nextgen/phione.png	phione	\N	4	0.4	3.1	3	Гидрирование	27	Бесполые	71	3	99.5	80	80	80	80	80	80	480
720	Манафи	https://www.orthrusonline.ru/static/images/p/nextgen/manaphy.png	manaphy	\N	4	0.3	1.4	3	Гидрирование	80	Бесполые	76	45	99.6	100	100	100	100	100	100	600
721	Даркрай	https://www.orthrusonline.ru/static/images/p/nextgen/darkrai.png	darkrai	\N	15	1.5	50.5	3	Манипуляции сном	80	Бесполые	38	7	99.7	70	90	90	125	135	90	600
722	Шеймин	https://www.orthrusonline.ru/static/images/p/nextgen/shaymin.png	shaymin	\N	64	0.2	2.1	1	Естественное исцеление	80	Бесполые	54	20	99.6	100	100	100	100	100	100	600
723	Арсеус	https://www.orthrusonline.ru/static/images/p/nextgen/arceus.png	arceus	\N	17	3.2	320	3	Мультитип	80	Бесполые	37	9	99.8	120	120	120	120	120	120	720
724	Виктини	https://www.orthrusonline.ru/static/images/p/nextgen/victini.png	victini	\N	162	0.4	4	3	Звезда победы	80	Бесполые	35	17	99.7	100	100	100	100	100	100	600
725	Снайви	https://www.orthrusonline.ru/static/images/p/nextgen/snivy.png	snivy	\N	64	0.6	8.1	1	Сверхрост   Порочность	14	Самцы: 87.5% Самки: 12.5% 	1826	701	93.9	45	45	55	63	45	55	308
726	Сервайн	https://www.orthrusonline.ru/static/images/p/nextgen/servine.png	servine	\N	64	0.8	16	1	Сверхрост   Порочность	14	Самцы: 87.5% Самки: 12.5% 	552	20	95.5	60	60	75	83	60	75	413
727	Серпериор	https://www.orthrusonline.ru/static/images/p/nextgen/serperior.png	serperior	\N	64	3.3	63	1	Сверхрост   Порочность	14	Самцы: 87.5% Самки: 12.5% 	672	126	94.7	75	75	95	113	75	95	528
728	Тепиг	https://www.orthrusonline.ru/static/images/p/nextgen/tepig.png	tepig	\N	58	0.5	9.9	1	Яростное пламя   Толстая кожа	14	Самцы: 87.5% Самки: 12.5% 	930	51	96.1	65	63	45	45	45	45	308
729	Пигнайт	https://www.orthrusonline.ru/static/images/p/nextgen/pignite.png	pignite	\N	51	1	55.5	1	Яростное пламя   Толстая кожа	14	Самцы: 87.5% Самки: 12.5% 	235	4	98.1	90	93	55	55	70	55	418
730	Эмбор	https://www.orthrusonline.ru/static/images/p/nextgen/emboar.png	emboar	\N	51	1.6	150	1	Яростное пламя   Опрометчивость	14	Самцы: 87.5% Самки: 12.5% 	247	17	98	110	123	65	65	100	65	528
732	Дьювотт	https://www.orthrusonline.ru/static/images/p/nextgen/dewott.png	dewott	\N	4	0.8	24.5	1	Всплеск   Панцирь-броня	14	Самцы: 87.5% Самки: 12.5% 	302	18	97.5	75	75	60	60	83	60	413
733	Самурот	https://www.orthrusonline.ru/static/images/p/nextgen/samurott.png	samurott	\N	4	1.5	94.6	1	Всплеск   Панцирь-броня	14	Самцы: 87.5% Самки: 12.5% 	300	44	97.5	95	100	85	70	108	70	528
734	Патрат	https://www.orthrusonline.ru/static/images/p/nextgen/patrat.png	patrat	\N	17	0.5	11.6	2	Бегство   Острый глаз   Анализ	10	Самцы: 50% Самки: 50% 	6721	191	82	45	55	39	42	35	39	255
735	Вачог	https://www.orthrusonline.ru/static/images/p/nextgen/watchog.png	watchog	\N	17	1.1	27	2	Свечение   Острый глаз   Анализ	14	Самцы: 50% Самки: 50% 	22765	138	87.9	60	85	69	77	60	69	420
736	Лилипап	https://www.orthrusonline.ru/static/images/p/nextgen/lillipup.png	lillipup	\N	17	0.4	4.1	1	Подъём духа   Сбор предметов   Бегство	10	Самцы: 50% Самки: 50% 	9360	27	81.3	45	60	45	55	25	45	275
737	Хардиер	https://www.orthrusonline.ru/static/images/p/nextgen/herdier.png	herdier	\N	17	0.9	14.7	1	Запугивание   Песчаная гонка   Дерзость	10	Самцы: 50% Самки: 50% 	2313	16	91.7	65	80	65	60	35	65	370
738	Стаутлэнд	https://www.orthrusonline.ru/static/images/p/nextgen/stoutland.png	stoutland	\N	17	1.2	61	1	Запугивание   Песчаная гонка   Дерзость	10	Самцы: 50% Самки: 50% 	444	11	96.5	85	110	90	80	45	90	500
739	Пурлойн	https://www.orthrusonline.ru/static/images/p/nextgen/purrloin.png	purrloin	\N	15	0.4	10.1	2	Гибкость   Освобождение   Проказник	14	Самцы: 50% Самки: 50% 	5360	26	88.6	41	50	37	66	50	37	281
740	Лайпард	https://www.orthrusonline.ru/static/images/p/nextgen/liepard.png	liepard	\N	15	1.1	37.5	2	Гибкость   Освобождение   Проказник	14	Самцы: 50% Самки: 50% 	8451	77	87	64	88	50	106	88	50	446
741	Пансейж	https://www.orthrusonline.ru/static/images/p/nextgen/pansage.png	pansage	\N	64	0.6	10.5	2	Прожорливость   Сверхрост	14	Самцы: 87.5% Самки: 12.5% 	2708	39	93.7	50	53	48	64	53	48	316
742	Симисейж	https://www.orthrusonline.ru/static/images/p/nextgen/simisage.png	simisage	\N	64	1.1	30.5	2	Прожорливость   Сверхрост	14	Самцы: 87.5% Самки: 12.5% 	90	7	99.3	75	98	63	101	98	63	498
743	Пансир	https://www.orthrusonline.ru/static/images/p/nextgen/pansear.png	pansear	\N	58	0.6	11	2	Прожорливость   Яростное пламя	14	Самцы: 87.5% Самки: 12.5% 	1526	14	96.2	50	53	48	64	53	48	316
744	Симисир	https://www.orthrusonline.ru/static/images/p/nextgen/simisear.png	simisear	\N	58	1	28	2	Прожорливость   Яростное пламя	14	Самцы: 87.5% Самки: 12.5% 	50	8	99.6	75	98	63	101	98	63	498
745	Панпур	https://www.orthrusonline.ru/static/images/p/nextgen/panpour.png	panpour	\N	4	0.6	13.5	2	Прожорливость   Всплеск	14	Самцы: 87.5% Самки: 12.5% 	3585	30	93.8	50	53	48	64	53	48	316
746	Симипур	https://www.orthrusonline.ru/static/images/p/nextgen/simipour.png	simipour	\N	4	1	29	2	Прожорливость   Всплеск	14	Самцы: 87.5% Самки: 12.5% 	68	7	99.5	75	98	63	101	98	63	498
747	Мунна	https://www.orthrusonline.ru/static/images/p/nextgen/munna.png	munna	\N	19	0.6	23.3	4	Оповещение   Синхронизация   Телепатия	7	Самцы: 50% Самки: 50% 	726	3	98.7	76	25	45	24	67	55	292
748	Мушарна	https://www.orthrusonline.ru/static/images/p/nextgen/musharna.png	musharna	\N	19	1.1	60.5	4	Оповещение   Синхронизация   Телепатия	7	Самцы: 50% Самки: 50% 	29	3	99.8	116	55	85	29	107	95	487
749	Пидав	https://www.orthrusonline.ru/static/images/p/nextgen/pidove.png	pidove	\N	7	0.3	2.1	1	Большие клевки   Сверхудачливость   Соперничество	10	Самцы: 50% Самки: 50% 	733	3	98.2	50	55	50	43	36	30	264
750	Транквил	https://www.orthrusonline.ru/static/images/p/nextgen/tranquill.png	tranquill	\N	7	0.6	15	1	Большие клевки   Сверхудачливость   Соперничество	10	Самцы: 50% Самки: 50% 	2783	4	91.7	62	77	62	65	50	42	358
751	Анфезант	https://www.orthrusonline.ru/static/images/p/nextgen/unfezant.png	unfezant	\N	7	1.2	29	1	Большие клевки   Сверхудачливость   Соперничество	10	Самцы: 50% Самки: 50% 	206	4	98.5	80	115	80	93	65	55	488
752	Блицл	https://www.orthrusonline.ru/static/images/p/nextgen/blitzle.png	blitzle	\N	9	0.8	29.8	2	Громоотвод   Разогрев мотора   Поглотитель соков	14	Самцы: 50% Самки: 50% 	1428	5	96.6	45	60	32	76	50	32	295
753	Зебстрайка	https://www.orthrusonline.ru/static/images/p/nextgen/zebstrika.png	zebstrika	\N	9	1.6	79.5	2	Громоотвод   Разогрев мотора   Поглотитель соков	14	Самцы: 50% Самки: 50% 	146	8	98.8	75	100	63	116	80	63	497
754	Роггенрола	https://www.orthrusonline.ru/static/images/p/nextgen/roggenrola.png	roggenrola	\N	93	0.4	18	1	Стойкость   Слабая броня   Сила песка	10	Самцы: 50% Самки: 50% 	11923	12	92	55	75	85	15	25	25	280
755	Болдор	https://www.orthrusonline.ru/static/images/p/nextgen/boldore.png	boldore	\N	93	0.9	102	1	Стойкость   Слабая броня   Сила песка	10	Самцы: 50% Самки: 50% 	9733	31	75.4	70	105	105	20	50	40	390
756	Гигалит	https://www.orthrusonline.ru/static/images/p/nextgen/gigalith.png	gigalith	\N	93	1.7	260	1	Стойкость   Пробуждение песков   Сила песка	10	Самцы: 50% Самки: 50% 	1271	28	91.7	85	135	130	25	60	80	515
834	Иллектрос	https://www.orthrusonline.ru/static/images/p/nextgen/eelektross.png	eelektross	\N	9	2.1	80.5	3	Левитация	14	Самцы: 50% Самки: 50% 	63	8	99.5	85	115	80	50	105	80	515
757	Вубат	https://www.orthrusonline.ru/static/images/p/nextgen/woobat.png	woobat	\N	37	0.4	2.1	2	Безразличие   Неуклюжесть   Простота	10	Самцы: 50% Самки: 50% 	3161	25	94.5	65	45	43	72	55	43	323
758	Свубат	https://www.orthrusonline.ru/static/images/p/nextgen/swoobat.png	swoobat	\N	37	0.9	10.5	2	Безразличие   Неуклюжесть   Простота	10	Самцы: 50% Самки: 50% 	2996	22	90.6	67	57	55	114	77	55	425
759	Дрилбур	https://www.orthrusonline.ru/static/images/p/nextgen/drilbur.png	drilbur	\N	100	0.3	8.5	2	Песчаная гонка   Сила песка   Разрыв шаблона	14	Самцы: 50% Самки: 50% 	2084	4	97.1	60	85	40	68	30	45	328
760	Эскадрил	https://www.orthrusonline.ru/static/images/p/nextgen/excadrill.png	excadrill	\N	14	0.7	40.4	2	Песчаная гонка   Сила песка   Разрыв шаблона	14	Самцы: 50% Самки: 50% 	298	26	98	110	135	60	88	50	65	508
761	Аудино	https://www.orthrusonline.ru/static/images/p/nextgen/audino.png	audino	\N	17	1.1	31	4	Исцеление   Регенерация   Неуклюжесть	14	Самцы: 50% Самки: 50% 	14070	8	93.4	103	60	86	50	60	86	445
762	Тимбур	https://www.orthrusonline.ru/static/images/p/nextgen/timburr.png	timburr	\N	20	0.6	12.5	1	Сила воли   Грубая сила   Железный кулак	14	Самцы: 75% Самки: 25% 	287	2	98.6	75	80	55	35	25	35	305
763	Гурдур	https://www.orthrusonline.ru/static/images/p/nextgen/gurdurr.png	gurdurr	\N	20	1.2	40	1	Сила воли   Грубая сила   Железный кулак	14	Самцы: 75% Самки: 25% 	40	0	99.7	85	105	85	40	40	50	405
764	Конкельдур	https://www.orthrusonline.ru/static/images/p/nextgen/conkeldurr.png	conkeldurr	\N	20	1.4	87	1	Сила воли   Грубая сила   Железный кулак	14	Самцы: 75% Самки: 25% 	166	18	98.7	105	140	95	45	55	65	505
765	Тимпол	https://www.orthrusonline.ru/static/images/p/nextgen/tympole.png	tympole	\N	4	0.5	4.5	1	Быстрое плаванье   Гидрирование   Поглощение воды	14	Самцы: 50% Самки: 50% 	4263	5	95.5	50	50	40	64	50	40	294
766	Палпитод	https://www.orthrusonline.ru/static/images/p/nextgen/palpitoad.png	palpitoad	\N	52	0.8	17	1	Быстрое плаванье   Гидрирование   Поглощение воды	14	Самцы: 50% Самки: 50% 	2305	4	94.2	75	65	55	69	65	55	384
767	Сейсмитод	https://www.orthrusonline.ru/static/images/p/nextgen/seismitoad.png	seismitoad	\N	52	1.5	62	1	Быстрое плаванье   Ядовитое касание   Поглощение воды	14	Самцы: 50% Самки: 50% 	233	6	98.2	105	95	75	74	85	75	509
768	Троу	https://www.orthrusonline.ru/static/images/p/nextgen/throh.png	throh	\N	20	1.3	55.5	2	Сила воли   Концентрация   Разрыв шаблона	14	Только самцы	185	37	99.1	120	100	85	45	30	85	465
769	Соук	https://www.orthrusonline.ru/static/images/p/nextgen/sawk.png	sawk	\N	20	1.4	51	2	Стойкость   Концентрация   Разрыв шаблона	14	Только самцы	58	8	99.6	75	125	75	85	30	75	465
770	Сивадл	https://www.orthrusonline.ru/static/images/p/nextgen/sewaddle.png	sewaddle	\N	123	0.3	2.5	1	Роение   Хлорофилл   Пыленепроницаемость	10	Самцы: 50% Самки: 50% 	772	2	98.5	45	53	70	42	40	60	310
771	Свадлун	https://www.orthrusonline.ru/static/images/p/nextgen/swadloon.png	swadloon	\N	123	0.5	7.3	1	Травяной щит   Хлорофилл   Пыленепроницаемость	10	Самцы: 50% Самки: 50% 	1115	1	96.9	55	63	90	42	50	80	380
772	Ливанни	https://www.orthrusonline.ru/static/images/p/nextgen/leavanny.png	leavanny	\N	123	1.2	20.5	1	Роение   Хлорофилл   Пыленепроницаемость	10	Самцы: 50% Самки: 50% 	687	6	98.2	75	103	80	92	70	80	500
773	Венипид	https://www.orthrusonline.ru/static/images/p/nextgen/venipede.png	venipede	\N	6	0.4	5.3	1	Ядовитые колючки   Роение   Ускорение	10	Самцы: 50% Самки: 50% 	6753	19	91.4	30	45	59	57	30	39	260
774	Вирлипид	https://www.orthrusonline.ru/static/images/p/nextgen/whirlipede.png	whirlipede	\N	6	1.2	58.5	1	Ядовитые колючки   Роение   Ускорение	10	Самцы: 50% Самки: 50% 	105	1	99.2	40	55	99	47	40	79	360
775	Сколипид	https://www.orthrusonline.ru/static/images/p/nextgen/scolipede.png	scolipede	\N	6	2.5	200.5	1	Ядовитые колючки   Роение   Ускорение	14	Самцы: 50% Самки: 50% 	360	15	97.3	60	100	89	112	55	69	485
776	Котони	https://www.orthrusonline.ru/static/images/p/nextgen/cottonee.png	cottonee	\N	163	0.3	0.6	2	Проказник   Проскальзывание   Хлорофилл	14	Самцы: 50% Самки: 50% 	14418	87	87	40	27	60	66	37	50	280
777	Вимсикот	https://www.orthrusonline.ru/static/images/p/nextgen/whimsicott.png	whimsicott	\N	163	0.7	6.6	2	Проказник   Проскальзывание   Хлорофилл	14	Самцы: 50% Самки: 50% 	127	19	99	60	67	85	116	77	75	480
778	Петилил	https://www.orthrusonline.ru/static/images/p/nextgen/petilil.png	petilil	\N	64	0.5	6.6	2	Хлорофилл   Собственный темп   Травяной щит	14	Самцы: 12.5% Самки: 87.5% 	5740	18	83.2	45	35	50	30	70	50	280
779	Лилигант	https://www.orthrusonline.ru/static/images/p/nextgen/lilligant.png	lilligant	\N	64	1.1	16.3	2	Хлорофилл   Собственный темп   Травяной щит	14	Самцы: 12.5% Самки: 87.5% 	68	6	99.5	70	60	75	90	110	75	480
780	Баскулин	https://www.orthrusonline.ru/static/images/p/nextgen/basculin.png	basculin	\N	4	1	18	2	Опрометчивость   Адаптация   Разрыв шаблона	27	Самцы: 50% Самки: 50% 	546	5	98.6	70	92	65	98	80	55	460
781	Сандайл	https://www.orthrusonline.ru/static/images/p/nextgen/sandile.png	sandile	\N	164	0.7	15.2	1	Запугивание   Ловкость   Прилив гнева	14	Самцы: 50% Самки: 50% 	2827	3	96.5	50	72	35	65	35	35	292
782	Крокорок	https://www.orthrusonline.ru/static/images/p/nextgen/krokorok.png	krokorok	\N	164	1	33.4	1	Запугивание   Ловкость   Прилив гнева	14	Самцы: 50% Самки: 50% 	55	1	99.6	60	82	45	74	45	45	351
783	Крукодил	https://www.orthrusonline.ru/static/images/p/nextgen/krookodile.png	krookodile	\N	164	1.5	96.3	1	Запугивание   Ловкость   Прилив гнева	14	Самцы: 50% Самки: 50% 	284	11	97.8	95	117	80	92	65	70	519
784	Дарумака	https://www.orthrusonline.ru/static/images/p/nextgen/darumaka.png	darumaka	\N	58	0.6	37.5	1	Энергичность   Концентрация	14	Самцы: 50% Самки: 50% 	835	2	97	70	90	45	50	15	45	315
785	Дарманитан	https://www.orthrusonline.ru/static/images/p/nextgen/darmanitan.png	darmanitan	\N	58	1.3	92.9	1	Грубая сила   Режим дарумы	14	Самцы: 50% Самки: 50% 	219	7	98.4	105	140	55	95	30	55	480
786	Марактус	https://www.orthrusonline.ru/static/images/p/nextgen/maractus.png	maractus	\N	64	1	28	2	Поглощение воды   Хлорофилл   Водоотвод	14	Самцы: 50% Самки: 50% 	2025	16	95.6	75	86	67	60	106	67	461
787	Двебл	https://www.orthrusonline.ru/static/images/p/nextgen/dwebble.png	dwebble	\N	136	0.3	14.5	2	Стойкость   Панцирь-броня   Слабая броня	14	Самцы: 50% Самки: 50% 	4502	24	91.5	50	65	85	55	35	35	325
788	Крастл	https://www.orthrusonline.ru/static/images/p/nextgen/crustle.png	crustle	\N	136	1.4	200	2	Стойкость   Панцирь-броня   Слабая броня	14	Самцы: 50% Самки: 50% 	223	5	98.4	70	105	125	45	65	75	485
789	Скрагги	https://www.orthrusonline.ru/static/images/p/nextgen/scraggy.png	scraggy	\N	165	0.6	11.8	2	Сбрасывание кожи   Ловкость   Запугивание	10	Самцы: 50% Самки: 50% 	652	240	97.6	50	75	70	48	35	70	348
790	Скрафти	https://www.orthrusonline.ru/static/images/p/nextgen/scrafty.png	scrafty	\N	165	1.1	30	2	Сбрасывание кожи   Ловкость   Запугивание	10	Самцы: 50% Самки: 50% 	153	26	98.8	65	90	115	58	45	115	488
791	Сиглиф	https://www.orthrusonline.ru/static/images/p/nextgen/sigilyph.png	sigilyph	\N	37	1.4	14	2	Призрачная кожа   Волшебный щит   Тонированные линзы	14	Самцы: 50% Самки: 50% 	778	15	98	72	58	80	97	103	80	490
792	Ямаск	https://www.orthrusonline.ru/static/images/p/nextgen/yamask.png	yamask	\N	48	0.5	1.5	2	Мумия	17	Самцы: 50% Самки: 50% 	283	2	98.9	38	30	85	30	55	65	303
793	Кофагригус	https://www.orthrusonline.ru/static/images/p/nextgen/cofagrigus.png	cofagrigus	\N	48	1.7	76.5	2	Мумия	17	Самцы: 50% Самки: 50% 	88	9	99.3	58	50	145	30	95	105	483
794	Тиртуга	https://www.orthrusonline.ru/static/images/p/nextgen/tirtouga.png	tirtouga	\N	98	0.7	16.5	2	Твердый камень   Стойкость   Быстрое плаванье	20	Самцы: 87.5% Самки: 12.5% 	1137	73	98.5	54	78	103	22	53	45	355
795	Карракоста	https://www.orthrusonline.ru/static/images/p/nextgen/carracosta.png	carracosta	\N	98	1.2	81	2	Твердый камень   Стойкость   Быстрое плаванье	20	Самцы: 87.5% Самки: 12.5% 	670	11	98.7	74	108	133	32	83	65	495
796	Архен	https://www.orthrusonline.ru/static/images/p/nextgen/archen.png	archen	\N	36	0.5	9.5	2	Капитуляция	20	Самцы: 87.5% Самки: 12.5% 	483	309	99.1	55	112	45	70	74	45	401
797	Археопс	https://www.orthrusonline.ru/static/images/p/nextgen/archeops.png	archeops	\N	36	1.4	32	2	Капитуляция	20	Самцы: 87.5% Самки: 12.5% 	71	35	99.5	75	140	65	110	112	65	567
798	Траббиш	https://www.orthrusonline.ru/static/images/p/nextgen/trubbish.png	trubbish	\N	121	0.6	31	2	Зловоние   Липкий захват   Детонация	14	Самцы: 50% Самки: 50% 	7291	18	94.2	50	50	62	65	40	62	329
799	Гарбодор	https://www.orthrusonline.ru/static/images/p/nextgen/garbodor.png	garbodor	\N	121	1.9	107.3	2	Зловоние   Слабая броня   Детонация	14	Самцы: 50% Самки: 50% 	649	6	97.6	80	95	82	75	60	82	474
800	Зоруа	https://www.orthrusonline.ru/static/images/p/nextgen/zorua.png	zorua	\N	15	0.7	12.5	1	Иллюзия	17	Самцы: 87.5% Самки: 12.5% 	1180	5	97.8	40	65	40	65	80	40	330
801	Зороарк	https://www.orthrusonline.ru/static/images/p/nextgen/zoroark.png	zoroark	\N	15	1.6	81.1	1	Иллюзия	14	Самцы: 87.5% Самки: 12.5% 	500	25	98	60	105	60	105	120	60	510
802	Минчино	https://www.orthrusonline.ru/static/images/p/nextgen/minccino.png	minccino	\N	17	0.4	5.8	4	Очарование   Техничность   Развитие навыка	10	Самцы: 25% Самки: 75% 	2206	12	95.7	55	50	40	75	40	40	300
803	Чинчино	https://www.orthrusonline.ru/static/images/p/nextgen/cinccino.png	cinccino	\N	17	0.5	7.5	4	Очарование   Техничность   Развитие навыка	10	Самцы: 25% Самки: 75% 	37	5	99.7	75	95	60	115	65	60	470
804	Готита	https://www.orthrusonline.ru/static/images/p/nextgen/gothita.png	gothita	\N	19	0.4	5.8	1	Обыскивание   Состязательность   Тёмная метка	14	Самцы: 25% Самки: 75% 	125	1	99.3	45	30	50	45	55	65	290
805	Готорита	https://www.orthrusonline.ru/static/images/p/nextgen/gothorita.png	gothorita	\N	19	0.7	18	1	Обыскивание   Состязательность   Тёмная метка	14	Самцы: 25% Самки: 75% 	16	1	99.9	60	45	70	55	75	85	390
806	Готитель	https://www.orthrusonline.ru/static/images/p/nextgen/gothitelle.png	gothitelle	\N	19	1.5	44	1	Обыскивание   Состязательность   Тёмная метка	14	Самцы: 25% Самки: 75% 	144	13	99.1	70	55	95	65	95	110	490
807	Солосис	https://www.orthrusonline.ru/static/images/p/nextgen/solosis.png	solosis	\N	19	0.3	1	1	Пыленепроницаемость   Волшебный щит   Регенерация	14	Самцы: 50% Самки: 50% 	139	6	99.5	45	30	40	20	105	50	290
808	Дуожин	https://www.orthrusonline.ru/static/images/p/nextgen/duosion.png	duosion	\N	19	0.6	8	1	Пыленепроницаемость   Волшебный щит   Регенерация	14	Самцы: 50% Самки: 50% 	15	0	99.9	65	40	50	30	125	60	370
809	Руниклас	https://www.orthrusonline.ru/static/images/p/nextgen/reuniclus.png	reuniclus	\N	19	1	20.1	1	Пыленепроницаемость   Волшебный щит   Регенерация	14	Самцы: 50% Самки: 50% 	63	24	99.5	110	65	75	30	125	85	490
810	Даклетт	https://www.orthrusonline.ru/static/images/p/nextgen/ducklett.png	ducklett	\N	129	0.5	5.5	2	Острый глаз   Большие клевки   Гидрирование	14	Самцы: 50% Самки: 50% 	4191	13	85.9	62	44	50	55	44	50	305
811	Свана	https://www.orthrusonline.ru/static/images/p/nextgen/swanna.png	swanna	\N	129	1.3	24.2	2	Острый глаз   Большие клевки   Гидрирование	14	Самцы: 50% Самки: 50% 	262	3	97.9	75	87	63	98	87	63	473
812	Ванилит	https://www.orthrusonline.ru/static/images/p/nextgen/vanillite.png	vanillite	\N	12	0.4	5.7	3	Ледяное тело   Снежные покровы   Слабая броня	14	Самцы: 50% Самки: 50% 	3104	13	95.2	36	50	50	44	65	60	305
813	Ванилиш	https://www.orthrusonline.ru/static/images/p/nextgen/vanillish.png	vanillish	\N	12	1.1	41	3	Ледяное тело   Снежные покровы   Слабая броня	14	Самцы: 50% Самки: 50% 	50	1	99.6	51	65	65	59	80	75	395
814	Ванилюкс	https://www.orthrusonline.ru/static/images/p/nextgen/vanilluxe.png	vanilluxe	\N	12	1.3	57.5	3	Ледяное тело   Снежная тревога   Слабая броня	14	Самцы: 50% Самки: 50% 	117	7	99.1	71	95	85	79	110	95	535
815	Дирлинг	https://www.orthrusonline.ru/static/images/p/nextgen/deerling.png	deerling	\N	166	0.6	19.5	2	Хлорофилл   Поглотитель соков   Небесное благословение	14	Самцы: 50% Самки: 50% 	4793	21	93.4	60	60	50	75	40	50	335
816	Сосбак	https://www.orthrusonline.ru/static/images/p/nextgen/sawsbuck.png	sawsbuck	\N	166	1.9	92.5	2	Хлорофилл   Поглотитель соков   Небесное благословение	14	Самцы: 50% Самки: 50% 	2804	9	89.7	80	100	70	95	60	70	475
817	Эмолга	https://www.orthrusonline.ru/static/images/p/nextgen/emolga.png	emolga	\N	69	0.4	5	2	Статическое электричество   Разогрев мотора	14	Самцы: 50% Самки: 50% 	5578	33	83.1	55	75	60	103	75	60	428
818	Каррабласт	https://www.orthrusonline.ru/static/images/p/nextgen/karrablast.png	karrablast	\N	120	0.5	5.9	2	Роение   Сбрасывание кожи   Боец-одиночка	10	Самцы: 50% Самки: 50% 	2639	3	89.4	50	75	45	60	40	45	315
819	Эскавальер	https://www.orthrusonline.ru/static/images/p/nextgen/escavalier.png	escavalier	\N	45	1	33	2	Роение   Панцирь-броня   Пыленепроницаемость	10	Самцы: 50% Самки: 50% 	590	1	96	70	135	105	20	60	105	495
820	Фунгус	https://www.orthrusonline.ru/static/images/p/nextgen/foongus.png	foongus	\N	1	0.2	1	2	Эффект споры   Регенерация	14	Самцы: 50% Самки: 50% 	10955	62	84.7	69	55	45	15	55	55	294
821	Амунгус	https://www.orthrusonline.ru/static/images/p/nextgen/amoonguss.png	amoonguss	\N	1	0.6	10.5	2	Эффект споры   Регенерация	14	Самцы: 50% Самки: 50% 	414	29	97.2	114	85	70	30	85	80	464
822	Фриллиш	https://www.orthrusonline.ru/static/images/p/nextgen/frillish.png	frillish	\N	115	1.2	33	2	Поглощение воды   Проклятое тело   Влажность	14	Самцы: 50% Самки: 50% 	4455	28	95.4	55	40	50	40	65	85	335
823	Джелисент	https://www.orthrusonline.ru/static/images/p/nextgen/jellicent.png	jellicent	\N	115	2.2	135	2	Поглощение воды   Проклятое тело   Влажность	14	Самцы: 50% Самки: 50% 	139	28	99	100	60	70	60	85	105	480
824	Аломомола	https://www.orthrusonline.ru/static/images/p/nextgen/alomomola.png	alomomola	\N	4	1.2	31.6	4	Исцеление   Гидрирование   Регенерация	27	Самцы: 50% Самки: 50% 	4774	10	90.9	165	75	80	65	40	45	470
825	Джолтик	https://www.orthrusonline.ru/static/images/p/nextgen/joltik.png	joltik	\N	167	0.1	0.6	2	Фасеточность   Нервирование   Роение	14	Самцы: 50% Самки: 50% 	210	1	98.7	50	47	50	65	57	50	319
826	Гальвантула	https://www.orthrusonline.ru/static/images/p/nextgen/galvantula.png	galvantula	\N	167	0.8	14.3	2	Фасеточность   Нервирование   Роение	14	Самцы: 50% Самки: 50% 	143	10	98.9	70	77	60	108	97	60	472
827	Ферросид	https://www.orthrusonline.ru/static/images/p/nextgen/ferroseed.png	ferroseed	\N	168	0.6	18.8	2	Стальные шипы	14	Самцы: 50% Самки: 50% 	9117	298	95.5	44	50	91	10	24	86	305
828	Ферроторн	https://www.orthrusonline.ru/static/images/p/nextgen/ferrothorn.png	ferrothorn	\N	168	1	110	2	Стальные шипы   Предвидение	14	Самцы: 50% Самки: 50% 	458	80	97.3	74	94	131	20	54	116	489
829	Клинк	https://www.orthrusonline.ru/static/images/p/nextgen/klink.png	klink	\N	16	0.3	21	1	Плюс   Минус   Чистое тело	14	Бесполые	4584	4	96.4	40	55	70	30	45	60	300
830	Кланг	https://www.orthrusonline.ru/static/images/p/nextgen/klang.png	klang	\N	16	0.6	51	1	Плюс   Минус   Чистое тело	14	Бесполые	43	0	99.7	60	80	95	50	70	85	440
831	Клинкланг	https://www.orthrusonline.ru/static/images/p/nextgen/klinklang.png	klinklang	\N	16	0.6	81	1	Плюс   Минус   Чистое тело	14	Бесполые	128	1	99	60	100	115	90	70	85	520
832	Тайнамо	https://www.orthrusonline.ru/static/images/p/nextgen/tynamo.png	tynamo	\N	9	0.2	0.3	3	Левитация	14	Самцы: 50% Самки: 50% 	971	9	98.3	35	55	40	60	45	40	275
833	Иллектрик	https://www.orthrusonline.ru/static/images/p/nextgen/eelektrik.png	eelektrik	\N	9	1.2	22	3	Левитация	14	Самцы: 50% Самки: 50% 	37	4	99.7	65	85	70	40	75	70	405
835	Элгием	https://www.orthrusonline.ru/static/images/p/nextgen/elgyem.png	elgyem	\N	19	0.5	9	2	Телепатия   Синхронизация   Анализ	14	Самцы: 50% Самки: 50% 	496	0	97.8	55	55	55	30	85	55	335
836	Бихием	https://www.orthrusonline.ru/static/images/p/nextgen/beheeyem.png	beheeyem	\N	19	1	34.5	2	Телепатия   Синхронизация   Анализ	14	Самцы: 50% Самки: 50% 	74	1	99.4	75	75	75	40	125	95	485
837	Литвик	https://www.orthrusonline.ru/static/images/p/nextgen/litwick.png	litwick	\N	169	0.3	3.1	1	Вспышка пламени   Огненное тело   Проскальзывание	14	Самцы: 50% Самки: 50% 	948	24	98.4	50	30	55	20	65	55	275
838	Лампент	https://www.orthrusonline.ru/static/images/p/nextgen/lampent.png	lampent	\N	169	0.6	13	1	Вспышка пламени   Огненное тело   Проскальзывание	14	Самцы: 50% Самки: 50% 	53	4	99.6	60	40	60	55	95	60	370
839	Шанделюр	https://www.orthrusonline.ru/static/images/p/nextgen/chandelure.png	chandelure	\N	169	1	34.3	1	Вспышка пламени   Огненное тело   Проскальзывание	14	Самцы: 50% Самки: 50% 	127	26	99.1	60	55	90	80	145	90	520
840	Аксью	https://www.orthrusonline.ru/static/images/p/nextgen/axew.png	axew	\N	132	0.6	18	3	Соперничество   Разрыв шаблона   Нервирование	27	Самцы: 50% Самки: 50% 	406	15	98.6	46	87	60	57	30	40	320
841	Фраксур	https://www.orthrusonline.ru/static/images/p/nextgen/fraxure.png	fraxure	\N	132	1	36	3	Соперничество   Разрыв шаблона   Нервирование	27	Самцы: 50% Самки: 50% 	19	3	99.8	66	117	70	67	40	50	410
842	Хаксорус	https://www.orthrusonline.ru/static/images/p/nextgen/haxorus.png	haxorus	\N	132	1.8	105.5	3	Соперничество   Разрыв шаблона   Нервирование	27	Самцы: 50% Самки: 50% 	242	59	98.3	76	147	90	97	60	70	540
843	Кабчу	https://www.orthrusonline.ru/static/images/p/nextgen/cubchoo.png	cubchoo	\N	12	0.5	8.5	2	Снежные покровы   Грязевой натиск   Нервозность	14	Самцы: 50% Самки: 50% 	3607	33	90.9	55	70	40	40	60	40	305
844	Бертик	https://www.orthrusonline.ru/static/images/p/nextgen/beartic.png	beartic	\N	12	2.6	260	2	Снежные покровы   Грязевой натиск   Быстрое плаванье	14	Самцы: 50% Самки: 50% 	3172	16	93	95	130	80	50	70	80	505
845	Криогонал	https://www.orthrusonline.ru/static/images/p/nextgen/cryogonal.png	cryogonal	\N	12	1.1	148	2	Левитация	17	Бесполые	1601	20	97.4	80	50	50	105	95	135	515
846	Шелмет	https://www.orthrusonline.ru/static/images/p/nextgen/shelmet.png	shelmet	\N	120	0.4	7.7	2	Гидрирование   Панцирь-броня   Пыленепроницаемость	10	Самцы: 50% Самки: 50% 	13698	12	87.4	50	40	85	25	40	65	305
847	Акселгор	https://www.orthrusonline.ru/static/images/p/nextgen/accelgor.png	accelgor	\N	120	0.8	25.3	2	Гидрирование   Липкий захват   Освобождение	10	Самцы: 50% Самки: 50% 	1373	11	94.5	80	70	40	145	100	60	495
848	Станфиск	https://www.orthrusonline.ru/static/images/p/nextgen/stunfisk.png	stunfisk	\N	170	0.7	11	2	Статическое электричество   Гибкость   Песчаный покров	14	Самцы: 50% Самки: 50% 	937	9	98	109	66	84	32	81	99	471
849	Минфу	https://www.orthrusonline.ru/static/images/p/nextgen/mienfoo.png	mienfoo	\N	20	0.9	20	1	Концентрация   Регенерация   Опрометчивость	17	Самцы: 50% Самки: 50% 	1666	4	96.5	45	85	50	65	55	50	350
850	Миншао	https://www.orthrusonline.ru/static/images/p/nextgen/mienshao.png	mienshao	\N	20	1.4	35.5	1	Концентрация   Регенерация   Опрометчивость	17	Самцы: 50% Самки: 50% 	178	9	98.6	65	125	60	105	95	60	510
851	Драддигон	https://www.orthrusonline.ru/static/images/p/nextgen/druddigon.png	druddigon	\N	132	1.6	139	2	Грубая кожа   Грубая сила   Разрыв шаблона	20	Самцы: 50% Самки: 50% 	893	339	97.4	77	120	90	48	60	90	485
852	Голет	https://www.orthrusonline.ru/static/images/p/nextgen/golett.png	golett	\N	81	1	92	2	Железный кулак   Неуклюжесть   Боец-одиночка	17	Бесполые	814	2	96.4	59	74	50	35	35	50	303
853	Голурк	https://www.orthrusonline.ru/static/images/p/nextgen/golurk.png	golurk	\N	81	2.8	330	2	Железный кулак   Неуклюжесть   Боец-одиночка	17	Бесполые	185	13	98.5	89	124	80	55	55	80	483
854	Поньярд	https://www.orthrusonline.ru/static/images/p/nextgen/pawniard.png	pawniard	\N	171	0.5	10.2	2	Непокорность   Концентрация   Давление	14	Самцы: 50% Самки: 50% 	5302	9	96.1	45	85	70	60	40	40	340
855	Бишарп	https://www.orthrusonline.ru/static/images/p/nextgen/bisharp.png	bisharp	\N	171	1.6	70	2	Непокорность   Концентрация   Давление	14	Самцы: 50% Самки: 50% 	146	6	98.9	65	125	100	70	60	70	490
856	Буфалант	https://www.orthrusonline.ru/static/images/p/nextgen/bouffalant.png	bouffalant	\N	17	1.6	94.6	2	Опрометчивость   Поглотитель соков   Звуконепроницаемость	14	Самцы: 50% Самки: 50% 	175	123	98.7	95	110	95	55	40	95	490
857	Рафлет	https://www.orthrusonline.ru/static/images/p/nextgen/rufflet.png	rufflet	\N	7	0.5	10.5	3	Острый глаз   Грубая сила   Энергичность	14	Только самцы	1811	5	97.7	70	83	50	60	37	50	350
858	Бравайри	https://www.orthrusonline.ru/static/images/p/nextgen/braviary.png	braviary	\N	7	1.5	41	3	Острый глаз   Грубая сила   Непокорность	14	Только самцы	1274	5	96.9	100	123	75	80	57	75	510
859	Вуллаби	https://www.orthrusonline.ru/static/images/p/nextgen/vullaby.png	vullaby	\N	39	0.5	9	3	Большие клевки   Пыленепроницаемость   Слабая броня	14	Только самки	1738	19	98.1	70	55	75	60	45	65	370
860	Мандибазз	https://www.orthrusonline.ru/static/images/p/nextgen/mandibuzz.png	mandibuzz	\N	39	1.2	39.5	3	Большие клевки   Пыленепроницаемость   Слабая броня	14	Только самки	3536	21	93.7	110	65	105	80	55	95	510
861	Хитмор	https://www.orthrusonline.ru/static/images/p/nextgen/heatmor.png	heatmor	\N	58	1.4	58	2	Прожорливость   Вспышка пламени   Белый дым	14	Самцы: 50% Самки: 50% 	885	3	97.9	85	97	66	65	105	66	484
862	Дюрант	https://www.orthrusonline.ru/static/images/p/nextgen/durant.png	durant	\N	45	0.3	33	2	Роение   Энергичность   Ленивость	14	Самцы: 50% Самки: 50% 	3333	12	94.5	58	109	112	109	48	48	484
863	Дейно	https://www.orthrusonline.ru/static/images/p/nextgen/deino.png	deino	\N	172	0.8	17.3	3	Энергичность	27	Самцы: 50% Самки: 50% 	209	15	98.9	52	65	50	38	45	50	300
864	Цвайлус	https://www.orthrusonline.ru/static/images/p/nextgen/zweilous.png	zweilous	\N	172	1.4	50	3	Энергичность	27	Самцы: 50% Самки: 50% 	34	3	99.7	72	85	70	58	65	70	420
865	Гидрайгон	https://www.orthrusonline.ru/static/images/p/nextgen/hydreigon.png	hydreigon	\N	172	1.8	160	3	Левитация	27	Самцы: 50% Самки: 50% 	151	38	98.8	92	105	90	98	125	90	600
866	Ларвеста	https://www.orthrusonline.ru/static/images/p/nextgen/larvesta.png	larvesta	\N	173	1.1	28.8	3	Огненное тело   Роение	27	Самцы: 50% Самки: 50% 	43	3	99.8	55	85	55	60	50	55	360
867	Вулкарона	https://www.orthrusonline.ru/static/images/p/nextgen/volcarona.png	volcarona	\N	173	1.6	46	3	Огненное тело   Роение	27	Самцы: 50% Самки: 50% 	73	20	99.4	85	60	65	100	135	105	550
868	Кобалион	https://www.orthrusonline.ru/static/images/p/nextgen/cobalion.png	cobalion	\N	174	2.1	250	3	Сердце правосудия	54	Бесполые	60	4	99.7	91	90	129	108	90	72	580
869	Терракион	https://www.orthrusonline.ru/static/images/p/nextgen/terrakion.png	terrakion	\N	175	1.9	260	3	Сердце правосудия	54	Бесполые	27	11	99.8	91	129	90	108	72	90	580
870	Виризион	https://www.orthrusonline.ru/static/images/p/nextgen/virizion.png	virizion	\N	78	2	200	3	Сердце правосудия	54	Бесполые	50	7	99.7	91	90	72	108	90	129	580
871	Торнадус	https://www.orthrusonline.ru/static/images/p/nextgen/tornadus.png	tornadus	\N	83	1.5	63	3	Проказник   Непокорность	80	Только самцы	95	2	99.5	79	115	70	111	125	80	580
872	Тандерус	https://www.orthrusonline.ru/static/images/p/nextgen/thundurus.png	thundurus	\N	69	1.5	61	3	Проказник   Непокорность	80	Только самцы	100	5	99.6	79	115	70	111	125	80	580
873	Реширам	https://www.orthrusonline.ru/static/images/p/nextgen/reshiram.png	reshiram	\N	176	3.2	330	3	Турбопламя	80	Бесполые	25	4	99.8	100	120	100	90	150	120	680
874	Зекром	https://www.orthrusonline.ru/static/images/p/nextgen/zekrom.png	zekrom	\N	177	2.9	345	3	Теравольт	80	Бесполые	47	10	99.6	100	150	120	90	120	100	680
875	Лэндорус	https://www.orthrusonline.ru/static/images/p/nextgen/landorus.png	landorus	\N	84	1.5	68	3	Сила песка   Грубая сила	80	Только самцы	83	5	99.5	89	125	90	101	115	80	600
876	Кюрем	https://www.orthrusonline.ru/static/images/p/nextgen/kyurem.png	kyurem	\N	85	3	325	3	Давление	80	Бесполые	85	7	99.4	125	130	90	95	130	90	660
877	Келдео	https://www.orthrusonline.ru/static/images/p/nextgen/keldeo.png	keldeo	\N	86	1.4	48.5	3	Сердце правосудия	54	Бесполые	39	28	99.7	91	72	90	108	129	90	580
878	Мелоэтта	https://www.orthrusonline.ru/static/images/p/nextgen/meloetta.png	meloetta	\N	135	0.6	6.5	3	Небесное благословение	80	Бесполые	32	10	99.7	100	77	77	90	128	128	600
879	Генесект	https://www.orthrusonline.ru/static/images/p/nextgen/genesect.png	genesect	\N	45	1.5	82.5	3	Загрузка	80	Бесполые	77	11	99.5	71	120	95	99	120	95	600
880	Чеспин	https://www.orthrusonline.ru/static/images/p/nextgen/chespin.png	chespin	\N	64	0.4	9	1	Сверхрост   Пуленепробиваемость	14	Самцы: 87.5% Самки: 12.5% 	503	44	97.5	56	61	65	38	48	45	313
881	Квилладин	https://www.orthrusonline.ru/static/images/p/nextgen/quilladin.png	quilladin	\N	64	0.7	29	1	Сверхрост   Пуленепробиваемость	14	Самцы: 87.5% Самки: 12.5% 	247	1	98	61	78	95	57	56	58	405
882	Чеснот	https://www.orthrusonline.ru/static/images/p/nextgen/chesnaught.png	chesnaught	\N	78	1.6	90	1	Сверхрост   Пуленепробиваемость	14	Самцы: 87.5% Самки: 12.5% 	297	32	97.7	88	107	122	64	74	75	530
883	Феннекин	https://www.orthrusonline.ru/static/images/p/nextgen/fennekin.png	fennekin	\N	58	0.4	9.4	1	Яростное пламя   Чародейство	14	Самцы: 87.5% Самки: 12.5% 	2722	62	86.8	40	45	40	60	62	60	307
884	Брейксен	https://www.orthrusonline.ru/static/images/p/nextgen/braixen.png	braixen	\N	58	1	14.5	1	Яростное пламя   Чародейство	14	Самцы: 87.5% Самки: 12.5% 	1482	26	87.8	59	59	58	73	90	70	409
885	Дельфокс	https://www.orthrusonline.ru/static/images/p/nextgen/delphox.png	delphox	\N	80	1.5	39	1	Яростное пламя   Чародейство	14	Самцы: 87.5% Самки: 12.5% 	1570	124	87.3	75	69	72	104	114	100	534
886	Фроки	https://www.orthrusonline.ru/static/images/p/nextgen/froakie.png	froakie	\N	4	0.3	7	1	Всплеск   Изменчивость	14	Самцы: 87.5% Самки: 12.5% 	1968	91	86.6	41	56	40	71	62	44	314
887	Фрогадир	https://www.orthrusonline.ru/static/images/p/nextgen/frogadier.png	frogadier	\N	4	0.6	10.9	1	Всплеск   Изменчивость	14	Самцы: 87.5% Самки: 12.5% 	1682	27	86.2	54	63	52	97	83	56	405
888	Грениндзя	https://www.orthrusonline.ru/static/images/p/nextgen/greninja.png	greninja	\N	34	1.5	40	1	Всплеск   Изменчивость   Боевые узы	14	Самцы: 87.5% Самки: 12.5% 	1722	176	86.1	72	95	67	122	103	71	530
889	Баннелби	https://www.orthrusonline.ru/static/images/p/nextgen/bunnelby.png	bunnelby	\N	17	0.4	5	2	Сбор предметов   Защёчный мешок   Большая сила	10	Самцы: 50% Самки: 50% 	6663	69	86.5	38	36	38	57	32	36	237
890	Диггерсби	https://www.orthrusonline.ru/static/images/p/nextgen/diggersby.png	diggersby	\N	178	1	42.4	2	Сбор предметов   Защёчный мешок   Большая сила	10	Самцы: 50% Самки: 50% 	1940	64	92.5	85	56	77	78	50	77	423
891	Флетчлинг	https://www.orthrusonline.ru/static/images/p/nextgen/fletchling.png	fletchling	\N	7	0.3	1.7	1	Большие клевки   Крылья бури	10	Самцы: 50% Самки: 50% 	18765	43	75.8	45	50	43	62	40	38	278
892	Флетчиндер	https://www.orthrusonline.ru/static/images/p/nextgen/fletchinder.png	fletchinder	\N	2	0.7	16	1	Огненное тело   Крылья бури	10	Самцы: 50% Самки: 50% 	2061	7	92	62	73	55	84	56	52	382
893	Талонфлейм	https://www.orthrusonline.ru/static/images/p/nextgen/talonflame.png	talonflame	\N	2	1.2	24.5	1	Огненное тело   Крылья бури	10	Самцы: 50% Самки: 50% 	1398	38	90	78	81	71	126	74	69	499
894	Скаттербаг	https://www.orthrusonline.ru/static/images/p/nextgen/scatterbug.png	scatterbug	\N	120	0.3	2.5	2	Защитная пыльца   Фасеточность   Защита товарища	10	Самцы: 50% Самки: 50% 	1565	25	96.7	38	35	40	35	27	25	200
895	Спьюпа	https://www.orthrusonline.ru/static/images/p/nextgen/spewpa.png	spewpa	\N	120	0.3	8.4	2	Сбрасывание кожи   Защита товарища	10	Самцы: 50% Самки: 50% 	56	4	99.5	45	22	60	29	27	30	213
896	Вивилон	https://www.orthrusonline.ru/static/images/p/nextgen/vivillon.png	vivillon	\N	5	1.2	17	2	Защитная пыльца   Фасеточность   Защита товарища	10	Самцы: 50% Самки: 50% 	4140	19	84.5	80	52	50	89	90	50	411
897	Литлео	https://www.orthrusonline.ru/static/images/p/nextgen/litleo.png	litleo	\N	179	0.6	13.5	1	Соперничество   Нервирование   Ловкость	14	Самцы: 25% Самки: 75% 	80	3	99.5	62	50	58	72	73	54	369
898	Пайроар	https://www.orthrusonline.ru/static/images/p/nextgen/pyroar.png	pyroar	\N	179	1.5	81.5	1	Соперничество   Нервирование   Ловкость	14	Самцы: 25% Самки: 75% 	62	7	99.5	86	68	72	106	109	66	507
899	Флабебе	https://www.orthrusonline.ru/static/images/p/nextgen/flabebe.png	flabebe	\N	105	0.1	0.1	2	Цветочный покров   Симбиоз	14	Самцы: 12.5% Самки: 87.5% 	6606	15	90.9	44	38	39	42	61	79	303
900	Флоэтта	https://www.orthrusonline.ru/static/images/p/nextgen/floette.png	floette	\N	105	0.2	0.9	2	Цветочный покров   Симбиоз	14	Самцы: 12.5% Самки: 87.5% 	314	6	97.7	54	45	47	52	75	98	371
901	Флоргес	https://www.orthrusonline.ru/static/images/p/nextgen/florges.png	florges	\N	105	1.1	10	2	Цветочный покров   Симбиоз	14	Самцы: 12.5% Самки: 87.5% 	162	10	98.8	78	65	68	75	112	154	552
902	Скиддо	https://www.orthrusonline.ru/static/images/p/nextgen/skiddo.png	skiddo	\N	64	0.9	31	2	Поглотитель соков   Травяная шкура	14	Самцы: 50% Самки: 50% 	459	3	98.6	66	65	48	52	62	57	350
903	Гогоат	https://www.orthrusonline.ru/static/images/p/nextgen/gogoat.png	gogoat	\N	64	1.7	91	2	Поглотитель соков   Травяная шкура	14	Самцы: 50% Самки: 50% 	2050	6	95.4	123	100	62	68	97	81	531
904	Панчам	https://www.orthrusonline.ru/static/images/p/nextgen/pancham.png	pancham	\N	20	0.6	8	2	Железный кулак   Разрыв шаблона   Дерзость	17	Самцы: 50% Самки: 50% 	410	13	99.1	67	82	62	43	46	48	348
905	Пангоро	https://www.orthrusonline.ru/static/images/p/nextgen/pangoro.png	pangoro	\N	110	2.1	136	2	Железный кулак   Разрыв шаблона   Дерзость	17	Самцы: 50% Самки: 50% 	66	11	99.5	95	124	78	58	69	71	495
906	Фурфру	https://www.orthrusonline.ru/static/images/p/nextgen/furfrou.png	furfrou	\N	17	1.2	28	2	Меховой плащ	14	Самцы: 50% Самки: 50% 	2572	9	95.6	75	80	60	102	65	90	472
907	Эспурр	https://www.orthrusonline.ru/static/images/p/nextgen/espurr.png	espurr	\N	19	0.3	3.5	2	Острый глаз   Проскальзывание   Собственный темп	14	Самцы: 50% Самки: 50% 	6059	13	96.6	62	48	54	68	63	60	355
908	Мяустик	https://www.orthrusonline.ru/static/images/p/nextgen/meowstic.png	meowstic	\N	19	0.6	8.5	2	Острый глаз   Проскальзывание   Проказник	14	Самцы: 50% Самки: 50% 	158	3	98.8	74	48	76	104	83	81	466
909	Хонэдж	https://www.orthrusonline.ru/static/images/p/nextgen/honedge.png	honedge	\N	87	0.8	2	2	Боец-одиночка	14	Самцы: 50% Самки: 50% 	784	252	98.4	45	80	100	28	35	37	325
910	Даблэйд	https://www.orthrusonline.ru/static/images/p/nextgen/doublade.png	doublade	\N	87	0.8	4.5	2	Боец-одиночка	14	Самцы: 50% Самки: 50% 	46	13	99.6	59	110	150	35	45	49	448
911	Эджислэш	https://www.orthrusonline.ru/static/images/p/nextgen/aegislash.png	aegislash	\N	87	1.7	53	2	Смена позиции	14	Самцы: 50% Самки: 50% 	323	109	98	60	50	140	60	50	140	500
912	Спритзи	https://www.orthrusonline.ru/static/images/p/nextgen/spritzee.png	spritzee	\N	105	0.2	0.5	2	Исцеление   Ароматный покров	14	Самцы: 50% Самки: 50% 	3749	32	95	78	52	60	23	63	65	341
913	Ароматисс	https://www.orthrusonline.ru/static/images/p/nextgen/aromatisse.png	aromatisse	\N	105	0.8	15.5	2	Исцеление   Ароматный покров	14	Самцы: 50% Самки: 50% 	133	8	99.3	101	72	72	29	99	89	462
914	Свирликс	https://www.orthrusonline.ru/static/images/p/nextgen/swirlix.png	swirlix	\N	105	0.4	3.5	2	Сладкий покров   Освобождение	14	Самцы: 50% Самки: 50% 	6247	43	94.4	62	48	66	49	59	57	341
915	Сларпуфф	https://www.orthrusonline.ru/static/images/p/nextgen/slurpuff.png	slurpuff	\N	105	0.8	5	2	Сладкий покров   Освобождение	14	Самцы: 50% Самки: 50% 	154	7	99.3	82	80	86	72	85	75	480
916	Инкей	https://www.orthrusonline.ru/static/images/p/nextgen/inkay.png	inkay	\N	180	0.4	3.5	2	Порочность   Присоски   Проскальзывание	14	Самцы: 50% Самки: 50% 	594	0	98.1	53	54	53	45	37	46	288
917	Маламар	https://www.orthrusonline.ru/static/images/p/nextgen/malamar.png	malamar	\N	180	1.5	47	2	Порочность   Присоски   Проскальзывание	14	Самцы: 50% Самки: 50% 	203	12	98.5	86	92	88	73	68	75	482
918	Бинакл	https://www.orthrusonline.ru/static/images/p/nextgen/binacle.png	binacle	\N	130	0.5	31	2	Крепкие когти   Снайпер   Карманный вор	14	Самцы: 50% Самки: 50% 	2720	9	96.1	42	52	67	50	39	56	306
919	Барбаракл	https://www.orthrusonline.ru/static/images/p/nextgen/barbaracle.png	barbaracle	\N	130	1.3	96	2	Крепкие когти   Снайпер   Карманный вор	14	Самцы: 50% Самки: 50% 	492	6	97.6	72	105	115	68	54	86	500
920	Скрелп	https://www.orthrusonline.ru/static/images/p/nextgen/skrelp.png	skrelp	\N	181	0.5	7.3	2	Ядовитые колючки   Ядовитое касание   Адаптация	14	Самцы: 50% Самки: 50% 	4334	9	96.2	50	60	60	30	60	60	320
921	Драгалг	https://www.orthrusonline.ru/static/images/p/nextgen/dragalge.png	dragalge	\N	109	1.8	81.5	2	Ядовитые колючки   Ядовитое касание   Адаптация	14	Самцы: 50% Самки: 50% 	237	14	98.2	65	75	90	44	97	123	494
922	Клончер	https://www.orthrusonline.ru/static/images/p/nextgen/clauncher.png	clauncher	\N	4	0.5	8.3	3	Мега-пушка	10	Самцы: 50% Самки: 50% 	6977	37	92.3	50	53	62	44	58	63	330
923	Кловицер	https://www.orthrusonline.ru/static/images/p/nextgen/clawitzer.png	clawitzer	\N	4	1.3	35.3	3	Мега-пушка	10	Самцы: 50% Самки: 50% 	221	13	98.3	71	73	88	59	120	89	500
924	Гелиоптайл	https://www.orthrusonline.ru/static/images/p/nextgen/helioptile.png	helioptile	\N	182	0.5	6	2	Сухая кожа   Песчаный покров   Солнечная сила	14	Самцы: 50% Самки: 50% 	3066	4	96.4	44	38	33	70	61	43	289
925	Гелиолиск	https://www.orthrusonline.ru/static/images/p/nextgen/heliolisk.png	heliolisk	\N	182	1	21	2	Сухая кожа   Песчаный покров   Солнечная сила	14	Самцы: 50% Самки: 50% 	3315	14	97.8	62	55	52	109	109	94	481
926	Тирант	https://www.orthrusonline.ru/static/images/p/nextgen/tyrunt.png	tyrunt	\N	183	0.8	26	2	Крепкая челюсть   Стойкость	20	Самцы: 87.5% Самки: 12.5% 	243	3	99	58	89	77	48	45	45	362
927	Тирантрум	https://www.orthrusonline.ru/static/images/p/nextgen/tyrantrum.png	tyrantrum	\N	183	2.5	270	2	Крепкая челюсть   Каменная голова	20	Самцы: 87.5% Самки: 12.5% 	102	15	99.3	82	121	119	71	69	59	521
928	Амаура	https://www.orthrusonline.ru/static/images/p/nextgen/amaura.png	amaura	\N	184	1.3	25.2	2	Охлаждение   Снежная тревога	20	Самцы: 87.5% Самки: 12.5% 	6287	27	94.9	77	59	50	46	67	63	362
929	Аврорус	https://www.orthrusonline.ru/static/images/p/nextgen/aurorus.png	aurorus	\N	184	2.7	225	2	Охлаждение   Снежная тревога	20	Самцы: 87.5% Самки: 12.5% 	3116	18	97	123	77	72	58	99	92	521
930	Сильвеон	https://www.orthrusonline.ru/static/images/p/nextgen/sylveon.png	sylveon	\N	105	1	23.5	2	Очарование   Оворожение	24	Самцы: 87.5% Самки: 12.5% 	420	21	96.9	95	65	65	60	110	130	525
931	Холуча	https://www.orthrusonline.ru/static/images/p/nextgen/hawlucha.png	hawlucha	\N	38	0.8	21.5	2	Гибкость   Освобождение   Разрыв шаблона	14	Самцы: 50% Самки: 50% 	656	350	98.4	78	92	75	118	74	63	500
932	Деденне	https://www.orthrusonline.ru/static/images/p/nextgen/dedenne.png	dedenne	\N	185	0.2	2.2	2	Защёчный мешок   Сбор предметов   Плюс	14	Самцы: 50% Самки: 50% 	3943	23	93	67	58	57	101	81	67	431
933	Карбинк	https://www.orthrusonline.ru/static/images/p/nextgen/carbink.png	carbink	\N	90	0.3	5.7	3	Чистое тело   Стойкость	17	Бесполые	2235	6	91.1	50	50	150	50	50	150	500
934	Гуми	https://www.orthrusonline.ru/static/images/p/nextgen/goomy.png	goomy	\N	132	0.3	2.8	3	Поглотитель соков   Гидрирование   Липкость	27	Самцы: 50% Самки: 50% 	376	12	98.4	45	50	35	40	55	75	300
935	Слиггу	https://www.orthrusonline.ru/static/images/p/nextgen/sliggoo.png	sliggoo	\N	132	0.8	17.5	3	Поглотитель соков   Гидрирование   Липкость	27	Самцы: 50% Самки: 50% 	860	3	98.6	68	75	53	60	83	113	452
936	Гудра	https://www.orthrusonline.ru/static/images/p/nextgen/goodra.png	goodra	\N	132	2	150.5	3	Поглотитель соков   Гидрирование   Липкость	27	Самцы: 50% Самки: 50% 	178	20	98.6	90	100	70	80	110	150	600
937	Клефки	https://www.orthrusonline.ru/static/images/p/nextgen/klefki.png	klefki	\N	54	0.2	3	4	Проказник   Чародейство	14	Самцы: 50% Самки: 50% 	1663	84	96.4	57	80	91	75	80	87	470
938	Фантамп	https://www.orthrusonline.ru/static/images/p/nextgen/phantump.png	phantump	\N	88	0.4	7	2	Естественное исцеление   Обыскивание   Восстановление урожая	14	Самцы: 50% Самки: 50% 	2576	2	95.5	43	70	48	38	50	60	309
939	Тревенант	https://www.orthrusonline.ru/static/images/p/nextgen/trevenant.png	trevenant	\N	88	1.5	71	2	Естественное исцеление   Обыскивание   Восстановление урожая	14	Самцы: 50% Самки: 50% 	1527	11	95.7	85	110	76	56	65	82	474
940	Пампкабу	https://www.orthrusonline.ru/static/images/p/nextgen/pumpkaboo.png	pumpkaboo	\N	88	0.4	5	2	Сбор предметов   Обыскивание   Бессонница	14	Самцы: 50% Самки: 50% 	3949	0	92.2	49	66	70	51	44	55	335
941	Горгейст	https://www.orthrusonline.ru/static/images/p/nextgen/gourgeist.png	gourgeist	\N	88	0.9	12.5	2	Сбор предметов   Обыскивание   Бессонница	14	Самцы: 50% Самки: 50% 	577	4	97.2	65	90	122	84	58	75	494
942	Бергмит	https://www.orthrusonline.ru/static/images/p/nextgen/bergmite.png	bergmite	\N	12	1	99.5	2	Собственный темп   Ледяное тело   Стойкость	14	Самцы: 50% Самки: 50% 	1655	24	95.6	55	69	85	28	32	35	304
943	Авалагг	https://www.orthrusonline.ru/static/images/p/nextgen/avalugg.png	avalugg	\N	12	2	505	2	Собственный темп   Ледяное тело   Стойкость	14	Самцы: 50% Самки: 50% 	382	38	97.3	95	117	184	28	44	46	514
944	Нойбат	https://www.orthrusonline.ru/static/images/p/nextgen/noibat.png	noibat	\N	186	0.5	8	2	Обыскивание   Проскальзывание   Телепатия	14	Самцы: 50% Самки: 50% 	587	303	98.6	40	30	35	55	45	40	245
945	Нойверн	https://www.orthrusonline.ru/static/images/p/nextgen/noivern.png	noivern	\N	186	1.5	85	2	Обыскивание   Проскальзывание   Телепатия	14	Самцы: 50% Самки: 50% 	222	86	98.3	85	70	80	123	97	80	535
946	Зёрниас	https://www.orthrusonline.ru/static/images/p/nextgen/xerneas.png	xerneas	\N	105	3	215	3	Волшебная аура	80	Бесполые	50	20	99.6	126	131	95	99	131	98	680
947	Ивелталь	https://www.orthrusonline.ru/static/images/p/nextgen/yveltal.png	yveltal	\N	39	5.8	203	3	Тёмная аура	80	Бесполые	62	23	99.6	126	131	95	99	131	98	680
948	Зигард	https://www.orthrusonline.ru/static/images/p/nextgen/zygarde.png	zygarde	\N	66	5	305	3	Разлом Ауры   Мощное строение	80	Бесполые	79	29	99.6	108	100	121	95	81	95	600
949	Дианси	https://www.orthrusonline.ru/static/images/p/nextgen/diancie.png	diancie	\N	90	0.7	8.8	3	Чистое тело	80	Бесполые	20	4	99.9	50	100	150	50	100	150	600
950	Хупа	https://www.orthrusonline.ru/static/images/p/nextgen/hoopa.png	hoopa	\N	113	0.5	9	3	Чародейство	80	Бесполые	91	10	99.5	80	110	60	70	150	130	600
951	Вулканьон	https://www.orthrusonline.ru/static/images/p/nextgen/volcanion.png	volcanion	\N	187	1.7	195	3	Поглощение воды	80	Бесполые	17	4	99.9	80	110	120	70	130	90	600
952	Роулет	https://www.orthrusonline.ru/static/images/p/nextgen/rowlet.png	rowlet	\N	76	0.3	1.5	1	Сверхрост   Большой обхват	10	Самцы: 87.5% Самки: 12.5% 	1295	241	92.6	68	55	55	42	50	50	320
953	Дартрикс	https://www.orthrusonline.ru/static/images/p/nextgen/dartrix.png	dartrix	\N	76	0.7	16	1	Сверхрост   Большой обхват	10	Самцы: 87.5% Самки: 12.5% 	824	12	93.2	78	75	75	52	70	70	420
954	Десиджуай	https://www.orthrusonline.ru/static/images/p/nextgen/decidueye.png	decidueye	\N	188	1.6	36.6	1	Сверхрост   Большой обхват	10	Самцы: 87.5% Самки: 12.5% 	1074	95	91.2	78	107	75	70	100	100	530
955	Литтен	https://www.orthrusonline.ru/static/images/p/nextgen/litten.png	litten	\N	58	0.4	4.3	1	Яростное пламя   Запугивание	10	Самцы: 87.5% Самки: 12.5% 	2577	109	80.3	45	65	40	70	60	40	320
956	Торракат	https://www.orthrusonline.ru/static/images/p/nextgen/torracat.png	torracat	\N	58	0.7	25	1	Яростное пламя   Запугивание	10	Самцы: 87.5% Самки: 12.5% 	1924	28	84.2	65	85	50	90	80	50	420
957	Инсайнрор	https://www.orthrusonline.ru/static/images/p/nextgen/incineroar.png	incineroar	\N	189	1.8	83	1	Яростное пламя   Запугивание	10	Самцы: 87.5% Самки: 12.5% 	1795	115	85.3	95	115	90	60	80	90	530
958	Попплио	https://www.orthrusonline.ru/static/images/p/nextgen/popplio.png	popplio	\N	4	0.4	7.5	1	Всплеск   Плавный голос	10	Самцы: 87.5% Самки: 12.5% 	972	175	94.9	50	54	54	40	66	56	320
959	Брион	https://www.orthrusonline.ru/static/images/p/nextgen/brionne.png	brionne	\N	4	0.6	17.5	1	Всплеск   Плавный голос	10	Самцы: 87.5% Самки: 12.5% 	492	15	96	60	69	69	50	91	81	420
960	Примарина	https://www.orthrusonline.ru/static/images/p/nextgen/primarina.png	primarina	\N	134	1.8	44	1	Всплеск   Плавный голос	10	Самцы: 87.5% Самки: 12.5% 	601	87	95.1	80	74	74	60	126	116	530
961	Пикипек	https://www.orthrusonline.ru/static/images/p/nextgen/pikipek.png	pikipek	\N	7	0.3	1.2	2	Острый глаз   Развитие навыка   Сбор предметов	10	Самцы: 50% Самки: 50% 	4176	6	94.5	35	75	30	65	30	30	265
962	Трамбик	https://www.orthrusonline.ru/static/images/p/nextgen/trumbeak.png	trumbeak	\N	7	0.6	14.8	2	Острый глаз   Развитие навыка   Сбор предметов	10	Самцы: 50% Самки: 50% 	3185	11	93.8	55	85	50	75	40	50	355
963	Тукенон	https://www.orthrusonline.ru/static/images/p/nextgen/toucannon.png	toucannon	\N	7	1.1	26	2	Острый глаз   Развитие навыка   Грубая сила	10	Самцы: 50% Самки: 50% 	1631	13	95.4	80	120	75	60	75	75	485
964	Янгус	https://www.orthrusonline.ru/static/images/p/nextgen/yungoos.png	yungoos	\N	17	0.4	6	2	Надзор   Крепкая челюсть   Адаптация	10	Самцы: 50% Самки: 50% 	9541	623	85.2	48	70	30	45	30	30	253
965	Гамшос	https://www.orthrusonline.ru/static/images/p/nextgen/gumshoos.png	gumshoos	\N	17	0.7	14.2	2	Надзор   Крепкая челюсть   Адаптация	10	Самцы: 50% Самки: 50% 	31273	476	82.1	88	110	60	45	55	60	418
966	Граббин	https://www.orthrusonline.ru/static/images/p/nextgen/grubbin.png	grubbin	\N	120	0.4	4.4	2	Роение	10	Самцы: 50% Самки: 50% 	9233	24	91.6	47	62	45	46	55	45	300
967	Чарьябаг	https://www.orthrusonline.ru/static/images/p/nextgen/charjabug.png	charjabug	\N	167	0.5	10.5	2	Аккумулятор	10	Самцы: 50% Самки: 50% 	489	21	97.7	57	82	95	36	55	75	400
968	Викавольт	https://www.orthrusonline.ru/static/images/p/nextgen/vikavolt.png	vikavolt	\N	167	1.5	45	2	Левитация	10	Самцы: 50% Самки: 50% 	209	13	98.5	77	70	90	43	145	75	500
969	Крабролер	https://www.orthrusonline.ru/static/images/p/nextgen/crabrawler.png	crabrawler	\N	20	0.6	7	2	Суперсильные когти   Железный кулак   Прилив гнева	14	Самцы: 50% Самки: 50% 	2583	0	96	47	82	57	63	42	47	338
970	Крабоминебл	https://www.orthrusonline.ru/static/images/p/nextgen/crabominable.png	crabominable	\N	190	1.7	180	2	Суперсильные когти   Железный кулак   Прилив гнева	14	Самцы: 50% Самки: 50% 	7284	51	92.2	97	132	77	43	62	67	478
971	Орикорио	https://www.orthrusonline.ru/static/images/p/nextgen/oricorio.png	oricorio	\N	2	0.6	3.4	2	Танцовщик	14	Самцы: 25% Самки: 75% 	2655	5	92.2	75	70	70	93	98	70	476
972	Кьютифлай	https://www.orthrusonline.ru/static/images/p/nextgen/cutiefly.png	cutiefly	\N	191	0.1	0.2	2	Сбор мёда   Защитная пыльца   Сладкий покров	14	Самцы: 50% Самки: 50% 	2877	5	93.9	40	45	40	84	55	40	304
973	Рибомби	https://www.orthrusonline.ru/static/images/p/nextgen/ribombee.png	ribombee	\N	191	0.2	0.5	2	Сбор мёда   Защитная пыльца   Сладкий покров	14	Самцы: 50% Самки: 50% 	2456	23	95.1	60	55	60	124	95	70	464
974	Рокрафф	https://www.orthrusonline.ru/static/images/p/nextgen/rockruff.png	rockruff	\N	93	0.5	9.2	2	Острый глаз   Подъём духа   Неукротимость	10	Самцы: 50% Самки: 50% 	3162	14	95.6	45	65	40	60	30	40	280
975	Ликанрок	https://www.orthrusonline.ru/static/images/p/nextgen/lycanroc.png	lycanroc	\N	93	0.8	25	2	Острый глаз   Песчаная гонка   Неукротимость	10	Самцы: 50% Самки: 50% 	287	10	97.9	75	115	65	112	55	65	487
976	Вишиваши	https://www.orthrusonline.ru/static/images/p/nextgen/wishiwashi.png	wishiwashi	\N	4	0.2	0.3	4	Стая	10	Самцы: 50% Самки: 50% 	5144	11	92.9	45	20	20	40	25	25	175
977	Мариани	https://www.orthrusonline.ru/static/images/p/nextgen/mareanie.png	mareanie	\N	181	0.4	8	2	Беспощадность   Гибкость   Регенерация	14	Самцы: 50% Самки: 50% 	1366	589	97.7	50	53	62	45	43	52	305
978	Токсапекс	https://www.orthrusonline.ru/static/images/p/nextgen/toxapex.png	toxapex	\N	181	0.7	14.5	2	Беспощадность   Гибкость   Регенерация	14	Самцы: 50% Самки: 50% 	415	129	97.6	50	63	152	35	53	142	495
979	Мадбрэй	https://www.orthrusonline.ru/static/images/p/nextgen/mudbray.png	mudbray	\N	100	1	110	2	Собственный темп   Выносливость   Концентрация	14	Самцы: 50% Самки: 50% 	3740	9	95.6	70	100	70	45	45	55	385
980	Мадсдейл	https://www.orthrusonline.ru/static/images/p/nextgen/mudsdale.png	mudsdale	\N	100	2.5	920	2	Собственный темп   Выносливость   Концентрация	14	Самцы: 50% Самки: 50% 	501	9	97.9	100	125	100	35	55	85	500
981	Дупайдер	https://www.orthrusonline.ru/static/images/p/nextgen/dewpider.png	dewpider	\N	192	0.3	4	2	Водный пузырь   Поглощение воды	10	Самцы: 50% Самки: 50% 	2990	15	97.3	38	40	52	27	40	72	269
982	Аракванид	https://www.orthrusonline.ru/static/images/p/nextgen/araquanid.png	araquanid	\N	192	1.8	82	2	Водный пузырь   Поглощение воды	10	Самцы: 50% Самки: 50% 	150	10	98.9	68	70	92	42	50	132	454
983	Фомантис	https://www.orthrusonline.ru/static/images/p/nextgen/fomantis.png	fomantis	\N	64	0.3	1.5	2	Травяной щит   Порочность	14	Самцы: 50% Самки: 50% 	3538	7	92.5	40	55	35	35	50	35	250
984	Лурантис	https://www.orthrusonline.ru/static/images/p/nextgen/lurantis.png	lurantis	\N	64	0.9	18.5	2	Травяной щит   Порочность	14	Самцы: 50% Самки: 50% 	2964	17	93.7	70	105	90	45	80	90	480
985	Морилаль	https://www.orthrusonline.ru/static/images/p/nextgen/morelull.png	morelull	\N	163	0.2	1.5	2	Свечение   Эффект споры   Омывка дождем	14	Самцы: 50% Самки: 50% 	4379	14	93.3	40	35	55	15	65	75	285
986	Шинатик	https://www.orthrusonline.ru/static/images/p/nextgen/shiinotic.png	shiinotic	\N	163	1	11.5	2	Свечение   Эффект споры   Омывка дождем	14	Самцы: 50% Самки: 50% 	545	3	97.8	60	45	80	30	90	100	405
987	Саландит	https://www.orthrusonline.ru/static/images/p/nextgen/salandit.png	salandit	\N	193	0.6	4.8	2	Окисление   Забвение	14	Самцы: 87.5% Самки: 12.5% 	6233	15	93.2	48	44	40	77	71	40	320
988	Салаззл	https://www.orthrusonline.ru/static/images/p/nextgen/salazzle.png	salazzle	\N	193	1.2	22.2	2	Окисление   Забвение	14	Только самки	215	12	98.4	68	64	60	117	111	60	480
989	Стаффул	https://www.orthrusonline.ru/static/images/p/nextgen/stufful.png	stufful	\N	65	0.5	6.8	2	Пушистик   Неуклюжесть   Очарование	10	Самцы: 50% Самки: 50% 	8208	87	92.7	70	75	50	50	45	50	340
990	Бивеар	https://www.orthrusonline.ru/static/images/p/nextgen/bewear.png	bewear	\N	65	2.1	135	2	Пушистик   Неуклюжесть   Нервирование	10	Самцы: 50% Самки: 50% 	747	9	96.6	120	125	80	60	55	60	500
991	Боунсвит	https://www.orthrusonline.ru/static/images/p/nextgen/bounsweet.png	bounsweet	\N	64	0.3	3.2	1	Травяной щит   Забвение   Сладкий покров	14	Самцы: 12.5% Самки: 87.5% 	4685	15	89.7	42	30	38	32	30	38	210
992	Стини	https://www.orthrusonline.ru/static/images/p/nextgen/steenee.png	steenee	\N	64	0.7	8.2	1	Травяной щит   Забвение   Сладкий покров	14	Самцы: 12.5% Самки: 87.5% 	1156	7	97.6	52	40	48	62	40	48	290
993	Царина	https://www.orthrusonline.ru/static/images/p/nextgen/tsareena.png	tsareena	\N	64	1.2	21.4	1	Травяной щит   Величие   Сладкий покров	14	Самцы: 12.5% Самки: 87.5% 	411	7	96.8	72	120	98	72	50	98	510
994	Комфей	https://www.orthrusonline.ru/static/images/p/nextgen/comfey.png	comfey	\N	105	0.1	0.3	4	Цветочный покров   Сортировка   Естественное исцеление	14	Самцы: 25% Самки: 75% 	5633	17	91.6	51	52	90	100	82	110	485
995	Орангуру	https://www.orthrusonline.ru/static/images/p/nextgen/oranguru.png	oranguru	\N	135	1.5	76	3	Концентрация   Телепатия   Симбиоз	14	Самцы: 50% Самки: 50% 	1442	2	97.4	90	60	80	60	90	110	490
996	Пассимиан	https://www.orthrusonline.ru/static/images/p/nextgen/passimian.png	passimian	\N	20	2	82.8	3	Приёмник   Непокорность	14	Самцы: 50% Самки: 50% 	128	16	99.2	100	120	90	80	40	60	490
997	Вимпод	https://www.orthrusonline.ru/static/images/p/nextgen/wimpod.png	wimpod	\N	143	0.5	12	2	Трусливость	14	Самцы: 50% Самки: 50% 	2006	1	97	25	35	40	80	20	30	230
998	Голисопод	https://www.orthrusonline.ru/static/images/p/nextgen/golisopod.png	golisopod	\N	143	2	108	2	Экстренное отступление	14	Самцы: 50% Самки: 50% 	157	7	98.8	75	125	140	40	60	90	530
999	Сэндигаст	https://www.orthrusonline.ru/static/images/p/nextgen/sandygast.png	sandygast	\N	194	0.5	70	2	Водное уплотнение   Песчаный покров	10	Самцы: 50% Самки: 50% 	3896	4	98	55	55	80	15	70	45	320
1000	Палоссэнд	https://www.orthrusonline.ru/static/images/p/nextgen/palossand.png	palossand	\N	194	1.3	250	2	Водное уплотнение   Песчаный покров	10	Самцы: 50% Самки: 50% 	220	7	99.1	85	75	110	35	100	75	480
1001	Пьюкумуку	https://www.orthrusonline.ru/static/images/p/nextgen/pyukumuku.png	pyukumuku	\N	4	0.3	1.2	4	Наизнанку   Безразличие	10	Самцы: 50% Самки: 50% 	9052	61	91.2	55	60	130	5	30	130	410
1002	Тип: Ноль	https://www.orthrusonline.ru/static/images/p/nextgen/typenull.png	typenull	\N	17	1.9	120.5	3	Боевая броня	80	Бесполые	205	8	98.9	95	95	95	59	95	95	534
1003	Силвалли	https://www.orthrusonline.ru/static/images/p/nextgen/silvally.png	silvally	\N	17	2.3	100.5	3	Система RKS	80	Бесполые	96	12	99.2	95	95	95	95	95	95	570
1004	Миниор	https://www.orthrusonline.ru/static/images/p/nextgen/minior.png	minior	\N	36	0.3	0.3	1	Беззащитность	17	Бесполые	2131	45	95.5	60	100	60	120	100	60	500
1005	Комала	https://www.orthrusonline.ru/static/images/p/nextgen/komala.png	komala	\N	17	0.4	19.9	3	Бессознательность	14	Самцы: 50% Самки: 50% 	2648	46	94.9	65	115	65	65	75	95	480
1006	Тартонатор	https://www.orthrusonline.ru/static/images/p/nextgen/turtonator.png	turtonator	\N	3	2	212	2	Панцирь-броня	14	Самцы: 50% Самки: 50% 	148	17	99.2	60	78	135	36	91	85	485
1007	Тогедемару	https://www.orthrusonline.ru/static/images/p/nextgen/togedemaru.png	togedemaru	\N	126	0.3	3.3	2	Стальные шипы   Громоотвод   Стойкость	7	Самцы: 50% Самки: 50% 	2591	2	94	65	98	63	96	40	73	435
1008	Мимикью	https://www.orthrusonline.ru/static/images/p/nextgen/mimikyu.png	mimikyu	\N	94	0.2	0.7	2	Маскировка	14	Самцы: 50% Самки: 50% 	1891	28	95.6	55	90	80	96	50	105	476
1009	Браксиш	https://www.orthrusonline.ru/static/images/p/nextgen/bruxish.png	bruxish	\N	24	0.9	19	2	Ослепление   Крепкая челюсть   Призрачная кожа	10	Самцы: 50% Самки: 50% 	2610	8	96.7	68	105	70	92	70	70	475
1010	Дрампа	https://www.orthrusonline.ru/static/images/p/nextgen/drampa.png	drampa	\N	195	3	185	2	Неистовство   Поглотитель соков   Девятое небо	14	Самцы: 50% Самки: 50% 	774	15	98.2	78	60	85	36	135	91	485
1011	Делмайз	https://www.orthrusonline.ru/static/images/p/nextgen/dhelmise.png	dhelmise	\N	88	3.9	210	2	Сталевар	17	Бесполые	1824	7	95.8	70	131	100	40	86	90	517
1012	Джангмо-о	https://www.orthrusonline.ru/static/images/p/nextgen/jangmoo.png	jangmoo	\N	132	0.6	29.7	3	Пуленепробиваемость   Звуконепроницаемость   Пыленепроницаемость	27	Самцы: 50% Самки: 50% 	167	4	99.2	45	55	65	45	45	45	300
1013	Хакамо-o	https://www.orthrusonline.ru/static/images/p/nextgen/hakamoo.png	hakamoo	\N	196	1.2	47	3	Пуленепробиваемость   Звуконепроницаемость   Пыленепроницаемость	27	Самцы: 50% Самки: 50% 	10	0	99.9	55	75	90	65	65	70	420
1014	Коммо-o	https://www.orthrusonline.ru/static/images/p/nextgen/kommoo.png	kommoo	\N	196	1.6	78.2	3	Пуленепробиваемость   Звуконепроницаемость   Пыленепроницаемость	27	Самцы: 50% Самки: 50% 	120	11	99.1	75	110	125	85	100	105	600
1015	Тапу Коко	https://www.orthrusonline.ru/static/images/p/nextgen/tapukoko.png	tapukoko	\N	185	1.8	20.5	3	Электрическая волна   Телепатия	54	Бесполые	116	25	99.4	70	115	85	130	95	75	570
1016	Тапу Леле	https://www.orthrusonline.ru/static/images/p/nextgen/tapulele.png	tapulele	\N	22	1.2	18.6	3	Психическая волна   Телепатия	54	Бесполые	116	26	99.3	70	85	75	95	130	115	570
1017	Тапу Булу	https://www.orthrusonline.ru/static/images/p/nextgen/tapubulu.png	tapubulu	\N	163	1.9	45.5	3	Травяная волна   Телепатия	54	Бесполые	108	14	99.5	70	130	115	75	85	95	570
1018	Тапу Фини	https://www.orthrusonline.ru/static/images/p/nextgen/tapufini.png	tapufini	\N	134	1.3	21.2	3	Туманная волна   Телепатия	54	Бесполые	143	37	99.4	70	75	115	85	95	130	570
1019	Космог	https://www.orthrusonline.ru/static/images/p/nextgen/cosmog.png	cosmog	\N	19	0.2	0.1	3	Безразличие	80	Бесполые	22	2	99.8	43	29	31	37	29	31	200
1021	Солгалео	https://www.orthrusonline.ru/static/images/p/nextgen/solgaleo.png	solgaleo	\N	197	3.4	230	3	Цельнометаллическое тело	80	Бесполые	26	8	99.8	137	137	107	97	113	89	680
1022	Лунала	https://www.orthrusonline.ru/static/images/p/nextgen/lunala.png	lunala	\N	113	4	120	3	Теневой щит	80	Бесполые	46	23	99.7	137	113	89	97	137	107	680
1023	Нихилего	https://www.orthrusonline.ru/static/images/p/nextgen/nihilego.png	nihilego	\N	198	1.2	55.5	3	Звериная мощь	80	Бесполые	23	2	99.8	109	53	47	103	127	131	570
1024	Базвол	https://www.orthrusonline.ru/static/images/p/nextgen/buzzwole.png	buzzwole	\N	46	2.4	333.6	3	Звериная мощь	80	Бесполые	23	6	99.8	107	139	139	79	53	53	570
1025	Фиромоса	https://www.orthrusonline.ru/static/images/p/nextgen/pheromosa.png	pheromosa	\N	46	1.8	25	3	Звериная мощь	80	Бесполые	51	11	99.6	71	137	37	151	137	37	570
1026	Зюркиртри	https://www.orthrusonline.ru/static/images/p/nextgen/xurkitree.png	xurkitree	\N	9	3.8	100	3	Звериная мощь	80	Бесполые	8	2	99.9	83	89	71	83	173	71	570
1027	Целестила	https://www.orthrusonline.ru/static/images/p/nextgen/celesteela.png	celesteela	\N	139	9.2	999.9	3	Звериная мощь	80	Бесполые	16	13	99.9	97	101	103	61	107	101	570
1028	Картана	https://www.orthrusonline.ru/static/images/p/nextgen/kartana.png	kartana	\N	168	0.3	0.1	3	Звериная мощь	80	Бесполые	17	4	99.9	59	181	131	109	59	31	570
1029	Газлорд	https://www.orthrusonline.ru/static/images/p/nextgen/guzzlord.png	guzzlord	\N	172	5.5	888	3	Звериная мощь	80	Бесполые	13	8	99.9	223	101	53	43	97	53	570
1030	Некрозма	https://www.orthrusonline.ru/static/images/p/nextgen/necrozma.png	necrozma	\N	19	2.4	230	3	Призменный доспех	80	Бесполые	9	0	99.9	97	107	101	79	127	89	600
1031	Магирна	https://www.orthrusonline.ru/static/images/p/nextgen/magearna.png	magearna	\N	54	1	80.5	3	Единство	80	Бесполые	45	11	99.7	80	95	115	65	130	115	600
1032	Маршадо	https://www.orthrusonline.ru/static/images/p/nextgen/marshadow.png	marshadow	\N	199	0.7	22.2	3	Техничность	80	Бесполые	77	27	99.5	90	125	80	125	90	90	600
1033	Пойпол	https://www.orthrusonline.ru/static/images/p/nextgen/poipole.png	poipole	\N	121	0.6	1.8	3	Звериная мощь	80	Бесполые	7	1	100	67	73	67	73	73	67	420
1034	Наганадел	https://www.orthrusonline.ru/static/images/p/nextgen/naganadel.png	naganadel	\N	109	3.6	150	3	Звериная мощь	80	Бесполые	23	5	99.8	73	73	73	121	127	73	540
1035	Стакатака	https://www.orthrusonline.ru/static/images/p/nextgen/stakataka.png	stakataka	\N	155	5.5	820	3	Звериная мощь	80	Бесполые	10	1	99.9	61	131	211	13	53	101	570
1036	Блацефалон	https://www.orthrusonline.ru/static/images/p/nextgen/blacephalon.png	blacephalon	\N	29	1.8	13	3	Звериная мощь	80	Бесполые	33	20	99.8	53	127	53	107	151	79	570
1037	Зераора	https://www.orthrusonline.ru/static/images/p/nextgen/zeraora.png	zeraora	\N	9	1.5	44.5	3	Поглощение электричества	80	Бесполые	58	26	99.6	88	112	75	143	102	80	600
1038	Мелтан	https://www.orthrusonline.ru/static/images/p/nextgen/meltan.png	meltan	\N	16	0.2	8	3	Магнитное притяжение	80	Бесполые	13	0	99.9	46	65	65	34	55	35	300
1039	Мелметалл	https://www.orthrusonline.ru/static/images/p/nextgen/melmetal.png	melmetal	\N	16	2.5	800	3	Железный кулак	80	Бесполые	21	4	99.8	135	143	143	34	80	65	600
1040	Груки	https://www.orthrusonline.ru/static/images/p/nextgen/grookey.png	grookey	\N	64	0.3	5	1	Сверхрост   Травяная волна	14	Самцы: 87.5% Самки: 12.5% 	1498	52	96.7	50	65	50	65	40	40	310
1041	Тваки	https://www.orthrusonline.ru/static/images/p/nextgen/thwackey.png	thwackey	\N	64	0.7	14	1	Сверхрост   Травяная волна	14	Самцы: 87.5% Самки: 12.5% 	113	1	99.1	70	85	70	80	55	60	420
1042	Риллабум	https://www.orthrusonline.ru/static/images/p/nextgen/rillaboom.png	rillaboom	\N	64	2.1	90	1	Сверхрост   Травяная волна	14	Самцы: 87.5% Самки: 12.5% 	265	12	98	100	125	90	85	60	70	530
1043	Скорбанни	https://www.orthrusonline.ru/static/images/p/nextgen/scorbunny.png	scorbunny	\N	58	0.3	4.5	1	Яростное пламя   Либеро	14	Самцы: 87.5% Самки: 12.5% 	1557	63	96	50	71	40	69	40	40	310
1044	Рабут	https://www.orthrusonline.ru/static/images/p/nextgen/raboot.png	raboot	\N	58	0.6	9	1	Яростное пламя   Либеро	14	Самцы: 87.5% Самки: 12.5% 	335	3	97.2	65	86	60	94	55	60	420
1045	Синдерейс	https://www.orthrusonline.ru/static/images/p/nextgen/cinderace.png	cinderace	\N	58	1.4	33	1	Яростное пламя   Либеро	14	Самцы: 87.5% Самки: 12.5% 	278	15	97.8	80	116	75	119	65	75	530
1046	Соббл	https://www.orthrusonline.ru/static/images/p/nextgen/sobble.png	sobble	\N	4	0.3	4	1	Всплеск   Снайпер	14	Самцы: 87.5% Самки: 12.5% 	447	56	97.7	50	40	40	70	70	40	310
1047	Дриззайл	https://www.orthrusonline.ru/static/images/p/nextgen/drizzile.png	drizzile	\N	4	0.7	11.5	1	Всплеск   Снайпер	14	Самцы: 87.5% Самки: 12.5% 	201	3	98.4	65	60	55	90	95	55	420
1048	Интелеон	https://www.orthrusonline.ru/static/images/p/nextgen/inteleon.png	inteleon	\N	4	1.9	45.2	1	Всплеск   Снайпер	14	Самцы: 87.5% Самки: 12.5% 	158	15	98.7	70	85	65	120	125	65	530
1049	Сквовет	https://www.orthrusonline.ru/static/images/p/nextgen/skwovet.png	skwovet	\N	17	0.3	2.5	2	Защёчный мешок   Прожорливость	14	Самцы: 50% Самки: 50% 	4336	209	95.6	70	55	55	25	35	35	275
1050	Гридент	https://www.orthrusonline.ru/static/images/p/nextgen/greedent.png	greedent	\N	17	0.6	6	2	Защёчный мешок   Прожорливость	14	Самцы: 50% Самки: 50% 	66	25	99.5	120	95	95	20	55	75	460
1051	Рукиди	https://www.orthrusonline.ru/static/images/p/nextgen/rookidee.png	rookidee	\N	83	0.2	1.8	1	Острый глаз   Нервирование   Большие клевки	10	Самцы: 50% Самки: 50% 	8524	46	94.8	38	47	35	57	33	35	245
1052	Корвисквир	https://www.orthrusonline.ru/static/images/p/nextgen/corvisquire.png	corvisquire	\N	83	0.8	16	1	Острый глаз   Нервирование   Большие клевки	10	Самцы: 50% Самки: 50% 	3741	46	97.4	68	67	55	77	43	55	365
1053	Корвинайт	https://www.orthrusonline.ru/static/images/p/nextgen/corviknight.png	corviknight	\N	96	2.2	75	1	Давление   Нервирование   Зеркальная броня	10	Самцы: 50% Самки: 50% 	205	23	98.6	98	87	105	67	53	85	495
1054	Блипбаг	https://www.orthrusonline.ru/static/images/p/nextgen/blipbug.png	blipbug	\N	120	0.4	8	2	Роение   Фасеточность   Телепатия	10	Самцы: 50% Самки: 50% 	3526	28	96.6	25	20	20	45	25	45	180
1055	Доттлер	https://www.orthrusonline.ru/static/images/p/nextgen/dottler.png	dottler	\N	97	0.4	19.5	2	Роение   Фасеточность   Телепатия	10	Самцы: 50% Самки: 50% 	38	4	99.7	50	35	80	30	50	90	335
1056	Орбитл	https://www.orthrusonline.ru/static/images/p/nextgen/orbeetle.png	orbeetle	\N	97	0.4	40.8	2	Роение   Обыскивание   Телепатия	10	Самцы: 50% Самки: 50% 	60	3	99.5	60	45	110	90	80	120	505
1057	Никит	https://www.orthrusonline.ru/static/images/p/nextgen/nickit.png	nickit	\N	15	0.6	8.9	4	Бегство   Освобождение   Надзор	10	Самцы: 50% Самки: 50% 	1667	5	98.1	40	28	28	50	47	52	245
1058	Фьевул	https://www.orthrusonline.ru/static/images/p/nextgen/thievul.png	thievul	\N	15	1.2	19.9	4	Бегство   Освобождение   Надзор	10	Самцы: 50% Самки: 50% 	51	1	99.6	70	58	58	90	87	92	455
1059	Госсифлёр	https://www.orthrusonline.ru/static/images/p/nextgen/gossifleur.png	gossifleur	\N	64	0.4	2.2	2	Хлопковый взрыв   Регенерация   Эффект споры	14	Самцы: 50% Самки: 50% 	2330	14	96.7	40	40	60	10	40	60	250
1060	Эльдегосс	https://www.orthrusonline.ru/static/images/p/nextgen/eldegoss.png	eldegoss	\N	64	0.5	2.5	2	Хлопковый взрыв   Регенерация   Эффект споры	14	Самцы: 50% Самки: 50% 	621	10	98.4	60	50	90	60	80	120	460
1061	Вулу	https://www.orthrusonline.ru/static/images/p/nextgen/wooloo.png	wooloo	\N	17	0.6	6	2	Пушистик   Бегство   Пуленепробиваемость	10	Самцы: 50% Самки: 50% 	6152	122	95	42	40	55	48	40	45	270
1062	Дабвул	https://www.orthrusonline.ru/static/images/p/nextgen/dubwool.png	dubwool	\N	17	1.3	43	2	Пушистик   Неукротимость   Пуленепробиваемость	10	Самцы: 50% Самки: 50% 	155	12	99	72	80	100	88	60	90	490
1063	Чьюти	https://www.orthrusonline.ru/static/images/p/nextgen/chewtle.png	chewtle	\N	4	0.3	8.5	2	Крепкая челюсть   Панцирь-броня   Быстрое плаванье	14	Самцы: 50% Самки: 50% 	1433	69	98.5	50	64	50	44	38	38	284
1064	Дреднав	https://www.orthrusonline.ru/static/images/p/nextgen/drednaw.png	drednaw	\N	98	1	115.5	2	Крепкая челюсть   Панцирь-броня   Быстрое плаванье	14	Самцы: 50% Самки: 50% 	52	24	99.6	90	115	90	74	48	68	485
1065	Ямпер	https://www.orthrusonline.ru/static/images/p/nextgen/yamper.png	yamper	\N	9	0.3	13.5	4	Погоня за мячом   Нервозность	14	Самцы: 50% Самки: 50% 	1049	6	98.1	59	45	50	26	40	50	270
1066	Болтанд	https://www.orthrusonline.ru/static/images/p/nextgen/boltund.png	boltund	\N	9	1	34	4	Крепкая челюсть   Состязательность	14	Самцы: 50% Самки: 50% 	639	1	98.7	69	90	60	121	90	60	490
1067	Роликоли	https://www.orthrusonline.ru/static/images/p/nextgen/rolycoly.png	rolycoly	\N	93	0.3	12	1	Паровой двигатель   Жаропрочность   Вспышка пламени	10	Самцы: 50% Самки: 50% 	2708	13	97.7	30	40	50	30	40	50	240
1068	Каркол	https://www.orthrusonline.ru/static/images/p/nextgen/carkol.png	carkol	\N	99	1.1	78	1	Паровой двигатель   Огненное тело   Вспышка пламени	10	Самцы: 50% Самки: 50% 	661	10	98.8	80	60	90	50	60	70	410
1069	Коалоссал	https://www.orthrusonline.ru/static/images/p/nextgen/coalossal.png	coalossal	\N	99	2.8	310.5	1	Паровой двигатель   Огненное тело   Вспышка пламени	10	Самцы: 50% Самки: 50% 	70	7	99.4	110	80	120	30	80	90	510
1070	Эплин	https://www.orthrusonline.ru/static/images/p/nextgen/applin.png	applin	\N	28	0.2	0.5	5	Созревание   Прожорливость   Пуленепробиваемость	14	Самцы: 50% Самки: 50% 	5546	7	95.5	40	40	80	20	40	40	260
1071	Флэпл	https://www.orthrusonline.ru/static/images/p/nextgen/flapple.png	flapple	\N	28	0.3	1	5	Созревание   Прожорливость   Энергичность	14	Самцы: 50% Самки: 50% 	101	5	99.3	70	110	80	70	95	60	485
1072	Эплтан	https://www.orthrusonline.ru/static/images/p/nextgen/appletun.png	appletun	\N	28	0.4	13	5	Созревание   Прожорливость   Толстая кожа	14	Самцы: 50% Самки: 50% 	115	9	99.2	110	85	80	30	100	80	485
1073	Силикобра	https://www.orthrusonline.ru/static/images/p/nextgen/silicobra.png	silicobra	\N	100	2.2	7.6	2	Песчаная коса   Сбрасывание кожи   Песчаный покров	14	Самцы: 50% Самки: 50% 	1774	8	97.3	52	57	75	46	35	50	315
1074	Сандаконда	https://www.orthrusonline.ru/static/images/p/nextgen/sandaconda.png	sandaconda	\N	100	3.8	65.5	2	Песчаная коса   Сбрасывание кожи   Песчаный покров	14	Самцы: 50% Самки: 50% 	1246	2	98.3	72	107	125	71	65	70	510
1076	Аррокуда	https://www.orthrusonline.ru/static/images/p/nextgen/arrokuda.png	arrokuda	\N	4	0.5	1	3	Быстрое плаванье   Пропеллер	14	Самцы: 50% Самки: 50% 	1293	3	98.9	41	63	40	66	40	30	280
1077	Барраскида	https://www.orthrusonline.ru/static/images/p/nextgen/barraskewda.png	barraskewda	\N	4	1.3	30	3	Быстрое плаванье   Пропеллер	14	Самцы: 50% Самки: 50% 	23	4	99.8	61	123	60	136	60	50	490
1078	Токсель	https://www.orthrusonline.ru/static/images/p/nextgen/toxel.png	toxel	\N	102	0.4	11	1	Нервозность   Статическое электричество   Неуклюжесть	17	Самцы: 50% Самки: 50% 	47	0	99.7	40	38	35	40	54	35	242
1079	Токстрисити	https://www.orthrusonline.ru/static/images/p/nextgen/toxtricity.png	toxtricity	\N	102	1.6	40	1	Панк-рок   Плюс   Техничность	17	Самцы: 50% Самки: 50% 	31	7	99.8	75	98	70	75	114	70	502
1080	Сиззлипид	https://www.orthrusonline.ru/static/images/p/nextgen/sizzlipede.png	sizzlipede	\N	103	0.7	1	2	Вспышка пламени   Белый дым   Огненное тело	14	Самцы: 50% Самки: 50% 	1432	5	98	50	65	45	45	50	50	305
1081	Сентискорч	https://www.orthrusonline.ru/static/images/p/nextgen/centiskorch.png	centiskorch	\N	103	3	120	2	Вспышка пламени   Белый дым   Огненное тело	14	Самцы: 50% Самки: 50% 	785	3	98.3	100	115	65	65	90	90	525
1082	Клоббопус	https://www.orthrusonline.ru/static/images/p/nextgen/clobbopus.png	clobbopus	\N	20	0.6	4	1	Гибкость   Техничность	17	Самцы: 50% Самки: 50% 	196	84	99.4	50	68	60	32	50	50	310
1083	Грапплокт	https://www.orthrusonline.ru/static/images/p/nextgen/grapploct.png	grapploct	\N	20	1.6	39	1	Гибкость   Техничность	17	Самцы: 50% Самки: 50% 	37	20	99.7	80	118	90	42	70	80	480
1084	Синисти	https://www.orthrusonline.ru/static/images/p/nextgen/sinistea.png	sinistea	\N	48	0.1	0.2	2	Слабая броня   Проклятое тело	14	Бесполые	1528	4	98.4	40	45	45	50	74	54	308
1085	Полтигейст	https://www.orthrusonline.ru/static/images/p/nextgen/polteageist.png	polteageist	\N	48	0.2	0.4	2	Слабая броня   Проклятое тело	14	Бесполые	244	5	98	60	65	65	70	134	114	508
1086	Хатенна	https://www.orthrusonline.ru/static/images/p/nextgen/hatenna.png	hatenna	\N	19	0.4	3.4	3	Исцеление   Предвидение   Волшебное зеркало	14	Только самки	391	202	99.3	42	30	45	39	56	53	265
1087	Хаттрем	https://www.orthrusonline.ru/static/images/p/nextgen/hattrem.png	hattrem	\N	19	0.6	4.8	3	Исцеление   Предвидение   Волшебное зеркало	14	Только самки	9	7	99.9	57	40	65	49	86	73	370
1088	Хаттерена	https://www.orthrusonline.ru/static/images/p/nextgen/hatterene.png	hatterene	\N	22	2.1	5.1	3	Исцеление   Предвидение   Волшебное зеркало	14	Только самки	54	33	99.6	57	90	95	29	136	103	510
1089	Импидимп	https://www.orthrusonline.ru/static/images/p/nextgen/impidimp.png	impidimp	\N	104	0.4	5.5	2	Проказник   Обыскивание   Карманный вор	14	Только самцы	1667	9	98.1	45	45	30	50	55	40	265
1090	Моргрем	https://www.orthrusonline.ru/static/images/p/nextgen/morgrem.png	morgrem	\N	104	0.8	12.5	2	Проказник   Обыскивание   Карманный вор	14	Только самцы	315	0	99.3	65	60	45	70	75	55	370
1091	Гриммснарл	https://www.orthrusonline.ru/static/images/p/nextgen/grimmsnarl.png	grimmsnarl	\N	104	1.5	61	2	Проказник   Обыскивание   Карманный вор	14	Только самцы	550	8	98.4	95	120	65	60	95	75	510
1092	Обстагун	https://www.orthrusonline.ru/static/images/p/nextgen/obstagoon.png	obstagoon	\N	8	1.6	46	2	Опрометчивость   Сила воли   Непокорность	10	Самцы: 50% Самки: 50% 	150	11	99	93	90	101	95	60	81	520
1093	Перрсеркер	https://www.orthrusonline.ru/static/images/p/nextgen/perrserker.png	perrserker	\N	16	0.8	28	2	Боевая броня   Крепкие когти   Суровый дух	14	Самцы: 50% Самки: 50% 	523	15	98.6	70	110	100	50	50	60	440
1094	Курсола	https://www.orthrusonline.ru/static/images/p/nextgen/cursola.png	cursola	\N	48	1	0.4	4	Слабая броня   Мертвое тело	14	Самцы: 25% Самки: 75% 	27	0	99.8	60	95	50	30	145	130	510
1095	Сирфетчд	https://www.orthrusonline.ru/static/images/p/nextgen/sirfetchd.png	sirfetchd	\N	20	0.8	117	2	Неукротимость   Дерзость	14	Самцы: 50% Самки: 50% 	36	4	99.7	62	135	95	65	68	82	507
1096	Мистер Райм	https://www.orthrusonline.ru/static/images/p/nextgen/mrrime.png	mrrime	\N	31	1.5	58.2	2	Косолапость   Очистка поля   Ледяное тело	17	Самцы: 50% Самки: 50% 	40	4	99.7	80	85	75	70	110	100	520
1097	Рунеригус	https://www.orthrusonline.ru/static/images/p/nextgen/runerigus.png	runerigus	\N	81	1.6	66.6	2	Блуждающий дух	17	Самцы: 50% Самки: 50% 	257	5	99.1	58	95	145	30	50	105	483
1098	Милсери	https://www.orthrusonline.ru/static/images/p/nextgen/milcery.png	milcery	\N	105	0.2	0.3	2	Сладкий покров   Ароматный покров	14	Только самки	1362	2	97.9	45	40	40	34	50	61	270
1099	Алкреми	https://www.orthrusonline.ru/static/images/p/nextgen/alcremie.png	alcremie	\N	105	0.3	0.5	2	Сладкий покров   Ароматный покров	14	Только самки	475	0	98.6	65	60	75	64	110	121	495
1100	Фалинкс	https://www.orthrusonline.ru/static/images/p/nextgen/falinks.png	falinks	\N	20	3	62	2	Боевая броня   Непокорность	17	Бесполые	490	3	98.4	65	100	100	75	70	60	470
1101	Пинкёрчин	https://www.orthrusonline.ru/static/images/p/nextgen/pincurchin.png	pincurchin	\N	9	0.3	1	2	Громоотвод   Электрическая волна	14	Самцы: 50% Самки: 50% 	2025	22	97	48	101	95	15	91	85	435
1102	Сном	https://www.orthrusonline.ru/static/images/p/nextgen/snom.png	snom	\N	200	0.3	3.8	2	Защитная пыльца   Ледяная чешуя	14	Самцы: 50% Самки: 50% 	496	4	98.4	30	25	35	20	45	30	185
1103	Фросмот	https://www.orthrusonline.ru/static/images/p/nextgen/frosmoth.png	frosmoth	\N	200	1.3	42	2	Защитная пыльца   Ледяная чешуя	14	Самцы: 50% Самки: 50% 	87	7	99.3	70	65	60	65	125	90	475
1104	Стонджорнер	https://www.orthrusonline.ru/static/images/p/nextgen/stonjourner.png	stonjourner	\N	93	2.5	520	3	Заряд силы	17	Самцы: 50% Самки: 50% 	450	3	99.2	100	125	135	70	20	20	470
1105	Айскью	https://www.orthrusonline.ru/static/images/p/nextgen/eiscue.png	eiscue	\N	12	1.4	89	3	Ледяная маска	17	Самцы: 50% Самки: 50% 	629	7	98.3	75	80	110	50	65	90	470
1106	Индиди	https://www.orthrusonline.ru/static/images/p/nextgen/indeedee.png	indeedee	\N	106	0.9	28	4	Концентрация   Синхронизация   Психическая волна	27	Только самцы	1210	15	98	60	65	55	95	105	95	475
1107	Морпеко	https://www.orthrusonline.ru/static/images/p/nextgen/morpeko.png	morpeko	\N	107	0.3	3	2	Голодный режим	7	Самцы: 50% Самки: 50% 	1052	2	98.6	58	95	58	97	70	58	436
1108	Кафант	https://www.orthrusonline.ru/static/images/p/nextgen/cufant.png	cufant	\N	16	1.2	100	2	Грубая сила   Увеличение веса	17	Самцы: 50% Самки: 50% 	1203	1	97.5	72	80	49	40	40	49	330
1109	Коппераджа	https://www.orthrusonline.ru/static/images/p/nextgen/copperajah.png	copperajah	\N	16	3	650	2	Грубая сила   Увеличение веса	17	Самцы: 50% Самки: 50% 	67	1	99.5	122	130	69	30	80	69	500
1110	Дракозолт	https://www.orthrusonline.ru/static/images/p/nextgen/dracozolt.png	dracozolt	\N	41	1.8	190	3	Поглощение электричества   Энергичность   Песчаная гонка	24	Бесполые	310	5	98.8	90	100	90	75	80	70	505
1111	Арктозолт	https://www.orthrusonline.ru/static/images/p/nextgen/arctozolt.png	arctozolt	\N	70	2.3	150	3	Поглощение электричества   Статическое электричество   Грязевой натиск	24	Бесполые	300	2	98.8	90	100	90	55	90	80	505
1112	Драковиш	https://www.orthrusonline.ru/static/images/p/nextgen/dracovish.png	dracovish	\N	74	2.3	215	3	Поглощение воды   Крепкая челюсть   Песчаная гонка	24	Бесполые	322	26	98.6	90	90	100	75	70	80	505
1113	Арктовиш	https://www.orthrusonline.ru/static/images/p/nextgen/arctovish.png	arctovish	\N	35	2	175	3	Поглощение воды   Ледяное тело   Грязевой натиск	24	Бесполые	298	5	98.9	90	90	100	55	80	90	505
1114	Дюралюдон	https://www.orthrusonline.ru/static/images/p/nextgen/duraludon.png	duraludon	\N	73	1.8	40	2	Снижение веса   Увеличение веса   Непоколебимость	20	Самцы: 50% Самки: 50% 	1349	13	97.8	70	95	115	85	120	50	535
1115	Дрипи	https://www.orthrusonline.ru/static/images/p/nextgen/dreepy.png	dreepy	\N	201	0.5	2	3	Чистое тело   Проскальзывание   Проклятое тело	27	Самцы: 50% Самки: 50% 	87	21	99.4	28	60	30	82	40	30	270
1116	Драклоак	https://www.orthrusonline.ru/static/images/p/nextgen/drakloak.png	drakloak	\N	201	1.4	11	3	Чистое тело   Проскальзывание   Проклятое тело	27	Самцы: 50% Самки: 50% 	10	4	99.9	68	80	50	102	60	50	410
1117	Драгапульт	https://www.orthrusonline.ru/static/images/p/nextgen/dragapult.png	dragapult	\N	201	3	50	3	Чистое тело   Проскальзывание   Проклятое тело	27	Самцы: 50% Самки: 50% 	87	47	99.3	88	120	75	142	100	75	600
1118	Зэйшиан	https://www.orthrusonline.ru/static/images/p/nextgen/zacian.png	zacian	\N	105	2.8	110	3	Бесстрашный меч	80	Бесполые	1	1	100	92	130	115	138	80	115	670
1119	Замазента	https://www.orthrusonline.ru/static/images/p/nextgen/zamazenta.png	zamazenta	\N	20	2.9	210	3	Щит бесстрашия	80	Бесполые	0	0	100	92	130	115	138	80	115	670
1120	Этернатус	https://www.orthrusonline.ru/static/images/p/nextgen/eternatus.png	eternatus	\N	109	20	950	3	Давление	80	Бесполые	15	6	99.9	140	85	95	130	145	95	690
1121	Кабфу	https://www.orthrusonline.ru/static/images/p/nextgen/kubfu.png	kubfu	\N	20	0.6	12	3	Концентрация	80	Самцы: 87.5% Самки: 12.5% 	71	24	99.5	60	90	60	72	53	50	385
1122	Уршифу	https://www.orthrusonline.ru/static/images/p/nextgen/urshifu.png	urshifu	\N	110	1.9	105	3	Невидимый кулак	80	Самцы: 87.5% Самки: 12.5% 	28	16	99.8	100	130	100	97	63	60	550
1123	Заруда	https://www.orthrusonline.ru/static/images/p/nextgen/zarude.png	zarude	\N	111	1.8	70	3	Травяной щит	80	Бесполые	41	6	99.7	105	120	105	105	70	95	600
1124	Реджилеки	https://www.orthrusonline.ru/static/images/p/nextgen/regieleki.png	regieleki	\N	9	1.2	145	3	Транзистор	80	Бесполые	144	23	99.1	80	100	50	200	100	50	580
1125	Реджидраго	https://www.orthrusonline.ru/static/images/p/nextgen/regidrago.png	regidrago	\N	132	2.1	200	3	Драконья пасть	80	Бесполые	87	9	99.5	200	100	50	80	100	50	580
1126	Гластриер	https://www.orthrusonline.ru/static/images/p/nextgen/glastrier.png	glastrier	\N	12	2.2	800	3	Леденящее ржание	80	Бесполые	39	7	99.7	100	145	130	30	65	110	580
1127	Спектрайр	https://www.orthrusonline.ru/static/images/p/nextgen/spectrier.png	spectrier	\N	48	2	44.5	3	Мрачное ржание	80	Бесполые	31	3	99.7	100	65	60	130	145	80	580
1128	Калирекс	https://www.orthrusonline.ru/static/images/p/nextgen/calyrex.png	calyrex	\N	140	1.1	7.7	3	Нервирование	80	Бесполые	58	1	99.5	100	80	80	80	80	80	500
1129	Вирдир	https://www.orthrusonline.ru/static/images/p/nextgen/wyrdeer.png	wyrdeer	\N	135	1.8	95.1	3	Запугивание   Обыскивание   Поглотитель соков	14	Самцы: 50% Самки: 50% 	27	1	99.8	103	105	72	65	105	75	525
1130	Кливор	https://www.orthrusonline.ru/static/images/p/nextgen/kleavor.png	kleavor	\N	136	1.8	89	2	Роение   Грубая сила   Сметливость	17	Самцы: 50% Самки: 50% 	83	9	99.4	70	135	95	85	45	70	500
1131	Урсалуна	https://www.orthrusonline.ru/static/images/p/nextgen/ursaluna.png	ursaluna	\N	114	2.4	290	2	Сила воли   Пуленепробиваемость   Нервирование	14	Самцы: 50% Самки: 50% 	59	9	99.6	130	140	105	50	45	80	550
1132	Баскулиджен	https://www.orthrusonline.ru/static/images/p/nextgen/basculegion.png	basculegion	\N	115	3	110	2	Быстрое плаванье   Адаптация   Разрыв шаблона	27	Самцы: 50% Самки: 50% 	34	6	99.8	120	112	65	78	80	75	530
1133	Снизлер	https://www.orthrusonline.ru/static/images/p/nextgen/sneasler.png	sneasler	\N	47	1.3	43	1	Давление   Освобождение   Ядовитое касание	14	Самцы: 50% Самки: 50% 	31	5	99.8	80	130	60	120	40	80	510
1134	Оверквил	https://www.orthrusonline.ru/static/images/p/nextgen/overqwil.png	overqwil	\N	44	0.5	3.9	2	Ядовитые колючки   Быстрое плаванье   Запугивание	14	Самцы: 50% Самки: 50% 	13	5	99.9	85	115	95	85	65	65	510
1135	Энаморус	https://www.orthrusonline.ru/static/images/p/nextgen/enamorus.png	enamorus	\N	116	1.6	48	3	Исцеление   Порочность	80	Только самки	88	5	99.6	74	115	70	106	135	80	580
1136	Спригатито	https://www.orthrusonline.ru/static/images/p/nextgen/sprigatito.png	sprigatito	\N	64	0.4	4.1	1	Сверхрост   Изменчивость	14	Самцы: 87.5% Самки: 12.5% 	553	242	99.1	40	61	54	65	45	45	310
1137	Флорагато	https://www.orthrusonline.ru/static/images/p/nextgen/floragato.png	floragato	\N	64	0.9	12.2	1	Сверхрост   Изменчивость	14	Самцы: 87.5% Самки: 12.5% 	19	8	99.9	61	80	63	83	60	63	410
1138	Мяускарада	https://www.orthrusonline.ru/static/images/p/nextgen/meowscarada.png	meowscarada	\N	142	1.5	31.2	1	Сверхрост   Изменчивость	14	Самцы: 87.5% Самки: 12.5% 	83	34	99.4	76	110	70	123	81	70	530
1139	Фуекоко	https://www.orthrusonline.ru/static/images/p/nextgen/fuecoco.png	fuecoco	\N	58	0.4	9.8	1	Яростное пламя   Безразличие	14	Самцы: 87.5% Самки: 12.5% 	1010	574	98.7	67	45	59	36	63	40	310
1140	Крокалор	https://www.orthrusonline.ru/static/images/p/nextgen/crocalor.png	crocalor	\N	58	1	30.7	1	Яростное пламя   Безразличие	14	Самцы: 87.5% Самки: 12.5% 	22	12	99.8	81	55	78	49	90	58	411
1141	Скеледирдж	https://www.orthrusonline.ru/static/images/p/nextgen/skeledirge.png	skeledirge	\N	29	1.6	326.5	1	Яростное пламя   Безразличие	14	Самцы: 87.5% Самки: 12.5% 	181	106	98.9	104	75	100	66	110	75	530
1142	Кваксли	https://www.orthrusonline.ru/static/images/p/nextgen/quaxly.png	quaxly	\N	4	0.5	6.1	1	Всплеск   Ловкость	14	Самцы: 87.5% Самки: 12.5% 	529	275	99.1	55	65	45	50	50	45	310
1143	Кваксвелл	https://www.orthrusonline.ru/static/images/p/nextgen/quaxwell.png	quaxwell	\N	4	1.2	21.5	1	Всплеск   Ловкость	14	Самцы: 87.5% Самки: 12.5% 	15	4	99.9	70	85	65	65	65	60	410
1144	Квакуаваль	https://www.orthrusonline.ru/static/images/p/nextgen/quaquaval.png	quaquaval	\N	86	1.8	61.9	1	Всплеск   Ловкость	14	Самцы: 87.5% Самки: 12.5% 	75	33	99.5	85	120	80	85	85	75	530
1145	Лечонк	https://www.orthrusonline.ru/static/images/p/nextgen/lechonk.png	lechonk	\N	17	0.5	10.2	2	Ароматный покров   Прожорливость   Толстая кожа	10	Самцы: 50% Самки: 50% 	1741	17	98.6	54	45	40	35	35	45	254
1146	Ойнкологн	https://www.orthrusonline.ru/static/images/p/nextgen/oinkologne.png	oinkologne	\N	17	1	120	2	Стойкий аромат   Прожорливость   Толстая кожа	10	Только самцы	27	2	99.8	110	100	75	65	59	80	489
1147	Тараунтула	https://www.orthrusonline.ru/static/images/p/nextgen/tarountula.png	tarountula	\N	120	0.3	4	5	Бессонница   Надзор	10	Самцы: 50% Самки: 50% 	226	0	99.6	35	41	45	20	29	40	210
1148	Спидопс	https://www.orthrusonline.ru/static/images/p/nextgen/spidops.png	spidops	\N	120	1	16.5	5	Бессонница   Надзор	10	Самцы: 50% Самки: 50% 	10	0	99.9	60	79	92	35	52	86	404
1149	Нимбл	https://www.orthrusonline.ru/static/images/p/nextgen/nymble.png	nymble	\N	120	0.2	1	2	Роение   Тонированные линзы	14	Самцы: 50% Самки: 50% 	583	2	99.4	33	46	40	45	21	25	210
1150	Локикс	https://www.orthrusonline.ru/static/images/p/nextgen/lokix.png	lokix	\N	202	1	17.5	2	Роение   Тонированные линзы	14	Самцы: 50% Самки: 50% 	36	9	99.8	71	102	78	92	52	55	450
1151	Павми	https://www.orthrusonline.ru/static/images/p/nextgen/pawmi.png	pawmi	\N	9	0.3	2.5	2	Статическое электричество   Естественное исцеление   Железный кулак	10	Самцы: 50% Самки: 50% 	45	0	99.8	45	50	20	60	40	25	240
1152	Павмо	https://www.orthrusonline.ru/static/images/p/nextgen/pawmo.png	pawmo	\N	203	0.4	6.5	2	Поглощение электричества   Естественное исцеление   Железный кулак	10	Самцы: 50% Самки: 50% 	3	0	100	60	75	40	85	50	40	350
1153	Павмот	https://www.orthrusonline.ru/static/images/p/nextgen/pawmot.png	pawmot	\N	203	0.9	41	2	Поглощение электричества   Естественное исцеление   Железный кулак	10	Самцы: 50% Самки: 50% 	15	3	99.9	70	115	70	105	70	60	490
1232	Чьен-Пао	https://www.orthrusonline.ru/static/images/p/nextgen/chienpao.png	chienpao	\N	137	1.9	152.2	3	Меч Разрушения	54	Бесполые	78	4	99.6	80	120	80	135	90	65	570
1154	Тандемаус	https://www.orthrusonline.ru/static/images/p/nextgen/tandemaus.png	tandemaus	\N	17	0.3	1.8	4	Бегство   Сбор предметов   Собственный темп	7	Бесполые	110	0	99.7	50	50	45	75	40	45	305
1155	Маусхолд	https://www.orthrusonline.ru/static/images/p/nextgen/maushold.png	maushold	\N	17	0.3	2.3	4	Защита товарища   Защёчный мешок   Техничность	7	Бесполые	35	2	99.7	74	75	70	111	65	75	470
1156	Файдо	https://www.orthrusonline.ru/static/images/p/nextgen/fidough.png	fidough	\N	105	0.3	10.9	1	Собственный темп   Неуклюжесть	14	Самцы: 50% Самки: 50% 	901	602	98.8	37	55	70	65	30	55	312
1157	Дашбан	https://www.orthrusonline.ru/static/images/p/nextgen/dachsbun.png	dachsbun	\N	105	0.5	14.9	1	Пропеченное тело	14	Самцы: 50% Самки: 50% 	49	41	99.6	57	80	115	95	50	80	477
1158	Смолив	https://www.orthrusonline.ru/static/images/p/nextgen/smoliv.png	smoliv	\N	204	0.3	6.5	1	Раннее пробуждение   Восстановление урожая	14	Самцы: 50% Самки: 50% 	5533	655	95.4	41	35	45	30	58	51	260
1159	Доллив	https://www.orthrusonline.ru/static/images/p/nextgen/dolliv.png	dolliv	\N	204	0.6	11.9	1	Раннее пробуждение   Восстановление урожая	14	Самцы: 50% Самки: 50% 	24	12	99.8	52	53	60	33	78	78	354
1160	Арболива	https://www.orthrusonline.ru/static/images/p/nextgen/arboliva.png	arboliva	\N	204	1.4	48.2	1	Сеятель семян   Восстановление урожая	14	Самцы: 50% Самки: 50% 	68	21	99.5	78	69	90	39	125	109	510
1161	Сквокабилли	https://www.orthrusonline.ru/static/images/p/nextgen/squawkabilly.png	squawkabilly	\N	7	0.6	2.4	5	Запугивание   Энергичность   Сила воли	10	Самцы: 50% Самки: 50% 	1	1	100	82	96	51	92	45	51	417
1162	Накли	https://www.orthrusonline.ru/static/images/p/nextgen/nacli.png	nacli	\N	93	0.4	16	1	Очищающая соль   Стойкость   Чистое тело	14	Самцы: 50% Самки: 50% 	500	174	99.2	55	55	75	25	35	35	280
1163	Наклстак	https://www.orthrusonline.ru/static/images/p/nextgen/naclstack.png	naclstack	\N	93	0.5	105	1	Очищающая соль   Стойкость   Чистое тело	14	Самцы: 50% Самки: 50% 	12	8	99.9	60	60	100	35	35	65	355
1164	Гарганакл	https://www.orthrusonline.ru/static/images/p/nextgen/garganacl.png	garganacl	\N	93	2.5	240	1	Очищающая соль   Стойкость   Чистое тело	14	Самцы: 50% Самки: 50% 	137	80	99.1	100	100	130	35	45	90	500
1165	Чаркадет	https://www.orthrusonline.ru/static/images/p/nextgen/charcadet.png	charcadet	\N	58	0.6	10.5	3	Вспышка пламени   Огненное тело	24	Самцы: 50% Самки: 50% 	39	8	99.8	40	50	40	30	50	40	250
1166	Армаруж	https://www.orthrusonline.ru/static/images/p/nextgen/armarouge.png	armarouge	\N	80	1.5	85	3	Вспышка пламени   Слабая броня	24	Самцы: 50% Самки: 50% 	13	0	99.9	85	60	100	75	125	80	525
1167	Серуледж	https://www.orthrusonline.ru/static/images/p/nextgen/ceruledge.png	ceruledge	\N	29	1.6	62	3	Вспышка пламени   Слабая броня	24	Самцы: 50% Самки: 50% 	56	6	99.6	75	125	80	85	60	100	525
1168	Тадбулб	https://www.orthrusonline.ru/static/images/p/nextgen/tadbulb.png	tadbulb	\N	9	0.3	0.4	2	Собственный темп   Статическое электричество   Влажность	14	Самцы: 50% Самки: 50% 	1	1	100	61	31	41	45	59	35	272
1169	Беллиболт	https://www.orthrusonline.ru/static/images/p/nextgen/bellibolt.png	bellibolt	\N	9	1.2	113	2	Электроморфоз   Статическое электричество   Влажность	14	Самцы: 50% Самки: 50% 	2	1	100	109	64	91	45	103	83	495
1170	Ваттрел	https://www.orthrusonline.ru/static/images/p/nextgen/wattrel.png	wattrel	\N	69	0.4	3.6	1	Сила ветра   Поглощение электричества   Состязательность	14	Самцы: 50% Самки: 50% 	1	1	100	40	40	35	70	55	40	280
1171	Киловаттрел	https://www.orthrusonline.ru/static/images/p/nextgen/kilowattrel.png	kilowattrel	\N	69	1.4	38.6	1	Сила ветра   Поглощение электричества   Состязательность	14	Самцы: 50% Самки: 50% 	1	1	100	70	70	60	125	105	60	490
1172	Масчифф	https://www.orthrusonline.ru/static/images/p/nextgen/maschiff.png	maschiff	\N	15	0.5	16	1	Запугивание   Бегство   Надзор	14	Самцы: 50% Самки: 50% 	414	261	99.3	60	78	60	51	40	51	340
1173	Мабостифф	https://www.orthrusonline.ru/static/images/p/nextgen/mabosstiff.png	mabosstiff	\N	15	1.1	61	1	Запугивание   Сторожевая собака   Надзор	14	Самцы: 50% Самки: 50% 	17	12	99.9	80	120	90	85	60	70	505
1174	Шрудл	https://www.orthrusonline.ru/static/images/p/nextgen/shroodle.png	shroodle	\N	205	0.2	0.7	1	Освобождение   Карманный вор   Проказник	14	Самцы: 50% Самки: 50% 	365	231	99.2	40	65	35	75	40	35	290
1175	Графайай	https://www.orthrusonline.ru/static/images/p/nextgen/grafaiai.png	grafaiai	\N	205	0.7	27.2	1	Освобождение   Ядовитое касание   Проказник	14	Самцы: 50% Самки: 50% 	50	29	99.6	63	95	65	110	80	72	485
1176	Брамблин	https://www.orthrusonline.ru/static/images/p/nextgen/bramblin.png	bramblin	\N	188	0.6	0.6	2	Ветрокрыл   Проскальзывание	14	Самцы: 50% Самки: 50% 	110	2	99.4	40	65	30	60	45	35	275
1177	Брамблгаст	https://www.orthrusonline.ru/static/images/p/nextgen/brambleghast.png	brambleghast	\N	188	1.2	6	2	Ветрокрыл   Проскальзывание	14	Самцы: 50% Самки: 50% 	17	2	99.9	55	115	70	90	80	70	480
1178	Тоедскул	https://www.orthrusonline.ru/static/images/p/nextgen/toedscool.png	toedscool	\N	206	0.9	33	1	Мицелий Могучий	14	Самцы: 50% Самки: 50% 	78	0	99.6	40	40	35	70	50	100	335
1179	Тоедскруэль	https://www.orthrusonline.ru/static/images/p/nextgen/toedscruel.png	toedscruel	\N	206	1.9	58	1	Мицелий Могучий	14	Самцы: 50% Самки: 50% 	16	1	99.9	80	70	65	100	80	120	515
1180	Клауф	https://www.orthrusonline.ru/static/images/p/nextgen/klawf.png	klawf	\N	93	1.3	79	2	Раковина гнева   Панцирь-броня   Регенерация	24	Самцы: 50% Самки: 50% 	20	14	99.9	70	100	115	75	35	55	450
1181	Капсакид	https://www.orthrusonline.ru/static/images/p/nextgen/capsakid.png	capsakid	\N	64	0.3	3	2	Хлорофилл   Бессонница   Неуклюжесть	14	Самцы: 50% Самки: 50% 	26	1	99.8	52	62	40	50	62	40	306
1182	Сковиллейн	https://www.orthrusonline.ru/static/images/p/nextgen/scovillain.png	scovillain	\N	118	0.9	15	2	Хлорофилл   Бессонница   Переменчивое настроение	14	Самцы: 50% Самки: 50% 	22	3	99.8	65	108	65	75	108	65	486
1183	Реллор	https://www.orthrusonline.ru/static/images/p/nextgen/rellor.png	rellor	\N	120	0.2	1	4	Фасеточность   Сбрасывание кожи	14	Самцы: 50% Самки: 50% 	12	1	99.9	41	50	60	30	31	58	270
1184	Рабска	https://www.orthrusonline.ru/static/images/p/nextgen/rabsca.png	rabsca	\N	97	0.3	3.5	4	Синхронизация   Телепатия	14	Самцы: 50% Самки: 50% 	10	2	99.9	75	50	85	45	115	100	470
1185	Флиттл	https://www.orthrusonline.ru/static/images/p/nextgen/flittle.png	flittle	\N	19	0.2	1.5	1	Предвидение   Обыскивание   Ускорение	14	Самцы: 50% Самки: 50% 	30	2	99.8	30	35	30	75	55	40	265
1186	Эспатра	https://www.orthrusonline.ru/static/images/p/nextgen/espathra.png	espathra	\N	19	1.9	90	1	Оппортунист   Обыскивание   Ускорение	14	Самцы: 50% Самки: 50% 	14	4	99.9	95	60	60	105	101	60	481
1187	Тинкатинк	https://www.orthrusonline.ru/static/images/p/nextgen/tinkatink.png	tinkatink	\N	108	0.4	8.9	1	Разрыв шаблона   Собственный темп   Карманный вор	14	Только самки	1174	1	98.6	50	45	45	58	35	64	297
1188	Тинкатаф	https://www.orthrusonline.ru/static/images/p/nextgen/tinkatuff.png	tinkatuff	\N	108	0.7	59.1	1	Разрыв шаблона   Собственный темп   Карманный вор	14	Только самки	10	0	99.9	65	55	55	78	45	82	380
1189	Тинкатон	https://www.orthrusonline.ru/static/images/p/nextgen/tinkaton.png	tinkaton	\N	108	0.7	112.8	1	Разрыв шаблона   Собственный темп   Карманный вор	14	Только самки	112	3	99.1	85	75	77	94	70	105	506
1190	Виглетт	https://www.orthrusonline.ru/static/images/p/nextgen/wiglett.png	wiglett	\N	4	1.2	1.8	2	Липкость   Нервозность   Песчаный покров	14	Самцы: 50% Самки: 50% 	3	1	100	10	55	25	95	35	25	245
1191	Вагтрио	https://www.orthrusonline.ru/static/images/p/nextgen/wugtrio.png	wugtrio	\N	4	1.2	5.4	2	Липкость   Нервозность   Песчаный покров	14	Самцы: 50% Самки: 50% 	1	0	100	35	100	50	120	50	70	425
1192	Бомбёрдир	https://www.orthrusonline.ru/static/images/p/nextgen/bombirdier.png	bombirdier	\N	207	1.5	42.9	3	Большие клевки   Острый глаз   Скалистый груз	21	Самцы: 50% Самки: 50% 	406	270	99.2	70	103	85	82	60	85	485
1193	Финизен	https://www.orthrusonline.ru/static/images/p/nextgen/finizen.png	finizen	\N	4	1.3	60.2	3	Водяные покровы	27	Самцы: 50% Самки: 50% 	669	1	98.5	70	45	40	75	45	40	315
1194	Палафин	https://www.orthrusonline.ru/static/images/p/nextgen/palafin.png	palafin	\N	4	1.3	60.2	3	Путь героя	27	Самцы: 50% Самки: 50% 	53	3	99.6	100	70	72	100	53	62	457
1195	Варум	https://www.orthrusonline.ru/static/images/p/nextgen/varoom.png	varoom	\N	208	1	35	2	Пыленепроницаемость   Медленный старт	14	Самцы: 50% Самки: 50% 	344	226	99.3	45	70	63	47	30	45	300
1196	Реваврум	https://www.orthrusonline.ru/static/images/p/nextgen/revavroom.png	revavroom	\N	208	1.8	120	2	Пыленепроницаемость   Фильтрация	14	Самцы: 50% Самки: 50% 	29	26	99.8	80	119	90	90	54	67	500
1197	Циклизард	https://www.orthrusonline.ru/static/images/p/nextgen/cyclizar.png	cyclizar	\N	209	1.6	63	1	Сбрасывание кожи   Регенерация	21	Самцы: 50% Самки: 50% 	1029	648	98.4	70	95	65	121	85	65	501
1198	Ортформ	https://www.orthrusonline.ru/static/images/p/nextgen/orthworm.png	orthworm	\N	16	2.5	310	3	Землеед   Песчаный покров	24	Самцы: 50% Самки: 50% 	37	23	99.7	70	85	145	65	60	55	480
1199	Глиммет	https://www.orthrusonline.ru/static/images/p/nextgen/glimmet.png	glimmet	\N	198	0.7	8	1	Ядовитые обломки   Окисление	21	Самцы: 50% Самки: 50% 	370	249	99.3	48	35	42	60	105	60	350
1200	Глиммора	https://www.orthrusonline.ru/static/images/p/nextgen/glimmora.png	glimmora	\N	198	1.5	45	1	Ядовитые обломки   Окисление	21	Самцы: 50% Самки: 50% 	25	22	99.8	83	55	90	86	130	81	525
1201	Гривард	https://www.orthrusonline.ru/static/images/p/nextgen/greavard.png	greavard	\N	48	0.6	35	1	Сбор предметов   Пушистик	14	Самцы: 50% Самки: 50% 	1142	4	98.4	50	61	60	34	30	55	290
1202	Хаундстоун	https://www.orthrusonline.ru/static/images/p/nextgen/houndstone.png	houndstone	\N	48	2	15	1	Песчаная гонка   Пушистик	14	Самцы: 50% Самки: 50% 	83	1	99.3	72	101	100	68	50	97	488
1203	Фламиго	https://www.orthrusonline.ru/static/images/p/nextgen/flamigo.png	flamigo	\N	210	1.6	379	1	Дерзость   Косолапость   Главная роль	14	Самцы: 50% Самки: 50% 	96	1	99.5	82	115	74	90	75	64	500
1204	Сетодл	https://www.orthrusonline.ru/static/images/p/nextgen/cetoddle.png	cetoddle	\N	12	1.2	45	1	Толстая кожа   Снежные покровы   Грубая сила	17	Самцы: 50% Самки: 50% 	16	0	99.9	108	68	45	43	30	40	334
1205	Сетитан	https://www.orthrusonline.ru/static/images/p/nextgen/cetitan.png	cetitan	\N	12	4.5	700	1	Толстая кожа   Грязевой натиск   Грубая сила	17	Самцы: 50% Самки: 50% 	18	2	99.9	170	113	65	73	45	55	521
1206	Велуза	https://www.orthrusonline.ru/static/images/p/nextgen/veluza.png	veluza	\N	24	2.5	90	4	Разрыв шаблона   Сметливость	14	Самцы: 50% Самки: 50% 	793	3	98.8	90	102	73	70	78	65	478
1207	Дондозо	https://www.orthrusonline.ru/static/images/p/nextgen/dondozo.png	dondozo	\N	4	12	220	3	Безразличие   Забвение   Водяные покровы	27	Самцы: 50% Самки: 50% 	1587	4	97.9	150	100	115	35	65	65	530
1208	Татсугири	https://www.orthrusonline.ru/static/images/p/nextgen/tatsugiri.png	tatsugiri	\N	211	0.3	8	1	Командир   Водоотвод	24	Самцы: 50% Самки: 50% 	137	10	99.5	68	50	60	82	120	95	475
1209	Аннихилап	https://www.orthrusonline.ru/static/images/p/nextgen/annihilape.png	annihilape	\N	199	1.2	56	2	Подъём духа   Концентрация   Непокорность	14	Самцы: 50% Самки: 50% 	244	45	98.4	110	115	80	90	50	90	535
1210	Клодсайр	https://www.orthrusonline.ru/static/images/p/nextgen/clodsire.png	clodsire	\N	42	1.8	223	2	Ядовитые колючки   Поглощение воды   Безразличие	14	Самцы: 50% Самки: 50% 	249	205	99	130	75	60	20	45	100	430
1211	Фарижираф	https://www.orthrusonline.ru/static/images/p/nextgen/farigiraf.png	farigiraf	\N	135	3.2	160	2	Жеватель   Бронированный хвост   Поглотитель соков	14	Самцы: 50% Самки: 50% 	54	5	99.6	120	90	70	60	110	70	520
1212	Даданспарс	https://www.orthrusonline.ru/static/images/p/nextgen/dudunsparce.png	dudunsparce	\N	17	3.6	39.2	2	Небесное благословение   Бегство   Нервозность	14	Самцы: 50% Самки: 50% 	17	3	99.9	125	100	80	55	85	75	520
1213	Кингамбит	https://www.orthrusonline.ru/static/images/p/nextgen/kingambit.png	kingambit	\N	171	2	120	2	Непокорность   Верховный Повелитель   Давление	14	Самцы: 50% Самки: 50% 	95	14	99.3	100	135	120	50	60	85	550
1214	Великий Бивень	https://www.orthrusonline.ru/static/images/p/nextgen/greattusk.png	greattusk	\N	212	2.2	320	3	Протосинтез	35	Бесполые	44	4	99.7	115	131	131	87	53	53	570
1215	Кричащий Хвост	https://www.orthrusonline.ru/static/images/p/nextgen/screamtail.png	screamtail	\N	213	1.2	8	3	Протосинтез	35	Бесполые	7	1	99.9	115	65	99	111	65	115	570
1216	Жестокая Шляпа	https://www.orthrusonline.ru/static/images/p/nextgen/brutebonnet.png	brutebonnet	\N	142	1.2	21	3	Протосинтез	35	Бесполые	11	3	99.9	111	127	99	55	79	99	570
1217	Порхающая Грива	https://www.orthrusonline.ru/static/images/p/nextgen/fluttermane.png	fluttermane	\N	94	1.4	4	3	Протосинтез	35	Бесполые	10	5	99.9	55	55	55	135	135	135	570
1218	Скользкое Крыло	https://www.orthrusonline.ru/static/images/p/nextgen/slitherwing.png	slitherwing	\N	46	3.2	92	3	Протосинтез	35	Бесполые	7	2	99.9	85	135	79	81	85	105	570
1219	Песчаный Шок	https://www.orthrusonline.ru/static/images/p/nextgen/sandyshocks.png	sandyshocks	\N	214	2.3	60	3	Протосинтез	35	Бесполые	44	3	99.7	85	81	97	101	121	85	570
1220	Железные Гусеницы	https://www.orthrusonline.ru/static/images/p/nextgen/irontreads.png	irontreads	\N	14	0.9	240	3	Кварк-двигатель	35	Бесполые	23	2	99.8	90	112	120	106	72	70	570
1221	Железная Сумка	https://www.orthrusonline.ru/static/images/p/nextgen/ironbundle.png	ironbundle	\N	151	0.6	11	3	Кварк-двигатель	35	Бесполые	26	3	99.8	56	80	114	136	124	60	570
1222	Железные Руки	https://www.orthrusonline.ru/static/images/p/nextgen/ironhands.png	ironhands	\N	215	1.8	380.7	3	Кварк-двигатель	54	Бесполые	8	1	99.9	154	140	108	50	50	68	570
1223	Железная Шея	https://www.orthrusonline.ru/static/images/p/nextgen/ironjugulis.png	ironjugulis	\N	39	1.3	111	3	Кварк-двигатель	54	Бесполые	35	1	99.8	94	80	86	108	122	80	570
1224	Железная Моль	https://www.orthrusonline.ru/static/images/p/nextgen/ironmoth.png	ironmoth	\N	216	1.2	36	3	Кварк-двигатель	35	Бесполые	21	2	99.8	80	70	60	110	140	110	570
1225	Железные Шипы	https://www.orthrusonline.ru/static/images/p/nextgen/ironthorns.png	ironthorns	\N	21	1.6	303	3	Кварк-двигатель	54	Бесполые	20	3	99.8	100	134	110	72	70	84	570
1226	Фриджибакс	https://www.orthrusonline.ru/static/images/p/nextgen/frigibax.png	frigibax	\N	85	0.5	17	3	Термический обмен   Ледяное тело	27	Самцы: 50% Самки: 50% 	12	0	99.9	65	75	45	55	35	45	320
1227	Арктибакс	https://www.orthrusonline.ru/static/images/p/nextgen/arctibax.png	arctibax	\N	85	0.8	30	3	Термический обмен   Ледяное тело	27	Самцы: 50% Самки: 50% 	2	0	100	90	95	66	62	45	65	423
1228	Баксалибур	https://www.orthrusonline.ru/static/images/p/nextgen/baxcalibur.png	baxcalibur	\N	85	2.1	210	3	Термический обмен   Ледяное тело	27	Самцы: 50% Самки: 50% 	25	5	99.8	115	145	92	87	75	86	600
1229	Гиммигул	https://www.orthrusonline.ru/static/images/p/nextgen/gimmighoul.png	gimmighoul	\N	48	0.3	5	3	Нервозность	27	Бесполые	38	28	99.7	45	30	70	10	75	70	300
1230	Голденго	https://www.orthrusonline.ru/static/images/p/nextgen/gholdengo.png	gholdengo	\N	217	1.2	30	3	Хорошего понемногу	27	Бесполые	76	36	99.5	87	60	95	84	133	91	550
1231	Во-Чьен	https://www.orthrusonline.ru/static/images/p/nextgen/wochien.png	wochien	\N	111	1.5	74.2	3	Таблетки Разрушения	54	Бесполые	84	0	99.6	85	85	100	70	95	135	570
1233	Тинг-Лу	https://www.orthrusonline.ru/static/images/p/nextgen/tinglu.png	tinglu	\N	218	2.7	699.7	3	Сосуд Разрушения	54	Бесполые	94	2	99.5	155	110	125	45	55	80	570
1234	Чи-Ю	https://www.orthrusonline.ru/static/images/p/nextgen/chiyu.png	chiyu	\N	49	0.4	4.9	3	Бусины Разрушения	54	Бесполые	79	4	99.6	55	80	80	100	135	120	570
1235	Рычащая Луна	https://www.orthrusonline.ru/static/images/p/nextgen/roaringmoon.png	roaringmoon	\N	219	2	380	3	Протосинтез	54	Бесполые	41	3	99.7	105	139	71	119	55	101	590
1236	Железная Доблесть	https://www.orthrusonline.ru/static/images/p/nextgen/ironvaliant.png	ironvaliant	\N	220	1.4	35	3	Кварк-двигатель	54	Бесполые	27	1	99.8	74	130	90	116	120	60	590
1237	Корайдон	https://www.orthrusonline.ru/static/images/p/nextgen/koraidon.png	koraidon	\N	221	2.5	303	3	Орихалковый пульс	80	Бесполые	1	1	100	100	135	115	135	85	100	670
1238	Мирайдон	https://www.orthrusonline.ru/static/images/p/nextgen/miraidon.png	miraidon	\N	41	3.5	240	3	Адронный двигатель	80	Бесполые	1	1	100	100	85	100	135	135	115	670
1239	Блуждающая Волна	https://www.orthrusonline.ru/static/images/p/nextgen/walkingwake.png	walkingwake	\N	74	3.5	280	3	Протосинтез	80	Бесполые	45	1	99.8	99	83	91	109	125	83	590
1240	Железные Листья	https://www.orthrusonline.ru/static/images/p/nextgen/ironleaves.png	ironleaves	\N	127	1.5	125	3	Кварк-двигатель	80	Бесполые	28	1	99.9	90	130	88	104	70	108	590
1241	Диплин	https://www.orthrusonline.ru/static/images/p/nextgen/dipplin.png	dipplin	\N	28	0.4	4.4	5	Суперсладкий сироп   Прожорливость   Липкий захват	14	Самцы: 50% Самки: 50% 	12	2	99.9	80	80	110	40	95	80	485
1242	Полчагейст	https://www.orthrusonline.ru/static/images/p/nextgen/poltchageist.png	poltchageist	\N	188	0.1	1.1	2	Гостеприимство   Жаропрочность	14	Бесполые	2917	62	98.6	40	45	45	50	74	54	308
1243	Синистча	https://www.orthrusonline.ru/static/images/p/nextgen/sinistcha.png	sinistcha	\N	188	0.2	2.2	2	Гостеприимство   Жаропрочность	14	Бесполые	59	58	99.5	71	60	106	70	121	80	508
1244	Окидоги	https://www.orthrusonline.ru/static/images/p/nextgen/okidogi.png	okidogi	\N	158	1.8	92	3	Токсичная цепь   Сторожевая собака	80	Только самцы	1	1	100	88	128	115	80	58	86	555
1245	Мункидори	https://www.orthrusonline.ru/static/images/p/nextgen/munkidori.png	munkidori	\N	23	1	12.2	3	Токсичная цепь   Обыскивание	80	Только самцы	2	0	100	88	75	66	106	130	90	555
1246	Фезандипити	https://www.orthrusonline.ru/static/images/p/nextgen/fezandipiti.png	fezandipiti	\N	30	1.4	30.1	3	Токсичная цепь   Техничность	80	Только самцы	6	0	100	88	91	82	99	70	125	555
1247	Огерпон	https://www.orthrusonline.ru/static/images/p/nextgen/ogerpon.png	ogerpon	\N	64	1.2	39.8	3	Непокорность   Воплощение аспекта	80	Только самки	81	79	99.3	80	120	84	110	60	96	550
1248	Архалюдон	https://www.orthrusonline.ru/static/images/p/nextgen/archaludon.png	archaludon	\N	73	2	60	2	Выносливость   Стойкость   Непоколебимость	20	Самцы: 50% Самки: 50% 	67	10	99.5	90	105	130	85	125	65	600
1249	Гидраппл	https://www.orthrusonline.ru/static/images/p/nextgen/hydrapple.png	hydrapple	\N	28	1.8	93	5	Суперсладкий сироп   Регенерация   Липкий захват	14	Самцы: 50% Самки: 50% 	159	153	98.7	106	80	110	44	120	80	540
1250	Разжигающий Огонь	https://www.orthrusonline.ru/static/images/p/nextgen/gougingfire.png	gougingfire	\N	3	3.5	590	3	Протосинтез	80	Бесполые	12	10	99.9	105	115	121	91	65	93	590
1251	Яростная Стрела	https://www.orthrusonline.ru/static/images/p/nextgen/ragingbolt.png	ragingbolt	\N	41	5.2	480	3	Протосинтез	80	Бесполые	14	14	99.9	125	73	91	75	137	89	590
1252	Железный Валун	https://www.orthrusonline.ru/static/images/p/nextgen/ironboulder.png	ironboulder	\N	147	1.5	162.5	3	Кварк-двигатель	80	Бесполые	7	1	100	90	120	80	124	68	108	590
1253	Железная Корона	https://www.orthrusonline.ru/static/images/p/nextgen/ironcrown.png	ironcrown	\N	60	1.6	156	3	Кварк-двигатель	80	Бесполые	7	1	100	90	72	100	98	122	108	590
1254	Терапагос	https://www.orthrusonline.ru/static/images/p/nextgen/terapagos.png	terapagos	\N	17	0.2	6.5	3	Тера Сдвиг	80	Бесполые	1	0	100	90	65	85	60	65	85	450
1255	Печарант	https://www.orthrusonline.ru/static/images/p/nextgen/pecharunt.png	pecharunt	\N	222	0.3	0.3	3	Ядовитый Кукловод	80	Бесполые	1	0	100	88	88	160	88	88	88	600
\.


--
-- Data for Name: pokemons_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemons_ratings (rating_id, pokemon_id, user_id, rating) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, role_title) FROM stdin;
1	Админ
2	Пользователь
\.


--
-- Data for Name: user_activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_activities (activity_id, user_id, activity, "timestamp") FROM stdin;
163	2	Guest open pockemons	2024-03-29 14:48:35.803043
164	8	User 8 log in!	2024-03-29 16:13:27.739038
165	8	User 8 log in!	2024-03-29 16:17:24.444432
166	8	User 8 log in!	2024-03-29 16:18:08.748888
167	8	User 8 log in!	2024-03-29 16:20:07.010383
168	8	User 8 log in!	2024-03-29 16:21:53.712888
169	8	User 8 log in!	2024-03-29 16:23:12.169147
170	8	User 8 log in!	2024-03-29 16:32:24.477442
171	8	User 8 log in!	2024-03-29 16:34:53.639887
172	8	User 8 log in!	2024-03-29 16:36:21.782499
173	2	Guest try to registrate	2024-03-29 16:36:45.754221
174	2	Guest try to registrate	2024-03-29 16:43:06.33772
175	2	Guest try to registrate	2024-03-29 16:53:02.010142
177	8	User 8 log in!	2024-03-29 17:02:46.105884
178	8	User 8 log in!	2024-03-29 17:03:37.779788
179	2	Guest try to registrate	2024-03-29 17:04:51.497267
180	12	User 12 just registrated!	2024-03-29 17:05:02.579403
125	8	User 8 log in!	2024-03-28 15:42:49.501226
126	2	Guest open pockemons	2024-03-28 16:17:05.105506
127	2	Guest open pockemons	2024-03-28 16:18:15.1752
128	2	Guest open pockemons	2024-03-28 16:20:42.876841
129	2	Guest open pockemons	2024-03-28 16:25:42.313172
130	2	Guest open pockemons	2024-03-28 16:26:47.147878
131	2	Guest open pockemons	2024-03-28 16:30:52.042044
132	2	Guest open pockemons	2024-03-29 02:03:07.576711
133	2	Guest open pockemons	2024-03-29 02:04:22.733104
134	2	Guest open pockemons	2024-03-29 02:06:16.857369
135	2	Guest open pockemons	2024-03-29 02:06:57.186671
136	2	Guest open pockemons	2024-03-29 02:07:51.016661
137	2	Guest open pockemons	2024-03-29 02:08:31.84835
138	2	Guest open pockemons	2024-03-29 02:10:44.977453
139	2	Guest open pockemons	2024-03-29 02:18:04.591151
140	2	Guest try to registrate	2024-03-29 02:27:49.022716
142	2	Guest try to registrate	2024-03-29 02:28:58.024923
144	2	Guest open pockemons	2024-03-29 11:51:17.389579
145	2	Guest open pockemons	2024-03-29 11:52:19.720192
146	2	Guest open pockemons	2024-03-29 11:54:17.216216
147	2	Guest open pockemons	2024-03-29 11:54:56.080729
148	2	Guest open pockemons	2024-03-29 11:55:23.313986
149	2	Guest open pockemons	2024-03-29 11:57:49.377666
150	2	Guest open pockemons	2024-03-29 12:00:18.817355
151	2	Guest open pockemons	2024-03-29 12:02:47.238267
152	2	Guest open pockemons	2024-03-29 13:36:59.88323
153	2	Guest open pockemons	2024-03-29 13:44:29.019994
162	8	User 8 log in!	2024-03-29 14:33:32.281194
\.


--
-- Data for Name: xp_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xp_groups (group_id, group_title) FROM stdin;
1	Medium Slow
2	Medium Fast
3	Slow
4	Fast
5	Erratic
6	Fluctuating
\.


--
-- Name: poke_users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poke_users_user_id_seq', 12, true);


--
-- Name: pokemon_abilities_ability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokemon_abilities_ability_id_seq', 1, false);


--
-- Name: pokemon_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokemon_types_type_id_seq', 1, false);


--
-- Name: pokemons_pokemon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokemons_pokemon_id_seq', 1, false);


--
-- Name: pokemons_ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokemons_ratings_rating_id_seq', 1, false);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);


--
-- Name: user_activities_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_activities_activity_id_seq', 180, true);


--
-- Name: xp_groups_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xp_groups_group_id_seq', 1, false);


--
-- Name: poke_users poke_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poke_users
    ADD CONSTRAINT poke_users_pkey PRIMARY KEY (user_id);


--
-- Name: pokemon_abilities pokemon_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon_abilities
    ADD CONSTRAINT pokemon_abilities_pkey PRIMARY KEY (ability_id);


--
-- Name: pokemon_types pokemon_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon_types
    ADD CONSTRAINT pokemon_types_pkey PRIMARY KEY (type_id);


--
-- Name: pokemons pokemons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT pokemons_pkey PRIMARY KEY (pokemon_id);


--
-- Name: pokemons pokemons_pokemon_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT pokemons_pokemon_number_key UNIQUE (pokemon_number);


--
-- Name: pokemons_ratings pokemons_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons_ratings
    ADD CONSTRAINT pokemons_ratings_pkey PRIMARY KEY (rating_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: user_activities user_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activities
    ADD CONSTRAINT user_activities_pkey PRIMARY KEY (activity_id);


--
-- Name: xp_groups xp_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xp_groups
    ADD CONSTRAINT xp_groups_pkey PRIMARY KEY (group_id);


--
-- Name: poke_users poke_users_user_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poke_users
    ADD CONSTRAINT poke_users_user_role_fkey FOREIGN KEY (user_role) REFERENCES public.roles(role_id);


--
-- Name: poke_users poke_users_user_totem_pokemon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poke_users
    ADD CONSTRAINT poke_users_user_totem_pokemon_fkey FOREIGN KEY (user_totem_pokemon) REFERENCES public.pokemons(pokemon_id);


--
-- Name: pokemons pokemons_pokemon_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT pokemons_pokemon_type_fkey FOREIGN KEY (pokemon_type) REFERENCES public.pokemon_types(type_id);


--
-- Name: pokemons pokemons_pokemon_xp_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT pokemons_pokemon_xp_group_fkey FOREIGN KEY (pokemon_xp_group) REFERENCES public.xp_groups(group_id);


--
-- Name: pokemons_ratings pokemons_ratings_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons_ratings
    ADD CONSTRAINT pokemons_ratings_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemons(pokemon_id);


--
-- Name: pokemons_ratings pokemons_ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons_ratings
    ADD CONSTRAINT pokemons_ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.poke_users(user_id);


--
-- Name: user_activities user_activities_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activities
    ADD CONSTRAINT user_activities_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.poke_users(user_id);


--
-- PostgreSQL database dump complete
--

