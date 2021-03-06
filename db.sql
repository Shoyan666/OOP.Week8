PGDMP     .    +                y            postgres    13.0    13.0     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    13442    postgres    DATABASE     i   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Kazakhstan.1251';
    DROP DATABASE postgres;
                postgres    false            ?           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3023                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            ?           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    16987    cards    TABLE     ?   CREATE TABLE public.cards (
    card_number integer NOT NULL,
    password character varying(12),
    balance character varying(12),
    login integer,
    cvv integer
);
    DROP TABLE public.cards;
       public         heap    postgres    false            ?            1259    16997    debts    TABLE     m   CREATE TABLE public.debts (
    card_number integer,
    loan_plan integer,
    loan_sum integer NOT NULL
);
    DROP TABLE public.debts;
       public         heap    postgres    false            ?            1259    17018    precious    TABLE     o   CREATE TABLE public.precious (
    weight integer,
    name character varying(25),
    authenticity boolean
);
    DROP TABLE public.precious;
       public         heap    postgres    false            ?            1259    17021    semi_precious    TABLE     ?   CREATE TABLE public.semi_precious (
    weight integer,
    name character varying(25),
    authenticity boolean,
    id integer
);
 !   DROP TABLE public.semi_precious;
       public         heap    postgres    false            ?            1259    17007    trans    TABLE     ?   CREATE TABLE public.trans (
    id integer NOT NULL,
    date character varying(25),
    type character varying(20),
    permission boolean,
    sum integer,
    card_number integer
);
    DROP TABLE public.trans;
       public         heap    postgres    false            ?            1259    17005    trans_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.trans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.trans_id_seq;
       public          postgres    false    205            ?           0    0    trans_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.trans_id_seq OWNED BY public.trans.id;
          public          postgres    false    204            ?            1259    16977    users    TABLE     ?   CREATE TABLE public.users (
    login integer NOT NULL,
    fname character varying(12),
    lname character varying(12),
    birth_date character varying(12)
);
    DROP TABLE public.users;
       public         heap    postgres    false            7           2604    17010    trans id    DEFAULT     d   ALTER TABLE ONLY public.trans ALTER COLUMN id SET DEFAULT nextval('public.trans_id_seq'::regclass);
 7   ALTER TABLE public.trans ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            ?          0    16987    cards 
   TABLE DATA           K   COPY public.cards (card_number, password, balance, login, cvv) FROM stdin;
    public          postgres    false    202   ?       ?          0    16997    debts 
   TABLE DATA           A   COPY public.debts (card_number, loan_plan, loan_sum) FROM stdin;
    public          postgres    false    203   ?       ?          0    17018    precious 
   TABLE DATA           >   COPY public.precious (weight, name, authenticity) FROM stdin;
    public          postgres    false    206   ?       ?          0    17021    semi_precious 
   TABLE DATA           G   COPY public.semi_precious (weight, name, authenticity, id) FROM stdin;
    public          postgres    false    207   ?       ?          0    17007    trans 
   TABLE DATA           M   COPY public.trans (id, date, type, permission, sum, card_number) FROM stdin;
    public          postgres    false    205   ?       ?          0    16977    users 
   TABLE DATA           @   COPY public.users (login, fname, lname, birth_date) FROM stdin;
    public          postgres    false    201          ?           0    0    trans_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.trans_id_seq', 1, false);
          public          postgres    false    204            ;           2606    16991    cards cards_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (card_number);
 :   ALTER TABLE ONLY public.cards DROP CONSTRAINT cards_pkey;
       public            postgres    false    202            =           2606    17012    trans trans_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.trans
    ADD CONSTRAINT trans_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.trans DROP CONSTRAINT trans_pkey;
       public            postgres    false    205            9           2606    16981    users users_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (login);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            >           2606    16992    cards cards_login_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_login_fkey FOREIGN KEY (login) REFERENCES public.users(login);
 @   ALTER TABLE ONLY public.cards DROP CONSTRAINT cards_login_fkey;
       public          postgres    false    202    201    2873            ?           2606    17000    debts debts_card_number_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.debts
    ADD CONSTRAINT debts_card_number_fkey FOREIGN KEY (card_number) REFERENCES public.cards(card_number);
 F   ALTER TABLE ONLY public.debts DROP CONSTRAINT debts_card_number_fkey;
       public          postgres    false    2875    202    203            @           2606    17013    trans trans_card_number_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.trans
    ADD CONSTRAINT trans_card_number_fkey FOREIGN KEY (card_number) REFERENCES public.cards(card_number);
 F   ALTER TABLE ONLY public.trans DROP CONSTRAINT trans_card_number_fkey;
       public          postgres    false    2875    205    202            ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?     