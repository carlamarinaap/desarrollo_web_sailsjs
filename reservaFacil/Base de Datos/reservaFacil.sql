PGDMP     *                    {            reserva_facil    14.7 (Homebrew)    15.2 <    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    32779    reserva_facil    DATABASE     o   CREATE DATABASE reserva_facil WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE reserva_facil;
                carlamarina    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                carlamarina    false            @           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   carlamarina    false    4            �            1259    40962    admin    TABLE     �   CREATE TABLE public.admin (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    contrasena character varying NOT NULL
);
    DROP TABLE public.admin;
       public         heap    carlamarina    false    4            �            1259    40961    admin_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.admin_id_seq;
       public          carlamarina    false    218    4            A           0    0    admin_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;
          public          carlamarina    false    217            �            1259    41135    asiento    TABLE     �   CREATE TABLE public.asiento (
    id integer NOT NULL,
    reserva_id integer NOT NULL,
    confirmado boolean NOT NULL,
    numero integer NOT NULL
);
    DROP TABLE public.asiento;
       public         heap    carlamarina    false    4            �            1259    41134    asiento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.asiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.asiento_id_seq;
       public          carlamarina    false    222    4            B           0    0    asiento_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.asiento_id_seq OWNED BY public.asiento.id;
          public          carlamarina    false    221            �            1259    32808    evento    TABLE     �   CREATE TABLE public.evento (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    imagen character varying NOT NULL
);
    DROP TABLE public.evento;
       public         heap    carlamarina    false    4            �            1259    32807    eventos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.eventos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.eventos_id_seq;
       public          carlamarina    false    4    212            C           0    0    eventos_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.eventos_id_seq OWNED BY public.evento.id;
          public          carlamarina    false    211            �            1259    32817    funcion    TABLE     �   CREATE TABLE public.funcion (
    id integer NOT NULL,
    evento_id integer NOT NULL,
    lugar_id integer NOT NULL,
    hora character varying NOT NULL,
    capacidad integer NOT NULL
);
    DROP TABLE public.funcion;
       public         heap    carlamarina    false    4            �            1259    32816    funciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.funciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.funciones_id_seq;
       public          carlamarina    false    214    4            D           0    0    funciones_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.funciones_id_seq OWNED BY public.funcion.id;
          public          carlamarina    false    213            �            1259    32942    lugar    TABLE     ~   CREATE TABLE public.lugar (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    capacidad integer NOT NULL
);
    DROP TABLE public.lugar;
       public         heap    carlamarina    false    4            �            1259    32941    lugaress_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lugaress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.lugaress_id_seq;
       public          carlamarina    false    216    4            E           0    0    lugaress_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.lugaress_id_seq OWNED BY public.lugar.id;
          public          carlamarina    false    215            �            1259    41033    reserva    TABLE     �   CREATE TABLE public.reserva (
    id integer NOT NULL,
    telefono integer,
    email character varying,
    boletos integer,
    funcion_id integer,
    usuario_id integer
);
    DROP TABLE public.reserva;
       public         heap    carlamarina    false    4            �            1259    41032    reserva_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reserva_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reserva_id_seq;
       public          carlamarina    false    220    4            F           0    0    reserva_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reserva_id_seq OWNED BY public.reserva.id;
          public          carlamarina    false    219            �            1259    32781    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    contrasena character varying NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    carlamarina    false    4            �            1259    32780    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          carlamarina    false    4    210            G           0    0    usuarios_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuario.id;
          public          carlamarina    false    209            �           2604    40965    admin id    DEFAULT     d   ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);
 7   ALTER TABLE public.admin ALTER COLUMN id DROP DEFAULT;
       public          carlamarina    false    217    218    218            �           2604    41138 
   asiento id    DEFAULT     h   ALTER TABLE ONLY public.asiento ALTER COLUMN id SET DEFAULT nextval('public.asiento_id_seq'::regclass);
 9   ALTER TABLE public.asiento ALTER COLUMN id DROP DEFAULT;
       public          carlamarina    false    222    221    222            �           2604    32811 	   evento id    DEFAULT     g   ALTER TABLE ONLY public.evento ALTER COLUMN id SET DEFAULT nextval('public.eventos_id_seq'::regclass);
 8   ALTER TABLE public.evento ALTER COLUMN id DROP DEFAULT;
       public          carlamarina    false    211    212    212            �           2604    32820 
   funcion id    DEFAULT     j   ALTER TABLE ONLY public.funcion ALTER COLUMN id SET DEFAULT nextval('public.funciones_id_seq'::regclass);
 9   ALTER TABLE public.funcion ALTER COLUMN id DROP DEFAULT;
       public          carlamarina    false    214    213    214            �           2604    32945    lugar id    DEFAULT     g   ALTER TABLE ONLY public.lugar ALTER COLUMN id SET DEFAULT nextval('public.lugaress_id_seq'::regclass);
 7   ALTER TABLE public.lugar ALTER COLUMN id DROP DEFAULT;
       public          carlamarina    false    215    216    216            �           2604    41036 
   reserva id    DEFAULT     h   ALTER TABLE ONLY public.reserva ALTER COLUMN id SET DEFAULT nextval('public.reserva_id_seq'::regclass);
 9   ALTER TABLE public.reserva ALTER COLUMN id DROP DEFAULT;
       public          carlamarina    false    220    219    220            �           2604    32784 
   usuario id    DEFAULT     i   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          carlamarina    false    210    209    210            5          0    40962    admin 
   TABLE DATA           7   COPY public.admin (id, nombre, contrasena) FROM stdin;
    public          carlamarina    false    218   z@       9          0    41135    asiento 
   TABLE DATA           E   COPY public.asiento (id, reserva_id, confirmado, numero) FROM stdin;
    public          carlamarina    false    222   �@       /          0    32808    evento 
   TABLE DATA           4   COPY public.evento (id, nombre, imagen) FROM stdin;
    public          carlamarina    false    212   A       1          0    32817    funcion 
   TABLE DATA           K   COPY public.funcion (id, evento_id, lugar_id, hora, capacidad) FROM stdin;
    public          carlamarina    false    214   �A       3          0    32942    lugar 
   TABLE DATA           6   COPY public.lugar (id, nombre, capacidad) FROM stdin;
    public          carlamarina    false    216   )B       7          0    41033    reserva 
   TABLE DATA           W   COPY public.reserva (id, telefono, email, boletos, funcion_id, usuario_id) FROM stdin;
    public          carlamarina    false    220   �B       -          0    32781    usuario 
   TABLE DATA           9   COPY public.usuario (id, nombre, contrasena) FROM stdin;
    public          carlamarina    false    210   C       H           0    0    admin_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.admin_id_seq', 2, true);
          public          carlamarina    false    217            I           0    0    asiento_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.asiento_id_seq', 58, true);
          public          carlamarina    false    221            J           0    0    eventos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.eventos_id_seq', 11, true);
          public          carlamarina    false    211            K           0    0    funciones_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.funciones_id_seq', 41, true);
          public          carlamarina    false    213            L           0    0    lugaress_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.lugaress_id_seq', 5, true);
          public          carlamarina    false    215            M           0    0    reserva_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.reserva_id_seq', 139, true);
          public          carlamarina    false    219            N           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 6, true);
          public          carlamarina    false    209            �           2606    40969    admin admin_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            carlamarina    false    218            �           2606    41140    asiento asiento_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.asiento
    ADD CONSTRAINT asiento_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.asiento DROP CONSTRAINT asiento_pkey;
       public            carlamarina    false    222            �           2606    32815    evento eventos_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.evento
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.evento DROP CONSTRAINT eventos_pkey;
       public            carlamarina    false    212            �           2606    32822    funcion funciones_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT funciones_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.funcion DROP CONSTRAINT funciones_pkey;
       public            carlamarina    false    214            �           2606    32949    lugar lugaress_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.lugar
    ADD CONSTRAINT lugaress_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.lugar DROP CONSTRAINT lugaress_pkey;
       public            carlamarina    false    216            �           2606    41040    reserva reserva_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_pkey;
       public            carlamarina    false    220            �           2606    32788    usuario usuarios_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuarios_pkey;
       public            carlamarina    false    210            �           2606    41119    funcion evento_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT evento_id FOREIGN KEY (evento_id) REFERENCES public.evento(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ;   ALTER TABLE ONLY public.funcion DROP CONSTRAINT evento_id;
       public          carlamarina    false    3473    212    214            �           2606    41129    reserva funcion_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT funcion_id FOREIGN KEY (funcion_id) REFERENCES public.funcion(id) ON DELETE CASCADE NOT VALID;
 <   ALTER TABLE ONLY public.reserva DROP CONSTRAINT funcion_id;
       public          carlamarina    false    3475    220    214            �           2606    41124    funcion lugar_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT lugar_id FOREIGN KEY (lugar_id) REFERENCES public.lugar(id) ON UPDATE SET NULL ON DELETE SET NULL NOT VALID;
 :   ALTER TABLE ONLY public.funcion DROP CONSTRAINT lugar_id;
       public          carlamarina    false    214    3477    216            �           2606    41141    asiento reserva_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.asiento
    ADD CONSTRAINT reserva_id FOREIGN KEY (reserva_id) REFERENCES public.reserva(id) ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.asiento DROP CONSTRAINT reserva_id;
       public          carlamarina    false    3481    222    220            �           2606    41088    reserva usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT usuario_id FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 <   ALTER TABLE ONLY public.reserva DROP CONSTRAINT usuario_id;
       public          carlamarina    false    210    3471    220            5   9   x�3�LN,�I�M,��K�442615�2�LKL.�K�OMIO,J��4��Jq��qqq ���      9   J   x�-̱�0��& %J�0#�#����3�׻�����͂��6T憦M����m&��Va���D      /   �   x�m�;�0��99�OP�w�t@�	���V��IPӔ�q.��<�_b�b���z��P{r�'㣗��N���Zp-��;ݔ��Aɤ'n�O��"Q��������s͹�`�7��p]GnQ+N�C�H��6�)�,س��i�Q��H)?8a]      1   S   x�-���@D��P�`P��n�������@!�ܞQF�8�٦1�D�dycqX�P�����o����jk|���zu�f�v��      3   L   x�3�tN�+)�W�UN�IT0�44�2���/*I��qZps����&���%&��\����Hb� �=... �N      7   q   x����
�0Dϛ�	��Z�͏��eH��Q$��� ��a�ӛaX��\�����"���w�/�8�T�*��=�X9�Ga�H���)6�(�������/\�|W��-����ýw�m *0�      -   n   x�5�K�0��a����*RH$�O@�[�<���G.�I�
ƅ�Ftp�f�����@�OR?k�G>�X��9^55I�Ԡ�i^��"=�=��k���j��x�&�     