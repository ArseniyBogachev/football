PGDMP     ;                     {            Football_db    14.3    14.3 Y   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16560    Football_db    DATABASE     j   CREATE DATABASE "Football_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Football_db";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    16587 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false    3            �            1259    16586    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    3    216            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    215            �            1259    16596    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false    3            �            1259    16595    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    3    218            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    217            �            1259    16580    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false    3            �            1259    16579    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    3    214            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    213            �            1259    16723    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false    3            �            1259    16722    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    230    3            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    229            �            1259    16571    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false    3            �            1259    16570    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    212    3            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    211            �            1259    16562    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false    3            �            1259    16561    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    3    210            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    209            �            1259    16744    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false    3            �            1259    16644    startapp_articles    TABLE     �   CREATE TABLE public.startapp_articles (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    date timestamp with time zone NOT NULL,
    text text NOT NULL,
    author_id bigint,
    cat_id bigint
);
 %   DROP TABLE public.startapp_articles;
       public         heap    postgres    false    3            �            1259    16643    startapp_articles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.startapp_articles_id_seq;
       public          postgres    false    3    222            �           0    0    startapp_articles_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.startapp_articles_id_seq OWNED BY public.startapp_articles.id;
          public          postgres    false    221            �            1259    16789    startapp_articleslikes    TABLE     �   CREATE TABLE public.startapp_articleslikes (
    id bigint NOT NULL,
    likes boolean NOT NULL,
    article_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 *   DROP TABLE public.startapp_articleslikes;
       public         heap    postgres    false    3            �            1259    16788    startapp_articleslikes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_articleslikes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.startapp_articleslikes_id_seq;
       public          postgres    false    3    235            �           0    0    startapp_articleslikes_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.startapp_articleslikes_id_seq OWNED BY public.startapp_articleslikes.id;
          public          postgres    false    234            �            1259    16653    startapp_articlesrelation    TABLE     �   CREATE TABLE public.startapp_articlesrelation (
    id bigint NOT NULL,
    bookmarks boolean NOT NULL,
    user_id bigint NOT NULL,
    article_id bigint NOT NULL
);
 -   DROP TABLE public.startapp_articlesrelation;
       public         heap    postgres    false    3            �            1259    16652     startapp_articlesrelation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_articlesrelation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.startapp_articlesrelation_id_seq;
       public          postgres    false    224    3            �           0    0     startapp_articlesrelation_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.startapp_articlesrelation_id_seq OWNED BY public.startapp_articlesrelation.id;
          public          postgres    false    223            �            1259    123067    startapp_blacklistjwt    TABLE     �   CREATE TABLE public.startapp_blacklistjwt (
    id bigint NOT NULL,
    token character varying(500) NOT NULL,
    user_id bigint NOT NULL
);
 )   DROP TABLE public.startapp_blacklistjwt;
       public         heap    postgres    false    3            �            1259    123066    startapp_blacklistjwt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_blacklistjwt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.startapp_blacklistjwt_id_seq;
       public          postgres    false    3    243            �           0    0    startapp_blacklistjwt_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.startapp_blacklistjwt_id_seq OWNED BY public.startapp_blacklistjwt.id;
          public          postgres    false    242            �            1259    16769    startapp_categoryarticles    TABLE     �   CREATE TABLE public.startapp_categoryarticles (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    link character varying(255) NOT NULL,
    image character varying(100) NOT NULL
);
 -   DROP TABLE public.startapp_categoryarticles;
       public         heap    postgres    false    3            �            1259    16768     startapp_categoryarticles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_categoryarticles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.startapp_categoryarticles_id_seq;
       public          postgres    false    233    3            �           0    0     startapp_categoryarticles_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.startapp_categoryarticles_id_seq OWNED BY public.startapp_categoryarticles.id;
          public          postgres    false    232            �            1259    145868    startapp_club    TABLE     V  CREATE TABLE public.startapp_club (
    id bigint NOT NULL,
    title character varying(20) NOT NULL,
    year_creation integer NOT NULL,
    city character varying(30) NOT NULL,
    arena character varying(30) NOT NULL,
    cup character varying(255) NOT NULL,
    manager character varying(30) NOT NULL,
    image character varying(100)
);
 !   DROP TABLE public.startapp_club;
       public         heap    postgres    false    3            �            1259    145867    startapp_club_id_seq    SEQUENCE     }   CREATE SEQUENCE public.startapp_club_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.startapp_club_id_seq;
       public          postgres    false    245    3            �           0    0    startapp_club_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.startapp_club_id_seq OWNED BY public.startapp_club.id;
          public          postgres    false    244            �            1259    50903    startapp_commentarticle    TABLE     �   CREATE TABLE public.startapp_commentarticle (
    id bigint NOT NULL,
    content text NOT NULL,
    date timestamp with time zone NOT NULL,
    article_id bigint NOT NULL,
    user_id bigint,
    reply_first_id bigint,
    reply_second_id bigint
);
 +   DROP TABLE public.startapp_commentarticle;
       public         heap    postgres    false    3            �            1259    50902    startapp_commentarticle_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_commentarticle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.startapp_commentarticle_id_seq;
       public          postgres    false    3    239            �           0    0    startapp_commentarticle_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.startapp_commentarticle_id_seq OWNED BY public.startapp_commentarticle.id;
          public          postgres    false    238                       1259    154411    startapp_matches    TABLE     -  CREATE TABLE public.startapp_matches (
    id bigint NOT NULL,
    amount_goals_home_team integer NOT NULL,
    amount_goals_guest_team integer NOT NULL,
    date_game date NOT NULL,
    guest_team_id bigint NOT NULL,
    home_team_id bigint NOT NULL,
    year_id bigint,
    total_stats_id bigint
);
 $   DROP TABLE public.startapp_matches;
       public         heap    postgres    false    3                       1259    154410    startapp_matches_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_matches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.startapp_matches_id_seq;
       public          postgres    false    271    3            �           0    0    startapp_matches_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.startapp_matches_id_seq OWNED BY public.startapp_matches.id;
          public          postgres    false    270                       1259    162603    startapp_matchesplayersstats    TABLE     k  CREATE TABLE public.startapp_matchesplayersstats (
    id bigint NOT NULL,
    min integer NOT NULL,
    sh integer NOT NULL,
    goal integer NOT NULL,
    kp integer NOT NULL,
    assist integer NOT NULL,
    xg numeric(4,2) NOT NULL,
    xa numeric(4,2) NOT NULL,
    match_id bigint NOT NULL,
    player_id bigint NOT NULL,
    position_id bigint NOT NULL
);
 0   DROP TABLE public.startapp_matchesplayersstats;
       public         heap    postgres    false    3                       1259    162602 #   startapp_matchesplayersstats_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_matchesplayersstats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.startapp_matchesplayersstats_id_seq;
       public          postgres    false    3    273            �           0    0 #   startapp_matchesplayersstats_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.startapp_matchesplayersstats_id_seq OWNED BY public.startapp_matchesplayersstats.id;
          public          postgres    false    272                       1259    162610    startapp_matchesstats    TABLE     E  CREATE TABLE public.startapp_matchesstats (
    id bigint NOT NULL,
    home_chances integer NOT NULL,
    home_xg numeric(4,2) NOT NULL,
    home_shots integer NOT NULL,
    home_shots_on_target integer NOT NULL,
    home_deep integer NOT NULL,
    home_ppda numeric(4,2) NOT NULL,
    home_xpts numeric(4,2) NOT NULL,
    guest_chances integer NOT NULL,
    guest_xg numeric(4,2) NOT NULL,
    guest_shots integer NOT NULL,
    guest_shots_on_target integer NOT NULL,
    guest_deep integer NOT NULL,
    guest_ppda numeric(4,2) NOT NULL,
    guest_xpts numeric(4,2) NOT NULL
);
 )   DROP TABLE public.startapp_matchesstats;
       public         heap    postgres    false    3                       1259    162609    startapp_matchesstats_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_matchesstats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.startapp_matchesstats_id_seq;
       public          postgres    false    3    275            �           0    0    startapp_matchesstats_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.startapp_matchesstats_id_seq OWNED BY public.startapp_matchesstats.id;
          public          postgres    false    274            �            1259    145877    startapp_players    TABLE     �  CREATE TABLE public.startapp_players (
    id bigint NOT NULL,
    first_name character varying(15) NOT NULL,
    last_name character varying(15) NOT NULL,
    number integer NOT NULL,
    club_id bigint NOT NULL,
    main_position_id bigint NOT NULL,
    date date,
    image character varying(100),
    city character varying(30) NOT NULL,
    country character varying(30) NOT NULL
);
 $   DROP TABLE public.startapp_players;
       public         heap    postgres    false    3            �            1259    145876    startapp_players_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.startapp_players_id_seq;
       public          postgres    false    247    3            �           0    0    startapp_players_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.startapp_players_id_seq OWNED BY public.startapp_players.id;
          public          postgres    false    246            �            1259    145884    startapp_position    TABLE     v   CREATE TABLE public.startapp_position (
    id bigint NOT NULL,
    position_player character varying(30) NOT NULL
);
 %   DROP TABLE public.startapp_position;
       public         heap    postgres    false    3            �            1259    145883    startapp_position_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.startapp_position_id_seq;
       public          postgres    false    3    249            �           0    0    startapp_position_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.startapp_position_id_seq OWNED BY public.startapp_position.id;
          public          postgres    false    248                       1259    145954    startapp_positionchampionship    TABLE     �   CREATE TABLE public.startapp_positionchampionship (
    id bigint NOT NULL,
    position_team integer NOT NULL,
    club_id bigint NOT NULL,
    year_id bigint NOT NULL
);
 1   DROP TABLE public.startapp_positionchampionship;
       public         heap    postgres    false    3                       1259    145953 $   startapp_positionchampionship_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_positionchampionship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.startapp_positionchampionship_id_seq;
       public          postgres    false    269    3            �           0    0 $   startapp_positionchampionship_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.startapp_positionchampionship_id_seq OWNED BY public.startapp_positionchampionship.id;
          public          postgres    false    268                       1259    145947    startapp_positionstatistics    TABLE     �  CREATE TABLE public.startapp_positionstatistics (
    id bigint NOT NULL,
    apps integer NOT NULL,
    min integer NOT NULL,
    goal integer NOT NULL,
    assist integer NOT NULL,
    sh_90 numeric(4,2) NOT NULL,
    kp_90 numeric(4,2) NOT NULL,
    xg numeric(4,2) NOT NULL,
    xa numeric(4,2) NOT NULL,
    xg_90 numeric(4,2) NOT NULL,
    xa_90 numeric(4,2) NOT NULL,
    player_id bigint NOT NULL,
    position_id bigint NOT NULL
);
 /   DROP TABLE public.startapp_positionstatistics;
       public         heap    postgres    false    3            
           1259    145946 "   startapp_positionstatistics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_positionstatistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.startapp_positionstatistics_id_seq;
       public          postgres    false    267    3            �           0    0 "   startapp_positionstatistics_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.startapp_positionstatistics_id_seq OWNED BY public.startapp_positionstatistics.id;
          public          postgres    false    266            �            1259    50912    startapp_ratecomment    TABLE     �   CREATE TABLE public.startapp_ratecomment (
    id bigint NOT NULL,
    rate boolean NOT NULL,
    comment_id bigint NOT NULL,
    user_id bigint
);
 (   DROP TABLE public.startapp_ratecomment;
       public         heap    postgres    false    3            �            1259    50911    startapp_ratecomment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_ratecomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.startapp_ratecomment_id_seq;
       public          postgres    false    241    3            �           0    0    startapp_ratecomment_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.startapp_ratecomment_id_seq OWNED BY public.startapp_ratecomment.id;
          public          postgres    false    240            �            1259    145891    startapp_shottypes    TABLE     l   CREATE TABLE public.startapp_shottypes (
    id bigint NOT NULL,
    type character varying(30) NOT NULL
);
 &   DROP TABLE public.startapp_shottypes;
       public         heap    postgres    false    3            �            1259    145890    startapp_shottypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_shottypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.startapp_shottypes_id_seq;
       public          postgres    false    251    3            �           0    0    startapp_shottypes_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.startapp_shottypes_id_seq OWNED BY public.startapp_shottypes.id;
          public          postgres    false    250            	           1259    145940    startapp_shottypesstatistics    TABLE     w  CREATE TABLE public.startapp_shottypesstatistics (
    id bigint NOT NULL,
    sh integer NOT NULL,
    goal integer NOT NULL,
    kp integer NOT NULL,
    assist integer NOT NULL,
    xg numeric(4,2) NOT NULL,
    xa numeric(4,2) NOT NULL,
    xg_sh numeric(4,2) NOT NULL,
    xa_kp numeric(4,2) NOT NULL,
    player_id bigint NOT NULL,
    shot_types_id bigint NOT NULL
);
 0   DROP TABLE public.startapp_shottypesstatistics;
       public         heap    postgres    false    3                       1259    145939 #   startapp_shottypesstatistics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_shottypesstatistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.startapp_shottypesstatistics_id_seq;
       public          postgres    false    3    265            �           0    0 #   startapp_shottypesstatistics_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.startapp_shottypesstatistics_id_seq OWNED BY public.startapp_shottypesstatistics.id;
          public          postgres    false    264            �            1259    145898    startapp_shotzones    TABLE     l   CREATE TABLE public.startapp_shotzones (
    id bigint NOT NULL,
    zone character varying(30) NOT NULL
);
 &   DROP TABLE public.startapp_shotzones;
       public         heap    postgres    false    3            �            1259    145897    startapp_shotzones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_shotzones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.startapp_shotzones_id_seq;
       public          postgres    false    253    3            �           0    0    startapp_shotzones_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.startapp_shotzones_id_seq OWNED BY public.startapp_shotzones.id;
          public          postgres    false    252                       1259    145933    startapp_shotzonesstatistics    TABLE     w  CREATE TABLE public.startapp_shotzonesstatistics (
    id bigint NOT NULL,
    sh integer NOT NULL,
    goal integer NOT NULL,
    kp integer NOT NULL,
    assist integer NOT NULL,
    xg numeric(4,2) NOT NULL,
    xa numeric(4,2) NOT NULL,
    xg_sh numeric(4,2) NOT NULL,
    xa_kp numeric(4,2) NOT NULL,
    player_id bigint NOT NULL,
    shot_zones_id bigint NOT NULL
);
 0   DROP TABLE public.startapp_shotzonesstatistics;
       public         heap    postgres    false    3                       1259    145932 #   startapp_shotzonesstatistics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_shotzonesstatistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.startapp_shotzonesstatistics_id_seq;
       public          postgres    false    3    263            �           0    0 #   startapp_shotzonesstatistics_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.startapp_shotzonesstatistics_id_seq OWNED BY public.startapp_shotzonesstatistics.id;
          public          postgres    false    262            �            1259    145905    startapp_situation    TABLE     v   CREATE TABLE public.startapp_situation (
    id bigint NOT NULL,
    situation_game character varying(30) NOT NULL
);
 &   DROP TABLE public.startapp_situation;
       public         heap    postgres    false    3            �            1259    145904    startapp_situation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_situation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.startapp_situation_id_seq;
       public          postgres    false    3    255            �           0    0    startapp_situation_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.startapp_situation_id_seq OWNED BY public.startapp_situation.id;
          public          postgres    false    254                       1259    145926    startapp_situationstatistics    TABLE     �  CREATE TABLE public.startapp_situationstatistics (
    id bigint NOT NULL,
    sh integer NOT NULL,
    goal integer NOT NULL,
    kp integer NOT NULL,
    assist integer NOT NULL,
    xg numeric(4,2) NOT NULL,
    xa numeric(4,2) NOT NULL,
    xg_90 numeric(4,2) NOT NULL,
    xa_90 numeric(4,2) NOT NULL,
    xg_sh numeric(4,2) NOT NULL,
    xa_kp numeric(4,2) NOT NULL,
    player_id bigint NOT NULL,
    situation_id bigint NOT NULL
);
 0   DROP TABLE public.startapp_situationstatistics;
       public         heap    postgres    false    3                       1259    145925 #   startapp_situationstatistics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_situationstatistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.startapp_situationstatistics_id_seq;
       public          postgres    false    3    261            �           0    0 #   startapp_situationstatistics_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.startapp_situationstatistics_id_seq OWNED BY public.startapp_situationstatistics.id;
          public          postgres    false    260                       1259    145919    startapp_totalstatistics    TABLE     �  CREATE TABLE public.startapp_totalstatistics (
    id bigint NOT NULL,
    apps integer NOT NULL,
    min integer NOT NULL,
    goal integer NOT NULL,
    assist integer NOT NULL,
    sh_90 numeric(4,2) NOT NULL,
    kp_90 numeric(4,2) NOT NULL,
    xg numeric(4,2) NOT NULL,
    xa numeric(4,2) NOT NULL,
    xg_90 numeric(4,2) NOT NULL,
    xa_90 numeric(4,2) NOT NULL,
    club_id bigint NOT NULL,
    player_id bigint NOT NULL,
    year_id bigint NOT NULL
);
 ,   DROP TABLE public.startapp_totalstatistics;
       public         heap    postgres    false    3                       1259    145918    startapp_totalstatistics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_totalstatistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.startapp_totalstatistics_id_seq;
       public          postgres    false    259    3            �           0    0    startapp_totalstatistics_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.startapp_totalstatistics_id_seq OWNED BY public.startapp_totalstatistics.id;
          public          postgres    false    258            �            1259    16629    startapp_users    TABLE       CREATE TABLE public.startapp_users (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(10) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    first_name character varying(10) NOT NULL,
    last_name character varying(10) NOT NULL,
    email character varying(254) NOT NULL,
    image character varying(100)
);
 "   DROP TABLE public.startapp_users;
       public         heap    postgres    false    3            �            1259    16660    startapp_users_groups    TABLE     �   CREATE TABLE public.startapp_users_groups (
    id bigint NOT NULL,
    users_id bigint NOT NULL,
    group_id integer NOT NULL
);
 )   DROP TABLE public.startapp_users_groups;
       public         heap    postgres    false    3            �            1259    16659    startapp_users_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_users_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.startapp_users_groups_id_seq;
       public          postgres    false    3    226            �           0    0    startapp_users_groups_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.startapp_users_groups_id_seq OWNED BY public.startapp_users_groups.id;
          public          postgres    false    225            �            1259    16628    startapp_users_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.startapp_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.startapp_users_id_seq;
       public          postgres    false    220    3            �           0    0    startapp_users_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.startapp_users_id_seq OWNED BY public.startapp_users.id;
          public          postgres    false    219            �            1259    16667    startapp_users_user_permissions    TABLE     �   CREATE TABLE public.startapp_users_user_permissions (
    id bigint NOT NULL,
    users_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 3   DROP TABLE public.startapp_users_user_permissions;
       public         heap    postgres    false    3            �            1259    16666 &   startapp_users_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_users_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.startapp_users_user_permissions_id_seq;
       public          postgres    false    228    3            �           0    0 &   startapp_users_user_permissions_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.startapp_users_user_permissions_id_seq OWNED BY public.startapp_users_user_permissions.id;
          public          postgres    false    227            �            1259    37883    startapp_userssub    TABLE     �   CREATE TABLE public.startapp_userssub (
    id bigint NOT NULL,
    add boolean NOT NULL,
    subscription_id bigint,
    user_id bigint
);
 %   DROP TABLE public.startapp_userssub;
       public         heap    postgres    false    3            �            1259    37882    startapp_userssub_id_seq    SEQUENCE     �   CREATE SEQUENCE public.startapp_userssub_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.startapp_userssub_id_seq;
       public          postgres    false    3    237            �           0    0    startapp_userssub_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.startapp_userssub_id_seq OWNED BY public.startapp_userssub.id;
          public          postgres    false    236                       1259    145912    startapp_years    TABLE     h   CREATE TABLE public.startapp_years (
    id bigint NOT NULL,
    year character varying(10) NOT NULL
);
 "   DROP TABLE public.startapp_years;
       public         heap    postgres    false    3                        1259    145911    startapp_years_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.startapp_years_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.startapp_years_id_seq;
       public          postgres    false    3    257            �           0    0    startapp_years_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.startapp_years_id_seq OWNED BY public.startapp_years.id;
          public          postgres    false    256                       2604    16590    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216                       2604    16599    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218                       2604    16583    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            
           2604    16726    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230                       2604    16574    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212                        2604    16565    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210                       2604    16647    startapp_articles id    DEFAULT     |   ALTER TABLE ONLY public.startapp_articles ALTER COLUMN id SET DEFAULT nextval('public.startapp_articles_id_seq'::regclass);
 C   ALTER TABLE public.startapp_articles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222                       2604    16792    startapp_articleslikes id    DEFAULT     �   ALTER TABLE ONLY public.startapp_articleslikes ALTER COLUMN id SET DEFAULT nextval('public.startapp_articleslikes_id_seq'::regclass);
 H   ALTER TABLE public.startapp_articleslikes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234    235                       2604    16656    startapp_articlesrelation id    DEFAULT     �   ALTER TABLE ONLY public.startapp_articlesrelation ALTER COLUMN id SET DEFAULT nextval('public.startapp_articlesrelation_id_seq'::regclass);
 K   ALTER TABLE public.startapp_articlesrelation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224                       2604    123070    startapp_blacklistjwt id    DEFAULT     �   ALTER TABLE ONLY public.startapp_blacklistjwt ALTER COLUMN id SET DEFAULT nextval('public.startapp_blacklistjwt_id_seq'::regclass);
 G   ALTER TABLE public.startapp_blacklistjwt ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243                       2604    16772    startapp_categoryarticles id    DEFAULT     �   ALTER TABLE ONLY public.startapp_categoryarticles ALTER COLUMN id SET DEFAULT nextval('public.startapp_categoryarticles_id_seq'::regclass);
 K   ALTER TABLE public.startapp_categoryarticles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233                       2604    145871    startapp_club id    DEFAULT     t   ALTER TABLE ONLY public.startapp_club ALTER COLUMN id SET DEFAULT nextval('public.startapp_club_id_seq'::regclass);
 ?   ALTER TABLE public.startapp_club ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245                       2604    50906    startapp_commentarticle id    DEFAULT     �   ALTER TABLE ONLY public.startapp_commentarticle ALTER COLUMN id SET DEFAULT nextval('public.startapp_commentarticle_id_seq'::regclass);
 I   ALTER TABLE public.startapp_commentarticle ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239                       2604    154414    startapp_matches id    DEFAULT     z   ALTER TABLE ONLY public.startapp_matches ALTER COLUMN id SET DEFAULT nextval('public.startapp_matches_id_seq'::regclass);
 B   ALTER TABLE public.startapp_matches ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    270    271                        2604    162606    startapp_matchesplayersstats id    DEFAULT     �   ALTER TABLE ONLY public.startapp_matchesplayersstats ALTER COLUMN id SET DEFAULT nextval('public.startapp_matchesplayersstats_id_seq'::regclass);
 N   ALTER TABLE public.startapp_matchesplayersstats ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    272    273    273            !           2604    162613    startapp_matchesstats id    DEFAULT     �   ALTER TABLE ONLY public.startapp_matchesstats ALTER COLUMN id SET DEFAULT nextval('public.startapp_matchesstats_id_seq'::regclass);
 G   ALTER TABLE public.startapp_matchesstats ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    275    274    275                       2604    145880    startapp_players id    DEFAULT     z   ALTER TABLE ONLY public.startapp_players ALTER COLUMN id SET DEFAULT nextval('public.startapp_players_id_seq'::regclass);
 B   ALTER TABLE public.startapp_players ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246    247                       2604    145887    startapp_position id    DEFAULT     |   ALTER TABLE ONLY public.startapp_position ALTER COLUMN id SET DEFAULT nextval('public.startapp_position_id_seq'::regclass);
 C   ALTER TABLE public.startapp_position ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248    249                       2604    145957     startapp_positionchampionship id    DEFAULT     �   ALTER TABLE ONLY public.startapp_positionchampionship ALTER COLUMN id SET DEFAULT nextval('public.startapp_positionchampionship_id_seq'::regclass);
 O   ALTER TABLE public.startapp_positionchampionship ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    269    269                       2604    145950    startapp_positionstatistics id    DEFAULT     �   ALTER TABLE ONLY public.startapp_positionstatistics ALTER COLUMN id SET DEFAULT nextval('public.startapp_positionstatistics_id_seq'::regclass);
 M   ALTER TABLE public.startapp_positionstatistics ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    267    267                       2604    50915    startapp_ratecomment id    DEFAULT     �   ALTER TABLE ONLY public.startapp_ratecomment ALTER COLUMN id SET DEFAULT nextval('public.startapp_ratecomment_id_seq'::regclass);
 F   ALTER TABLE public.startapp_ratecomment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    241    241                       2604    145894    startapp_shottypes id    DEFAULT     ~   ALTER TABLE ONLY public.startapp_shottypes ALTER COLUMN id SET DEFAULT nextval('public.startapp_shottypes_id_seq'::regclass);
 D   ALTER TABLE public.startapp_shottypes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250    251                       2604    145943    startapp_shottypesstatistics id    DEFAULT     �   ALTER TABLE ONLY public.startapp_shottypesstatistics ALTER COLUMN id SET DEFAULT nextval('public.startapp_shottypesstatistics_id_seq'::regclass);
 N   ALTER TABLE public.startapp_shottypesstatistics ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    264    265                       2604    145901    startapp_shotzones id    DEFAULT     ~   ALTER TABLE ONLY public.startapp_shotzones ALTER COLUMN id SET DEFAULT nextval('public.startapp_shotzones_id_seq'::regclass);
 D   ALTER TABLE public.startapp_shotzones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252    253                       2604    145936    startapp_shotzonesstatistics id    DEFAULT     �   ALTER TABLE ONLY public.startapp_shotzonesstatistics ALTER COLUMN id SET DEFAULT nextval('public.startapp_shotzonesstatistics_id_seq'::regclass);
 N   ALTER TABLE public.startapp_shotzonesstatistics ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    263    263                       2604    145908    startapp_situation id    DEFAULT     ~   ALTER TABLE ONLY public.startapp_situation ALTER COLUMN id SET DEFAULT nextval('public.startapp_situation_id_seq'::regclass);
 D   ALTER TABLE public.startapp_situation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    255    255                       2604    145929    startapp_situationstatistics id    DEFAULT     �   ALTER TABLE ONLY public.startapp_situationstatistics ALTER COLUMN id SET DEFAULT nextval('public.startapp_situationstatistics_id_seq'::regclass);
 N   ALTER TABLE public.startapp_situationstatistics ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    261    261                       2604    145922    startapp_totalstatistics id    DEFAULT     �   ALTER TABLE ONLY public.startapp_totalstatistics ALTER COLUMN id SET DEFAULT nextval('public.startapp_totalstatistics_id_seq'::regclass);
 J   ALTER TABLE public.startapp_totalstatistics ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    259    259                       2604    16632    startapp_users id    DEFAULT     v   ALTER TABLE ONLY public.startapp_users ALTER COLUMN id SET DEFAULT nextval('public.startapp_users_id_seq'::regclass);
 @   ALTER TABLE public.startapp_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220                       2604    16663    startapp_users_groups id    DEFAULT     �   ALTER TABLE ONLY public.startapp_users_groups ALTER COLUMN id SET DEFAULT nextval('public.startapp_users_groups_id_seq'::regclass);
 G   ALTER TABLE public.startapp_users_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            	           2604    16670 "   startapp_users_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.startapp_users_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.startapp_users_user_permissions_id_seq'::regclass);
 Q   ALTER TABLE public.startapp_users_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228                       2604    37886    startapp_userssub id    DEFAULT     |   ALTER TABLE ONLY public.startapp_userssub ALTER COLUMN id SET DEFAULT nextval('public.startapp_userssub_id_seq'::regclass);
 C   ALTER TABLE public.startapp_userssub ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237                       2604    145915    startapp_years id    DEFAULT     v   ALTER TABLE ONLY public.startapp_years ALTER COLUMN id SET DEFAULT nextval('public.startapp_years_id_seq'::regclass);
 @   ALTER TABLE public.startapp_years ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    257    257            i          0    16587 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    216   e�      k          0    16596    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    218   ��      g          0    16580    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    214   ��      w          0    16723    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    230   R�      e          0    16571    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    212   �      c          0    16562    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    210   �      x          0    16744    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    231   (      o          0    16644    startapp_articles 
   TABLE DATA           U   COPY public.startapp_articles (id, title, date, text, author_id, cat_id) FROM stdin;
    public          postgres    false    222   �      |          0    16789    startapp_articleslikes 
   TABLE DATA           P   COPY public.startapp_articleslikes (id, likes, article_id, user_id) FROM stdin;
    public          postgres    false    235   	=      q          0    16653    startapp_articlesrelation 
   TABLE DATA           W   COPY public.startapp_articlesrelation (id, bookmarks, user_id, article_id) FROM stdin;
    public          postgres    false    224   T=      �          0    123067    startapp_blacklistjwt 
   TABLE DATA           C   COPY public.startapp_blacklistjwt (id, token, user_id) FROM stdin;
    public          postgres    false    243   �=      z          0    16769    startapp_categoryarticles 
   TABLE DATA           K   COPY public.startapp_categoryarticles (id, title, link, image) FROM stdin;
    public          postgres    false    233   �E      �          0    145868    startapp_club 
   TABLE DATA           c   COPY public.startapp_club (id, title, year_creation, city, arena, cup, manager, image) FROM stdin;
    public          postgres    false    245   'F      �          0    50903    startapp_commentarticle 
   TABLE DATA           z   COPY public.startapp_commentarticle (id, content, date, article_id, user_id, reply_first_id, reply_second_id) FROM stdin;
    public          postgres    false    239   �H      �          0    154411    startapp_matches 
   TABLE DATA           �   COPY public.startapp_matches (id, amount_goals_home_team, amount_goals_guest_team, date_game, guest_team_id, home_team_id, year_id, total_stats_id) FROM stdin;
    public          postgres    false    271   �L      �          0    162603    startapp_matchesplayersstats 
   TABLE DATA              COPY public.startapp_matchesplayersstats (id, min, sh, goal, kp, assist, xg, xa, match_id, player_id, position_id) FROM stdin;
    public          postgres    false    273   �L      �          0    162610    startapp_matchesstats 
   TABLE DATA           �   COPY public.startapp_matchesstats (id, home_chances, home_xg, home_shots, home_shots_on_target, home_deep, home_ppda, home_xpts, guest_chances, guest_xg, guest_shots, guest_shots_on_target, guest_deep, guest_ppda, guest_xpts) FROM stdin;
    public          postgres    false    275   mM      �          0    145877    startapp_players 
   TABLE DATA           �   COPY public.startapp_players (id, first_name, last_name, number, club_id, main_position_id, date, image, city, country) FROM stdin;
    public          postgres    false    247   �M      �          0    145884    startapp_position 
   TABLE DATA           @   COPY public.startapp_position (id, position_player) FROM stdin;
    public          postgres    false    249   P      �          0    145954    startapp_positionchampionship 
   TABLE DATA           \   COPY public.startapp_positionchampionship (id, position_team, club_id, year_id) FROM stdin;
    public          postgres    false    269   �P      �          0    145947    startapp_positionstatistics 
   TABLE DATA           �   COPY public.startapp_positionstatistics (id, apps, min, goal, assist, sh_90, kp_90, xg, xa, xg_90, xa_90, player_id, position_id) FROM stdin;
    public          postgres    false    267   �P      �          0    50912    startapp_ratecomment 
   TABLE DATA           M   COPY public.startapp_ratecomment (id, rate, comment_id, user_id) FROM stdin;
    public          postgres    false    241   �V      �          0    145891    startapp_shottypes 
   TABLE DATA           6   COPY public.startapp_shottypes (id, type) FROM stdin;
    public          postgres    false    251   �V      �          0    145940    startapp_shottypesstatistics 
   TABLE DATA           �   COPY public.startapp_shottypesstatistics (id, sh, goal, kp, assist, xg, xa, xg_sh, xa_kp, player_id, shot_types_id) FROM stdin;
    public          postgres    false    265   FW      �          0    145898    startapp_shotzones 
   TABLE DATA           6   COPY public.startapp_shotzones (id, zone) FROM stdin;
    public          postgres    false    253   �Y      �          0    145933    startapp_shotzonesstatistics 
   TABLE DATA           �   COPY public.startapp_shotzonesstatistics (id, sh, goal, kp, assist, xg, xa, xg_sh, xa_kp, player_id, shot_zones_id) FROM stdin;
    public          postgres    false    263   �Y      �          0    145905    startapp_situation 
   TABLE DATA           @   COPY public.startapp_situation (id, situation_game) FROM stdin;
    public          postgres    false    255   $\      �          0    145926    startapp_situationstatistics 
   TABLE DATA           �   COPY public.startapp_situationstatistics (id, sh, goal, kp, assist, xg, xa, xg_90, xa_90, xg_sh, xa_kp, player_id, situation_id) FROM stdin;
    public          postgres    false    261   �\      �          0    145919    startapp_totalstatistics 
   TABLE DATA           �   COPY public.startapp_totalstatistics (id, apps, min, goal, assist, sh_90, kp_90, xg, xa, xg_90, xa_90, club_id, player_id, year_id) FROM stdin;
    public          postgres    false    259   �_      m          0    16629    startapp_users 
   TABLE DATA           �   COPY public.startapp_users (id, password, last_login, is_superuser, username, is_staff, is_active, date_joined, first_name, last_name, email, image) FROM stdin;
    public          postgres    false    220   �`      s          0    16660    startapp_users_groups 
   TABLE DATA           G   COPY public.startapp_users_groups (id, users_id, group_id) FROM stdin;
    public          postgres    false    226   Cd      u          0    16667    startapp_users_user_permissions 
   TABLE DATA           V   COPY public.startapp_users_user_permissions (id, users_id, permission_id) FROM stdin;
    public          postgres    false    228   `d      ~          0    37883    startapp_userssub 
   TABLE DATA           N   COPY public.startapp_userssub (id, add, subscription_id, user_id) FROM stdin;
    public          postgres    false    237   }d      �          0    145912    startapp_years 
   TABLE DATA           2   COPY public.startapp_years (id, year) FROM stdin;
    public          postgres    false    257   �d      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    215            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    217            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 120, true);
          public          postgres    false    213            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 479, true);
          public          postgres    false    229            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 30, true);
          public          postgres    false    211            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 45, true);
          public          postgres    false    209            �           0    0    startapp_articles_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.startapp_articles_id_seq', 28, true);
          public          postgres    false    221            �           0    0    startapp_articleslikes_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.startapp_articleslikes_id_seq', 33, true);
          public          postgres    false    234            �           0    0     startapp_articlesrelation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.startapp_articlesrelation_id_seq', 14, true);
          public          postgres    false    223            �           0    0    startapp_blacklistjwt_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.startapp_blacklistjwt_id_seq', 25, true);
          public          postgres    false    242            �           0    0     startapp_categoryarticles_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.startapp_categoryarticles_id_seq', 5, true);
          public          postgres    false    232            �           0    0    startapp_club_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.startapp_club_id_seq', 16, true);
          public          postgres    false    244            �           0    0    startapp_commentarticle_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.startapp_commentarticle_id_seq', 60, true);
          public          postgres    false    238            �           0    0    startapp_matches_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.startapp_matches_id_seq', 4, true);
          public          postgres    false    270            �           0    0 #   startapp_matchesplayersstats_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.startapp_matchesplayersstats_id_seq', 10, true);
          public          postgres    false    272            �           0    0    startapp_matchesstats_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.startapp_matchesstats_id_seq', 2, true);
          public          postgres    false    274            �           0    0    startapp_players_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.startapp_players_id_seq', 12, true);
          public          postgres    false    246            �           0    0    startapp_position_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.startapp_position_id_seq', 22, true);
          public          postgres    false    248            �           0    0 $   startapp_positionchampionship_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.startapp_positionchampionship_id_seq', 16, true);
          public          postgres    false    268            �           0    0 "   startapp_positionstatistics_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.startapp_positionstatistics_id_seq', 76, true);
          public          postgres    false    266            �           0    0    startapp_ratecomment_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.startapp_ratecomment_id_seq', 19, true);
          public          postgres    false    240            �           0    0    startapp_shottypes_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.startapp_shottypes_id_seq', 4, true);
          public          postgres    false    250            �           0    0 #   startapp_shottypesstatistics_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.startapp_shottypesstatistics_id_seq', 38, true);
          public          postgres    false    264            �           0    0    startapp_shotzones_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.startapp_shotzones_id_seq', 3, true);
          public          postgres    false    252            �           0    0 #   startapp_shotzonesstatistics_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.startapp_shotzonesstatistics_id_seq', 33, true);
          public          postgres    false    262            �           0    0    startapp_situation_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.startapp_situation_id_seq', 5, true);
          public          postgres    false    254            �           0    0 #   startapp_situationstatistics_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.startapp_situationstatistics_id_seq', 46, true);
          public          postgres    false    260            �           0    0    startapp_totalstatistics_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.startapp_totalstatistics_id_seq', 12, true);
          public          postgres    false    258            �           0    0    startapp_users_groups_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.startapp_users_groups_id_seq', 1, false);
          public          postgres    false    225            �           0    0    startapp_users_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.startapp_users_id_seq', 39, true);
          public          postgres    false    219            �           0    0 &   startapp_users_user_permissions_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.startapp_users_user_permissions_id_seq', 1, false);
          public          postgres    false    227            �           0    0    startapp_userssub_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.startapp_userssub_id_seq', 53, true);
          public          postgres    false    236            �           0    0    startapp_years_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.startapp_years_id_seq', 1, true);
          public          postgres    false    256            /           2606    16626    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    216            4           2606    16612 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    218    218            7           2606    16601 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    218            1           2606    16592    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    216            *           2606    16603 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    214    214            ,           2606    16585 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    214            V           2606    16731 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    230            %           2606    16578 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    212    212            '           2606    16576 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    212            #           2606    16569 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    210            Z           2606    16750 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    231            C           2606    16651 (   startapp_articles startapp_articles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.startapp_articles
    ADD CONSTRAINT startapp_articles_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.startapp_articles DROP CONSTRAINT startapp_articles_pkey;
       public            postgres    false    222            `           2606    16794 2   startapp_articleslikes startapp_articleslikes_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.startapp_articleslikes
    ADD CONSTRAINT startapp_articleslikes_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.startapp_articleslikes DROP CONSTRAINT startapp_articleslikes_pkey;
       public            postgres    false    235            E           2606    16658 8   startapp_articlesrelation startapp_articlesrelation_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.startapp_articlesrelation
    ADD CONSTRAINT startapp_articlesrelation_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.startapp_articlesrelation DROP CONSTRAINT startapp_articlesrelation_pkey;
       public            postgres    false    224            q           2606    123074 0   startapp_blacklistjwt startapp_blacklistjwt_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.startapp_blacklistjwt
    ADD CONSTRAINT startapp_blacklistjwt_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.startapp_blacklistjwt DROP CONSTRAINT startapp_blacklistjwt_pkey;
       public            postgres    false    243            ]           2606    16776 8   startapp_categoryarticles startapp_categoryarticles_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.startapp_categoryarticles
    ADD CONSTRAINT startapp_categoryarticles_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.startapp_categoryarticles DROP CONSTRAINT startapp_categoryarticles_pkey;
       public            postgres    false    233            t           2606    145875     startapp_club startapp_club_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.startapp_club
    ADD CONSTRAINT startapp_club_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.startapp_club DROP CONSTRAINT startapp_club_pkey;
       public            postgres    false    245            h           2606    50910 4   startapp_commentarticle startapp_commentarticle_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.startapp_commentarticle
    ADD CONSTRAINT startapp_commentarticle_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.startapp_commentarticle DROP CONSTRAINT startapp_commentarticle_pkey;
       public            postgres    false    239            �           2606    154416 &   startapp_matches startapp_matches_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.startapp_matches
    ADD CONSTRAINT startapp_matches_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.startapp_matches DROP CONSTRAINT startapp_matches_pkey;
       public            postgres    false    271            �           2606    162608 >   startapp_matchesplayersstats startapp_matchesplayersstats_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.startapp_matchesplayersstats
    ADD CONSTRAINT startapp_matchesplayersstats_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.startapp_matchesplayersstats DROP CONSTRAINT startapp_matchesplayersstats_pkey;
       public            postgres    false    273            �           2606    162615 0   startapp_matchesstats startapp_matchesstats_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.startapp_matchesstats
    ADD CONSTRAINT startapp_matchesstats_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.startapp_matchesstats DROP CONSTRAINT startapp_matchesstats_pkey;
       public            postgres    false    275            x           2606    145882 &   startapp_players startapp_players_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.startapp_players
    ADD CONSTRAINT startapp_players_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.startapp_players DROP CONSTRAINT startapp_players_pkey;
       public            postgres    false    247            z           2606    145889 (   startapp_position startapp_position_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.startapp_position
    ADD CONSTRAINT startapp_position_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.startapp_position DROP CONSTRAINT startapp_position_pkey;
       public            postgres    false    249            �           2606    145959 @   startapp_positionchampionship startapp_positionchampionship_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.startapp_positionchampionship
    ADD CONSTRAINT startapp_positionchampionship_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.startapp_positionchampionship DROP CONSTRAINT startapp_positionchampionship_pkey;
       public            postgres    false    269            �           2606    145952 <   startapp_positionstatistics startapp_positionstatistics_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.startapp_positionstatistics
    ADD CONSTRAINT startapp_positionstatistics_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.startapp_positionstatistics DROP CONSTRAINT startapp_positionstatistics_pkey;
       public            postgres    false    267            n           2606    50917 .   startapp_ratecomment startapp_ratecomment_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.startapp_ratecomment
    ADD CONSTRAINT startapp_ratecomment_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.startapp_ratecomment DROP CONSTRAINT startapp_ratecomment_pkey;
       public            postgres    false    241            |           2606    145896 *   startapp_shottypes startapp_shottypes_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.startapp_shottypes
    ADD CONSTRAINT startapp_shottypes_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.startapp_shottypes DROP CONSTRAINT startapp_shottypes_pkey;
       public            postgres    false    251            �           2606    145945 >   startapp_shottypesstatistics startapp_shottypesstatistics_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.startapp_shottypesstatistics
    ADD CONSTRAINT startapp_shottypesstatistics_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.startapp_shottypesstatistics DROP CONSTRAINT startapp_shottypesstatistics_pkey;
       public            postgres    false    265            ~           2606    145903 *   startapp_shotzones startapp_shotzones_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.startapp_shotzones
    ADD CONSTRAINT startapp_shotzones_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.startapp_shotzones DROP CONSTRAINT startapp_shotzones_pkey;
       public            postgres    false    253            �           2606    145938 >   startapp_shotzonesstatistics startapp_shotzonesstatistics_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.startapp_shotzonesstatistics
    ADD CONSTRAINT startapp_shotzonesstatistics_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.startapp_shotzonesstatistics DROP CONSTRAINT startapp_shotzonesstatistics_pkey;
       public            postgres    false    263            �           2606    145910 *   startapp_situation startapp_situation_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.startapp_situation
    ADD CONSTRAINT startapp_situation_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.startapp_situation DROP CONSTRAINT startapp_situation_pkey;
       public            postgres    false    255            �           2606    145931 >   startapp_situationstatistics startapp_situationstatistics_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.startapp_situationstatistics
    ADD CONSTRAINT startapp_situationstatistics_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.startapp_situationstatistics DROP CONSTRAINT startapp_situationstatistics_pkey;
       public            postgres    false    261            �           2606    145924 6   startapp_totalstatistics startapp_totalstatistics_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.startapp_totalstatistics
    ADD CONSTRAINT startapp_totalstatistics_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.startapp_totalstatistics DROP CONSTRAINT startapp_totalstatistics_pkey;
       public            postgres    false    259            :           2606    16640 '   startapp_users startapp_users_email_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.startapp_users
    ADD CONSTRAINT startapp_users_email_key UNIQUE (email);
 Q   ALTER TABLE ONLY public.startapp_users DROP CONSTRAINT startapp_users_email_key;
       public            postgres    false    220            J           2606    16665 0   startapp_users_groups startapp_users_groups_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.startapp_users_groups
    ADD CONSTRAINT startapp_users_groups_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.startapp_users_groups DROP CONSTRAINT startapp_users_groups_pkey;
       public            postgres    false    226            M           2606    16695 K   startapp_users_groups startapp_users_groups_users_id_group_id_a0384001_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.startapp_users_groups
    ADD CONSTRAINT startapp_users_groups_users_id_group_id_a0384001_uniq UNIQUE (users_id, group_id);
 u   ALTER TABLE ONLY public.startapp_users_groups DROP CONSTRAINT startapp_users_groups_users_id_group_id_a0384001_uniq;
       public            postgres    false    226    226            <           2606    16636 "   startapp_users startapp_users_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.startapp_users
    ADD CONSTRAINT startapp_users_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.startapp_users DROP CONSTRAINT startapp_users_pkey;
       public            postgres    false    220            O           2606    16709 ]   startapp_users_user_permissions startapp_users_user_perm_users_id_permission_id_6eb2d0c7_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.startapp_users_user_permissions
    ADD CONSTRAINT startapp_users_user_perm_users_id_permission_id_6eb2d0c7_uniq UNIQUE (users_id, permission_id);
 �   ALTER TABLE ONLY public.startapp_users_user_permissions DROP CONSTRAINT startapp_users_user_perm_users_id_permission_id_6eb2d0c7_uniq;
       public            postgres    false    228    228            R           2606    16672 D   startapp_users_user_permissions startapp_users_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.startapp_users_user_permissions
    ADD CONSTRAINT startapp_users_user_permissions_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.startapp_users_user_permissions DROP CONSTRAINT startapp_users_user_permissions_pkey;
       public            postgres    false    228            ?           2606    16754 *   startapp_users startapp_users_username_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.startapp_users
    ADD CONSTRAINT startapp_users_username_key UNIQUE (username);
 T   ALTER TABLE ONLY public.startapp_users DROP CONSTRAINT startapp_users_username_key;
       public            postgres    false    220            c           2606    37888 (   startapp_userssub startapp_userssub_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.startapp_userssub
    ADD CONSTRAINT startapp_userssub_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.startapp_userssub DROP CONSTRAINT startapp_userssub_pkey;
       public            postgres    false    237            �           2606    145917 "   startapp_years startapp_years_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.startapp_years
    ADD CONSTRAINT startapp_years_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.startapp_years DROP CONSTRAINT startapp_years_pkey;
       public            postgres    false    257            -           1259    16627    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    216            2           1259    16623 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    218            5           1259    16624 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    218            (           1259    16609 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    214            T           1259    16742 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    230            W           1259    16743 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    230            X           1259    16752 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    231            [           1259    16751 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    231            @           1259    16681 $   startapp_articles_author_id_3fb76f2e    INDEX     g   CREATE INDEX startapp_articles_author_id_3fb76f2e ON public.startapp_articles USING btree (author_id);
 8   DROP INDEX public.startapp_articles_author_id_3fb76f2e;
       public            postgres    false    222            A           1259    16787 !   startapp_articles_cat_id_d841356a    INDEX     a   CREATE INDEX startapp_articles_cat_id_d841356a ON public.startapp_articles USING btree (cat_id);
 5   DROP INDEX public.startapp_articles_cat_id_d841356a;
       public            postgres    false    222            ^           1259    16805 *   startapp_articleslikes_article_id_e3a1454a    INDEX     s   CREATE INDEX startapp_articleslikes_article_id_e3a1454a ON public.startapp_articleslikes USING btree (article_id);
 >   DROP INDEX public.startapp_articleslikes_article_id_e3a1454a;
       public            postgres    false    235            a           1259    16806 '   startapp_articleslikes_user_id_149b3d60    INDEX     m   CREATE INDEX startapp_articleslikes_user_id_149b3d60 ON public.startapp_articleslikes USING btree (user_id);
 ;   DROP INDEX public.startapp_articleslikes_user_id_149b3d60;
       public            postgres    false    235            F           1259    16692 *   startapp_articlesrelation_user_id_11023fea    INDEX     s   CREATE INDEX startapp_articlesrelation_user_id_11023fea ON public.startapp_articlesrelation USING btree (user_id);
 >   DROP INDEX public.startapp_articlesrelation_user_id_11023fea;
       public            postgres    false    224            G           1259    16693 +   startapp_articlesrelation_women_id_c3ef6c05    INDEX     w   CREATE INDEX startapp_articlesrelation_women_id_c3ef6c05 ON public.startapp_articlesrelation USING btree (article_id);
 ?   DROP INDEX public.startapp_articlesrelation_women_id_c3ef6c05;
       public            postgres    false    224            r           1259    123080 &   startapp_blacklistjwt_user_id_91d625f2    INDEX     k   CREATE INDEX startapp_blacklistjwt_user_id_91d625f2 ON public.startapp_blacklistjwt USING btree (user_id);
 :   DROP INDEX public.startapp_blacklistjwt_user_id_91d625f2;
       public            postgres    false    243            f           1259    50928 +   startapp_commentarticle_article_id_ca81fbcd    INDEX     u   CREATE INDEX startapp_commentarticle_article_id_ca81fbcd ON public.startapp_commentarticle USING btree (article_id);
 ?   DROP INDEX public.startapp_commentarticle_article_id_ca81fbcd;
       public            postgres    false    239            i           1259    50958 /   startapp_commentarticle_reply_first_id_f110d48d    INDEX     }   CREATE INDEX startapp_commentarticle_reply_first_id_f110d48d ON public.startapp_commentarticle USING btree (reply_first_id);
 C   DROP INDEX public.startapp_commentarticle_reply_first_id_f110d48d;
       public            postgres    false    239            j           1259    50959 0   startapp_commentarticle_reply_second_id_20ea8d76    INDEX        CREATE INDEX startapp_commentarticle_reply_second_id_20ea8d76 ON public.startapp_commentarticle USING btree (reply_second_id);
 D   DROP INDEX public.startapp_commentarticle_reply_second_id_20ea8d76;
       public            postgres    false    239            k           1259    50941 (   startapp_commentarticle_user_id_0928da17    INDEX     o   CREATE INDEX startapp_commentarticle_user_id_0928da17 ON public.startapp_commentarticle USING btree (user_id);
 <   DROP INDEX public.startapp_commentarticle_user_id_0928da17;
       public            postgres    false    239            �           1259    154427 '   startapp_matches_guest_team_id_aae4aef2    INDEX     m   CREATE INDEX startapp_matches_guest_team_id_aae4aef2 ON public.startapp_matches USING btree (guest_team_id);
 ;   DROP INDEX public.startapp_matches_guest_team_id_aae4aef2;
       public            postgres    false    271            �           1259    154428 &   startapp_matches_home_team_id_882bdfdd    INDEX     k   CREATE INDEX startapp_matches_home_team_id_882bdfdd ON public.startapp_matches USING btree (home_team_id);
 :   DROP INDEX public.startapp_matches_home_team_id_882bdfdd;
       public            postgres    false    271            �           1259    162645 (   startapp_matches_total_stats_id_899b4fb9    INDEX     o   CREATE INDEX startapp_matches_total_stats_id_899b4fb9 ON public.startapp_matches USING btree (total_stats_id);
 <   DROP INDEX public.startapp_matches_total_stats_id_899b4fb9;
       public            postgres    false    271            �           1259    162641 !   startapp_matches_year_id_8e0c57e1    INDEX     a   CREATE INDEX startapp_matches_year_id_8e0c57e1 ON public.startapp_matches USING btree (year_id);
 5   DROP INDEX public.startapp_matches_year_id_8e0c57e1;
       public            postgres    false    271            �           1259    162642 .   startapp_matchesplayersstats_match_id_2bb1c3af    INDEX     {   CREATE INDEX startapp_matchesplayersstats_match_id_2bb1c3af ON public.startapp_matchesplayersstats USING btree (match_id);
 B   DROP INDEX public.startapp_matchesplayersstats_match_id_2bb1c3af;
       public            postgres    false    273            �           1259    162643 /   startapp_matchesplayersstats_player_id_81fa644c    INDEX     }   CREATE INDEX startapp_matchesplayersstats_player_id_81fa644c ON public.startapp_matchesplayersstats USING btree (player_id);
 C   DROP INDEX public.startapp_matchesplayersstats_player_id_81fa644c;
       public            postgres    false    273            �           1259    162644 1   startapp_matchesplayersstats_position_id_003f782a    INDEX     �   CREATE INDEX startapp_matchesplayersstats_position_id_003f782a ON public.startapp_matchesplayersstats USING btree (position_id);
 E   DROP INDEX public.startapp_matchesplayersstats_position_id_003f782a;
       public            postgres    false    273            u           1259    145970 !   startapp_players_club_id_4351b1fd    INDEX     a   CREATE INDEX startapp_players_club_id_4351b1fd ON public.startapp_players USING btree (club_id);
 5   DROP INDEX public.startapp_players_club_id_4351b1fd;
       public            postgres    false    247            v           1259    146049 *   startapp_players_main_position_id_f3b9355a    INDEX     s   CREATE INDEX startapp_players_main_position_id_f3b9355a ON public.startapp_players USING btree (main_position_id);
 >   DROP INDEX public.startapp_players_main_position_id_f3b9355a;
       public            postgres    false    247            �           1259    146047 .   startapp_positionchampionship_club_id_bd49ceae    INDEX     {   CREATE INDEX startapp_positionchampionship_club_id_bd49ceae ON public.startapp_positionchampionship USING btree (club_id);
 B   DROP INDEX public.startapp_positionchampionship_club_id_bd49ceae;
       public            postgres    false    269            �           1259    146048 .   startapp_positionchampionship_year_id_b2d0d85e    INDEX     {   CREATE INDEX startapp_positionchampionship_year_id_b2d0d85e ON public.startapp_positionchampionship USING btree (year_id);
 B   DROP INDEX public.startapp_positionchampionship_year_id_b2d0d85e;
       public            postgres    false    269            �           1259    146035 .   startapp_positionstatistics_player_id_2b8c8911    INDEX     {   CREATE INDEX startapp_positionstatistics_player_id_2b8c8911 ON public.startapp_positionstatistics USING btree (player_id);
 B   DROP INDEX public.startapp_positionstatistics_player_id_2b8c8911;
       public            postgres    false    267            �           1259    146036 0   startapp_positionstatistics_position_id_9ea8a908    INDEX        CREATE INDEX startapp_positionstatistics_position_id_9ea8a908 ON public.startapp_positionstatistics USING btree (position_id);
 D   DROP INDEX public.startapp_positionstatistics_position_id_9ea8a908;
       public            postgres    false    267            l           1259    50939 (   startapp_ratecomment_comment_id_00021aa4    INDEX     o   CREATE INDEX startapp_ratecomment_comment_id_00021aa4 ON public.startapp_ratecomment USING btree (comment_id);
 <   DROP INDEX public.startapp_ratecomment_comment_id_00021aa4;
       public            postgres    false    241            o           1259    50940 %   startapp_ratecomment_user_id_12770491    INDEX     i   CREATE INDEX startapp_ratecomment_user_id_12770491 ON public.startapp_ratecomment USING btree (user_id);
 9   DROP INDEX public.startapp_ratecomment_user_id_12770491;
       public            postgres    false    241            �           1259    146023 /   startapp_shottypesstatistics_player_id_ed5d4e9c    INDEX     }   CREATE INDEX startapp_shottypesstatistics_player_id_ed5d4e9c ON public.startapp_shottypesstatistics USING btree (player_id);
 C   DROP INDEX public.startapp_shottypesstatistics_player_id_ed5d4e9c;
       public            postgres    false    265            �           1259    146024 3   startapp_shottypesstatistics_shot_types_id_ce5670e0    INDEX     �   CREATE INDEX startapp_shottypesstatistics_shot_types_id_ce5670e0 ON public.startapp_shottypesstatistics USING btree (shot_types_id);
 G   DROP INDEX public.startapp_shottypesstatistics_shot_types_id_ce5670e0;
       public            postgres    false    265            �           1259    146011 /   startapp_shotzonesstatistics_player_id_1fe5887e    INDEX     }   CREATE INDEX startapp_shotzonesstatistics_player_id_1fe5887e ON public.startapp_shotzonesstatistics USING btree (player_id);
 C   DROP INDEX public.startapp_shotzonesstatistics_player_id_1fe5887e;
       public            postgres    false    263            �           1259    146012 3   startapp_shotzonesstatistics_shot_zones_id_1f07e81f    INDEX     �   CREATE INDEX startapp_shotzonesstatistics_shot_zones_id_1f07e81f ON public.startapp_shotzonesstatistics USING btree (shot_zones_id);
 G   DROP INDEX public.startapp_shotzonesstatistics_shot_zones_id_1f07e81f;
       public            postgres    false    263            �           1259    145999 /   startapp_situationstatistics_player_id_ed639362    INDEX     }   CREATE INDEX startapp_situationstatistics_player_id_ed639362 ON public.startapp_situationstatistics USING btree (player_id);
 C   DROP INDEX public.startapp_situationstatistics_player_id_ed639362;
       public            postgres    false    261            �           1259    146000 2   startapp_situationstatistics_situation_id_ee463cff    INDEX     �   CREATE INDEX startapp_situationstatistics_situation_id_ee463cff ON public.startapp_situationstatistics USING btree (situation_id);
 F   DROP INDEX public.startapp_situationstatistics_situation_id_ee463cff;
       public            postgres    false    261            �           1259    145986 )   startapp_totalstatistics_club_id_e0995b5c    INDEX     q   CREATE INDEX startapp_totalstatistics_club_id_e0995b5c ON public.startapp_totalstatistics USING btree (club_id);
 =   DROP INDEX public.startapp_totalstatistics_club_id_e0995b5c;
       public            postgres    false    259            �           1259    145987 +   startapp_totalstatistics_player_id_f0ab837d    INDEX     u   CREATE INDEX startapp_totalstatistics_player_id_f0ab837d ON public.startapp_totalstatistics USING btree (player_id);
 ?   DROP INDEX public.startapp_totalstatistics_player_id_f0ab837d;
       public            postgres    false    259            �           1259    145988 )   startapp_totalstatistics_year_id_f8980e5f    INDEX     q   CREATE INDEX startapp_totalstatistics_year_id_f8980e5f ON public.startapp_totalstatistics USING btree (year_id);
 =   DROP INDEX public.startapp_totalstatistics_year_id_f8980e5f;
       public            postgres    false    259            8           1259    16674 "   startapp_users_email_cc9e304a_like    INDEX     r   CREATE INDEX startapp_users_email_cc9e304a_like ON public.startapp_users USING btree (email varchar_pattern_ops);
 6   DROP INDEX public.startapp_users_email_cc9e304a_like;
       public            postgres    false    220            H           1259    16707 '   startapp_users_groups_group_id_cfe1026a    INDEX     m   CREATE INDEX startapp_users_groups_group_id_cfe1026a ON public.startapp_users_groups USING btree (group_id);
 ;   DROP INDEX public.startapp_users_groups_group_id_cfe1026a;
       public            postgres    false    226            K           1259    16706 '   startapp_users_groups_users_id_e56f5163    INDEX     m   CREATE INDEX startapp_users_groups_users_id_e56f5163 ON public.startapp_users_groups USING btree (users_id);
 ;   DROP INDEX public.startapp_users_groups_users_id_e56f5163;
       public            postgres    false    226            P           1259    16721 6   startapp_users_user_permissions_permission_id_95394df2    INDEX     �   CREATE INDEX startapp_users_user_permissions_permission_id_95394df2 ON public.startapp_users_user_permissions USING btree (permission_id);
 J   DROP INDEX public.startapp_users_user_permissions_permission_id_95394df2;
       public            postgres    false    228            S           1259    16720 1   startapp_users_user_permissions_users_id_d1f930bc    INDEX     �   CREATE INDEX startapp_users_user_permissions_users_id_d1f930bc ON public.startapp_users_user_permissions USING btree (users_id);
 E   DROP INDEX public.startapp_users_user_permissions_users_id_d1f930bc;
       public            postgres    false    228            =           1259    16755 %   startapp_users_username_d4a85d32_like    INDEX     x   CREATE INDEX startapp_users_username_d4a85d32_like ON public.startapp_users USING btree (username varchar_pattern_ops);
 9   DROP INDEX public.startapp_users_username_d4a85d32_like;
       public            postgres    false    220            d           1259    37899 *   startapp_userssub_subscription_id_591ca38c    INDEX     s   CREATE INDEX startapp_userssub_subscription_id_591ca38c ON public.startapp_userssub USING btree (subscription_id);
 >   DROP INDEX public.startapp_userssub_subscription_id_591ca38c;
       public            postgres    false    237            e           1259    37900 "   startapp_userssub_user_id_5f91a614    INDEX     c   CREATE INDEX startapp_userssub_user_id_5f91a614 ON public.startapp_userssub USING btree (user_id);
 6   DROP INDEX public.startapp_userssub_user_id_5f91a614;
       public            postgres    false    237            �           2606    16618 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    3372    218    214            �           2606    16613 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    216    218    3377            �           2606    16604 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    214    212    3367            �           2606    16732 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    230    3367    212            �           2606    16737 G   django_admin_log django_admin_log_user_id_c564eba6_fk_startapp_users_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_startapp_users_id FOREIGN KEY (user_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_startapp_users_id;
       public          postgres    false    230    3388    220            �           2606    16676 K   startapp_articles startapp_articles_author_id_3fb76f2e_fk_startapp_users_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_articles
    ADD CONSTRAINT startapp_articles_author_id_3fb76f2e_fk_startapp_users_id FOREIGN KEY (author_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.startapp_articles DROP CONSTRAINT startapp_articles_author_id_3fb76f2e_fk_startapp_users_id;
       public          postgres    false    3388    220    222            �           2606    16782 @   startapp_articles startapp_articles_cat_id_d841356a_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_articles
    ADD CONSTRAINT startapp_articles_cat_id_d841356a_fk_startapp_ FOREIGN KEY (cat_id) REFERENCES public.startapp_categoryarticles(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.startapp_articles DROP CONSTRAINT startapp_articles_cat_id_d841356a_fk_startapp_;
       public          postgres    false    233    222    3421            �           2606    16800 L   startapp_articleslikes startapp_articleslik_article_id_e3a1454a_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_articleslikes
    ADD CONSTRAINT startapp_articleslik_article_id_e3a1454a_fk_startapp_ FOREIGN KEY (article_id) REFERENCES public.startapp_articles(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.startapp_articleslikes DROP CONSTRAINT startapp_articleslik_article_id_e3a1454a_fk_startapp_;
       public          postgres    false    222    235    3395            �           2606    16795 S   startapp_articleslikes startapp_articleslikes_user_id_149b3d60_fk_startapp_users_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_articleslikes
    ADD CONSTRAINT startapp_articleslikes_user_id_149b3d60_fk_startapp_users_id FOREIGN KEY (user_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.startapp_articleslikes DROP CONSTRAINT startapp_articleslikes_user_id_149b3d60_fk_startapp_users_id;
       public          postgres    false    220    235    3388            �           2606    16777 O   startapp_articlesrelation startapp_articlesrel_article_id_527e9083_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_articlesrelation
    ADD CONSTRAINT startapp_articlesrel_article_id_527e9083_fk_startapp_ FOREIGN KEY (article_id) REFERENCES public.startapp_articles(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.startapp_articlesrelation DROP CONSTRAINT startapp_articlesrel_article_id_527e9083_fk_startapp_;
       public          postgres    false    224    222    3395            �           2606    16682 Y   startapp_articlesrelation startapp_articlesrelation_user_id_11023fea_fk_startapp_users_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_articlesrelation
    ADD CONSTRAINT startapp_articlesrelation_user_id_11023fea_fk_startapp_users_id FOREIGN KEY (user_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.startapp_articlesrelation DROP CONSTRAINT startapp_articlesrelation_user_id_11023fea_fk_startapp_users_id;
       public          postgres    false    3388    224    220            �           2606    123075 Q   startapp_blacklistjwt startapp_blacklistjwt_user_id_91d625f2_fk_startapp_users_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_blacklistjwt
    ADD CONSTRAINT startapp_blacklistjwt_user_id_91d625f2_fk_startapp_users_id FOREIGN KEY (user_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.startapp_blacklistjwt DROP CONSTRAINT startapp_blacklistjwt_user_id_91d625f2_fk_startapp_users_id;
       public          postgres    false    220    243    3388            �           2606    50923 M   startapp_commentarticle startapp_commentarti_article_id_ca81fbcd_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_commentarticle
    ADD CONSTRAINT startapp_commentarti_article_id_ca81fbcd_fk_startapp_ FOREIGN KEY (article_id) REFERENCES public.startapp_articles(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.startapp_commentarticle DROP CONSTRAINT startapp_commentarti_article_id_ca81fbcd_fk_startapp_;
       public          postgres    false    239    3395    222            �           2606    50948 Q   startapp_commentarticle startapp_commentarti_reply_first_id_f110d48d_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_commentarticle
    ADD CONSTRAINT startapp_commentarti_reply_first_id_f110d48d_fk_startapp_ FOREIGN KEY (reply_first_id) REFERENCES public.startapp_commentarticle(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.startapp_commentarticle DROP CONSTRAINT startapp_commentarti_reply_first_id_f110d48d_fk_startapp_;
       public          postgres    false    239    3432    239            �           2606    50953 R   startapp_commentarticle startapp_commentarti_reply_second_id_20ea8d76_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_commentarticle
    ADD CONSTRAINT startapp_commentarti_reply_second_id_20ea8d76_fk_startapp_ FOREIGN KEY (reply_second_id) REFERENCES public.startapp_commentarticle(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.startapp_commentarticle DROP CONSTRAINT startapp_commentarti_reply_second_id_20ea8d76_fk_startapp_;
       public          postgres    false    239    239    3432            �           2606    50918 U   startapp_commentarticle startapp_commentarticle_user_id_0928da17_fk_startapp_users_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_commentarticle
    ADD CONSTRAINT startapp_commentarticle_user_id_0928da17_fk_startapp_users_id FOREIGN KEY (user_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.startapp_commentarticle DROP CONSTRAINT startapp_commentarticle_user_id_0928da17_fk_startapp_users_id;
       public          postgres    false    220    3388    239            �           2606    154417 L   startapp_matches startapp_matches_guest_team_id_aae4aef2_fk_startapp_club_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_matches
    ADD CONSTRAINT startapp_matches_guest_team_id_aae4aef2_fk_startapp_club_id FOREIGN KEY (guest_team_id) REFERENCES public.startapp_club(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.startapp_matches DROP CONSTRAINT startapp_matches_guest_team_id_aae4aef2_fk_startapp_club_id;
       public          postgres    false    3444    271    245            �           2606    154422 K   startapp_matches startapp_matches_home_team_id_882bdfdd_fk_startapp_club_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_matches
    ADD CONSTRAINT startapp_matches_home_team_id_882bdfdd_fk_startapp_club_id FOREIGN KEY (home_team_id) REFERENCES public.startapp_club(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.startapp_matches DROP CONSTRAINT startapp_matches_home_team_id_882bdfdd_fk_startapp_club_id;
       public          postgres    false    271    245    3444            �           2606    162636 F   startapp_matches startapp_matches_total_stats_id_899b4fb9_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_matches
    ADD CONSTRAINT startapp_matches_total_stats_id_899b4fb9_fk_startapp_ FOREIGN KEY (total_stats_id) REFERENCES public.startapp_matchesstats(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.startapp_matches DROP CONSTRAINT startapp_matches_total_stats_id_899b4fb9_fk_startapp_;
       public          postgres    false    271    275    3496            �           2606    162616 G   startapp_matches startapp_matches_year_id_8e0c57e1_fk_startapp_years_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_matches
    ADD CONSTRAINT startapp_matches_year_id_8e0c57e1_fk_startapp_years_id FOREIGN KEY (year_id) REFERENCES public.startapp_years(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.startapp_matches DROP CONSTRAINT startapp_matches_year_id_8e0c57e1_fk_startapp_years_id;
       public          postgres    false    257    271    3458            �           2606    162621 P   startapp_matchesplayersstats startapp_matchesplay_match_id_2bb1c3af_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_matchesplayersstats
    ADD CONSTRAINT startapp_matchesplay_match_id_2bb1c3af_fk_startapp_ FOREIGN KEY (match_id) REFERENCES public.startapp_matches(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.startapp_matchesplayersstats DROP CONSTRAINT startapp_matchesplay_match_id_2bb1c3af_fk_startapp_;
       public          postgres    false    271    3487    273            �           2606    162626 Q   startapp_matchesplayersstats startapp_matchesplay_player_id_81fa644c_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_matchesplayersstats
    ADD CONSTRAINT startapp_matchesplay_player_id_81fa644c_fk_startapp_ FOREIGN KEY (player_id) REFERENCES public.startapp_players(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.startapp_matchesplayersstats DROP CONSTRAINT startapp_matchesplay_player_id_81fa644c_fk_startapp_;
       public          postgres    false    247    3448    273            �           2606    162631 S   startapp_matchesplayersstats startapp_matchesplay_position_id_003f782a_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_matchesplayersstats
    ADD CONSTRAINT startapp_matchesplay_position_id_003f782a_fk_startapp_ FOREIGN KEY (position_id) REFERENCES public.startapp_position(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.startapp_matchesplayersstats DROP CONSTRAINT startapp_matchesplay_position_id_003f782a_fk_startapp_;
       public          postgres    false    249    273    3450            �           2606    145965 F   startapp_players startapp_players_club_id_4351b1fd_fk_startapp_club_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_players
    ADD CONSTRAINT startapp_players_club_id_4351b1fd_fk_startapp_club_id FOREIGN KEY (club_id) REFERENCES public.startapp_club(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.startapp_players DROP CONSTRAINT startapp_players_club_id_4351b1fd_fk_startapp_club_id;
       public          postgres    false    245    3444    247            �           2606    145960 H   startapp_players startapp_players_main_position_id_f3b9355a_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_players
    ADD CONSTRAINT startapp_players_main_position_id_f3b9355a_fk_startapp_ FOREIGN KEY (main_position_id) REFERENCES public.startapp_position(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.startapp_players DROP CONSTRAINT startapp_players_main_position_id_f3b9355a_fk_startapp_;
       public          postgres    false    249    3450    247            �           2606    146037 P   startapp_positionchampionship startapp_positioncha_club_id_bd49ceae_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_positionchampionship
    ADD CONSTRAINT startapp_positioncha_club_id_bd49ceae_fk_startapp_ FOREIGN KEY (club_id) REFERENCES public.startapp_club(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.startapp_positionchampionship DROP CONSTRAINT startapp_positioncha_club_id_bd49ceae_fk_startapp_;
       public          postgres    false    245    3444    269            �           2606    146042 P   startapp_positionchampionship startapp_positioncha_year_id_b2d0d85e_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_positionchampionship
    ADD CONSTRAINT startapp_positioncha_year_id_b2d0d85e_fk_startapp_ FOREIGN KEY (year_id) REFERENCES public.startapp_years(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.startapp_positionchampionship DROP CONSTRAINT startapp_positioncha_year_id_b2d0d85e_fk_startapp_;
       public          postgres    false    3458    257    269            �           2606    146025 P   startapp_positionstatistics startapp_positionsta_player_id_2b8c8911_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_positionstatistics
    ADD CONSTRAINT startapp_positionsta_player_id_2b8c8911_fk_startapp_ FOREIGN KEY (player_id) REFERENCES public.startapp_players(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.startapp_positionstatistics DROP CONSTRAINT startapp_positionsta_player_id_2b8c8911_fk_startapp_;
       public          postgres    false    267    247    3448            �           2606    146030 R   startapp_positionstatistics startapp_positionsta_position_id_9ea8a908_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_positionstatistics
    ADD CONSTRAINT startapp_positionsta_position_id_9ea8a908_fk_startapp_ FOREIGN KEY (position_id) REFERENCES public.startapp_position(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.startapp_positionstatistics DROP CONSTRAINT startapp_positionsta_position_id_9ea8a908_fk_startapp_;
       public          postgres    false    249    267    3450            �           2606    50929 J   startapp_ratecomment startapp_ratecomment_comment_id_00021aa4_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_ratecomment
    ADD CONSTRAINT startapp_ratecomment_comment_id_00021aa4_fk_startapp_ FOREIGN KEY (comment_id) REFERENCES public.startapp_commentarticle(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.startapp_ratecomment DROP CONSTRAINT startapp_ratecomment_comment_id_00021aa4_fk_startapp_;
       public          postgres    false    3432    241    239            �           2606    50934 O   startapp_ratecomment startapp_ratecomment_user_id_12770491_fk_startapp_users_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_ratecomment
    ADD CONSTRAINT startapp_ratecomment_user_id_12770491_fk_startapp_users_id FOREIGN KEY (user_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.startapp_ratecomment DROP CONSTRAINT startapp_ratecomment_user_id_12770491_fk_startapp_users_id;
       public          postgres    false    220    3388    241            �           2606    146013 Q   startapp_shottypesstatistics startapp_shottypesst_player_id_ed5d4e9c_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_shottypesstatistics
    ADD CONSTRAINT startapp_shottypesst_player_id_ed5d4e9c_fk_startapp_ FOREIGN KEY (player_id) REFERENCES public.startapp_players(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.startapp_shottypesstatistics DROP CONSTRAINT startapp_shottypesst_player_id_ed5d4e9c_fk_startapp_;
       public          postgres    false    3448    247    265            �           2606    146018 U   startapp_shottypesstatistics startapp_shottypesst_shot_types_id_ce5670e0_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_shottypesstatistics
    ADD CONSTRAINT startapp_shottypesst_shot_types_id_ce5670e0_fk_startapp_ FOREIGN KEY (shot_types_id) REFERENCES public.startapp_shottypes(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.startapp_shottypesstatistics DROP CONSTRAINT startapp_shottypesst_shot_types_id_ce5670e0_fk_startapp_;
       public          postgres    false    265    3452    251            �           2606    146001 Q   startapp_shotzonesstatistics startapp_shotzonesst_player_id_1fe5887e_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_shotzonesstatistics
    ADD CONSTRAINT startapp_shotzonesst_player_id_1fe5887e_fk_startapp_ FOREIGN KEY (player_id) REFERENCES public.startapp_players(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.startapp_shotzonesstatistics DROP CONSTRAINT startapp_shotzonesst_player_id_1fe5887e_fk_startapp_;
       public          postgres    false    3448    263    247            �           2606    146006 U   startapp_shotzonesstatistics startapp_shotzonesst_shot_zones_id_1f07e81f_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_shotzonesstatistics
    ADD CONSTRAINT startapp_shotzonesst_shot_zones_id_1f07e81f_fk_startapp_ FOREIGN KEY (shot_zones_id) REFERENCES public.startapp_shotzones(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.startapp_shotzonesstatistics DROP CONSTRAINT startapp_shotzonesst_shot_zones_id_1f07e81f_fk_startapp_;
       public          postgres    false    263    253    3454            �           2606    145989 Q   startapp_situationstatistics startapp_situationst_player_id_ed639362_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_situationstatistics
    ADD CONSTRAINT startapp_situationst_player_id_ed639362_fk_startapp_ FOREIGN KEY (player_id) REFERENCES public.startapp_players(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.startapp_situationstatistics DROP CONSTRAINT startapp_situationst_player_id_ed639362_fk_startapp_;
       public          postgres    false    261    247    3448            �           2606    145994 T   startapp_situationstatistics startapp_situationst_situation_id_ee463cff_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_situationstatistics
    ADD CONSTRAINT startapp_situationst_situation_id_ee463cff_fk_startapp_ FOREIGN KEY (situation_id) REFERENCES public.startapp_situation(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.startapp_situationstatistics DROP CONSTRAINT startapp_situationst_situation_id_ee463cff_fk_startapp_;
       public          postgres    false    3456    255    261            �           2606    145976 M   startapp_totalstatistics startapp_totalstatis_player_id_f0ab837d_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_totalstatistics
    ADD CONSTRAINT startapp_totalstatis_player_id_f0ab837d_fk_startapp_ FOREIGN KEY (player_id) REFERENCES public.startapp_players(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.startapp_totalstatistics DROP CONSTRAINT startapp_totalstatis_player_id_f0ab837d_fk_startapp_;
       public          postgres    false    259    3448    247            �           2606    145971 V   startapp_totalstatistics startapp_totalstatistics_club_id_e0995b5c_fk_startapp_club_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_totalstatistics
    ADD CONSTRAINT startapp_totalstatistics_club_id_e0995b5c_fk_startapp_club_id FOREIGN KEY (club_id) REFERENCES public.startapp_club(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.startapp_totalstatistics DROP CONSTRAINT startapp_totalstatistics_club_id_e0995b5c_fk_startapp_club_id;
       public          postgres    false    3444    259    245            �           2606    145981 W   startapp_totalstatistics startapp_totalstatistics_year_id_f8980e5f_fk_startapp_years_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_totalstatistics
    ADD CONSTRAINT startapp_totalstatistics_year_id_f8980e5f_fk_startapp_years_id FOREIGN KEY (year_id) REFERENCES public.startapp_years(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.startapp_totalstatistics DROP CONSTRAINT startapp_totalstatistics_year_id_f8980e5f_fk_startapp_years_id;
       public          postgres    false    3458    259    257            �           2606    16701 N   startapp_users_groups startapp_users_groups_group_id_cfe1026a_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_users_groups
    ADD CONSTRAINT startapp_users_groups_group_id_cfe1026a_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.startapp_users_groups DROP CONSTRAINT startapp_users_groups_group_id_cfe1026a_fk_auth_group_id;
       public          postgres    false    226    216    3377            �           2606    16696 R   startapp_users_groups startapp_users_groups_users_id_e56f5163_fk_startapp_users_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_users_groups
    ADD CONSTRAINT startapp_users_groups_users_id_e56f5163_fk_startapp_users_id FOREIGN KEY (users_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.startapp_users_groups DROP CONSTRAINT startapp_users_groups_users_id_e56f5163_fk_startapp_users_id;
       public          postgres    false    226    220    3388            �           2606    16715 X   startapp_users_user_permissions startapp_users_user__permission_id_95394df2_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_users_user_permissions
    ADD CONSTRAINT startapp_users_user__permission_id_95394df2_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.startapp_users_user_permissions DROP CONSTRAINT startapp_users_user__permission_id_95394df2_fk_auth_perm;
       public          postgres    false    3372    228    214            �           2606    16710 S   startapp_users_user_permissions startapp_users_user__users_id_d1f930bc_fk_startapp_    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_users_user_permissions
    ADD CONSTRAINT startapp_users_user__users_id_d1f930bc_fk_startapp_ FOREIGN KEY (users_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.startapp_users_user_permissions DROP CONSTRAINT startapp_users_user__users_id_d1f930bc_fk_startapp_;
       public          postgres    false    220    228    3388            �           2606    37889 Q   startapp_userssub startapp_userssub_subscription_id_591ca38c_fk_startapp_users_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_userssub
    ADD CONSTRAINT startapp_userssub_subscription_id_591ca38c_fk_startapp_users_id FOREIGN KEY (subscription_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.startapp_userssub DROP CONSTRAINT startapp_userssub_subscription_id_591ca38c_fk_startapp_users_id;
       public          postgres    false    220    237    3388            �           2606    37894 I   startapp_userssub startapp_userssub_user_id_5f91a614_fk_startapp_users_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.startapp_userssub
    ADD CONSTRAINT startapp_userssub_user_id_5f91a614_fk_startapp_users_id FOREIGN KEY (user_id) REFERENCES public.startapp_users(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.startapp_userssub DROP CONSTRAINT startapp_userssub_user_id_5f91a614_fk_startapp_users_id;
       public          postgres    false    3388    237    220            i      x������ � �      k      x������ � �      g   �  x�u�Yr�8D��S�w~�5:��-3lMSK��8ԧo,�(���K8�@$����V/oo�v����|U�2�?ͳ{T�C���}�%�u�ۺ��~(�����_�ف���c}^/�~�ߪ�YKj�� $w��?`� c�dH�qst���>��t��>qsa�|�����B�d% �M����~;̻���c�:g��������
��{�x����f���]���3LOJO�lb�g�f�1ad/`�)YK�s}����qWD���	p�� D�CO����l:��󸜷u�F� <��:��H�3��$�r�9[	�g�sݖþ�	,�a՞$�\�yNJ-y�ʬ��l�b��J*���X���Wz����7�b�YS��D	��Bɳ%�|�
�X��v�m�5�s����m��l�H4�;E�~yQw6+J`�H������W�uʨyV]���:��kDyj�7�)��Y�^m�*�P/v�4���q��-e#v�B;3�&ޜ5h���?���*��8;FC����4�y.�@����<�)տ���������2��ݨ4c��<���Hr��
P�2\*\ȳ;��~��7��'͈P=ޔ@��2�x_�����ߜ	L�<�ǲ��a��n����E��Ӱ ����BH�$�:
!˱$s5���׺<�oe���p�91��ȐIbX8#���|J�~9>����=�X#$�;u8'����gGZ�%�;�?O�8%�q7��˵��ó!�?"	��d�I�U�����J	}l���U�/VzT#��A�Z� ��ƈ�X$�mF}���Fca�{j�f����Wh����7�B'��L�������r�{�>.��i���95�Q*�ٹ�%F�Kd����W, '�3�����������ۛO��Kr���
��i���
M���>��n�ꫦÒ��ɅZ2�Nͽ\���B�<H�-���<�]�jzl�j��n��k�y{�e����$�e�b36`�'��|�m��n?�Iha>|u�t�����a���J꧅L��0B��a�'9�(��z9ͨϲz)ʨ� �6����{��EO�J��E%%R�@�@>�9�	jsg�2r���}Ҝ�2�N�\걂l�^��\k˖�:�xՙ|,ހW�'^y�'��(�R�f�j���4��\�����(��0$��      w      x��]ˎd�q]�����/23"_�#HX0���d�a-�����t��Ac$���Ox�?�ƀ6������*��=E�Cq�{�D�xd\{�s���)��s�Ξ�]|���8�g_�n�x�}������?}����]|r��ӟ����xf�4�;\��,#��W�W��1 h 8��@���~�����6��6,1Y�I������o�ww_﮷�W������ﾽ����q3�Ĵc�!�#.�9 ���~K���Ͷ�w�2!��ϝ_l��ɣYon��f�p�y�����E��ܸ%�3�A)�_�d��Z$��+o5л�����v�+s�~A�g���~�}7��F��s����$7���f{}�,k[ �q��A������jd�ZsH�7��,�p������Zk�K4фr���g?�|��^~]��S�b���V�����ۇ���7�� ����b��O|{��y#����]_����g����}�l�����17��&>�x~�7q�xDo��[I-�'X��Fw��	�,�z��no�v7�����h�pn�BK��3���O�r�p�q��Q�s��hŏ������|s������fu��뫷�￸}�u~����^B�+���ގ.SI�^���w��`{��C�u�.S\��~�?���E~��m��SZ}�[�5p��\V:Qa|�*�q M�(���Z�f����y��P�<@N��]���C�G��{��"��������.=��
K�}>����eI�
�1�n��B�&0�� ��=�G�Y�a�aٗ�D��6��/���ߊ//�/���&�x��l���3z���(�tLrӆs�K C�D݈Etl���߾�޾{7���ebQ� �GW�/���G
Z�X����lvǫz�C�.tX1�v��	���u8qCl7����|y��C�GRڲs���dR�)W���}�?���_��������?��m�����_��%x�{yd��x��,���Hx?j�5�#�
�Q|[E%)�1��7�uM�$'��~IO����7��	\��e�#�v:>�{�QX��n���G ��<�$�X�pd�O�]�w�oVҾ�^��D�u�s w` �
� P�"�o�ڣ'� ��צʙ�#�G��C 9���?@���.�b�=��� � ��ȃY� ��K�OqwZR^(�;���"����U��O���e�ξ�Q��r{q{u�R�'mià��ǺxzFY�!b
f}��`�fށ���Pzf���1?�!�h$d�g�����诃���r���#��VRWV:{��:�2^Z�(�s.O�:Xb�ґ�*��b����[Fړd!���J�0M�9ٝII}�_�+��K�,;@L1�͠F~�4x�B�V�����U�r�Ĺ(�x{�h�g^�Lk@Q�V8Z��hl�˯Ë�����6����gW	�[�6��lHY[�Yc��Ɨ��)�T�xc�Ol,���8�hq���;����*h+˻��~M�e�����`�p��
�4҂~}��¢}}w0J��M��DJe��׏?*�F�Q�n��(�Z�d��/�U�S�_~Ӆ;�Xmx͡�6
E�1qʄ�y��ּ���h��H�,l����=Z����2��Z��r���^DR���#)���l�b������{z�d@��[y���x�9}��_mF��$o�[|���`���K����\q` ����z5�F� m���`��:��^���VV[��#�&I��=��<�8m�ٹ����y����E�A� -���P�|s�?ؠ�A~|M�R��W���������ĲR4��{��߽����D��@�0�����,��e3`�1f<������q`����#�` �+��6��S�i�S�Q1�}Cp 	�<0��,�n'L<��� �,����A�xG��h)�!�q�x���~W��
"���]$҇��=��2D�"z��L����"L�F,�A 7�k"�����"�Tp��*��!�	b:A�,>h�p�Q^1L��t䈁���)$���:X&ִ���%2��tdj�R��ad��i��WF���sZ�w9�
��ԍtd��)8	�a�Y��%�`�wC�К��)�Myd[K
  x#�$�_����M)v =Hq��%I�����~�vX>|\S9���[��V�E�����z�F֙�E4$�I�WY�d�$�io�x_d�ٯw���{'�r+q����g_�ﮞ�|�R~]KD�p���vk���=����ˬ��E���9��-�5\$K	��5p}'p���g��Z+n��Nࢂ�\��՗��1�^�O�=	�d��5w��������a�@l�ݷ��c��^s���h�Ԣ�	����nvQ�M���8��O��eXeQK3�< @"�!��5��N��	HZHA��h'��[⤜S���-��\��`Kr 8+{�!���:���"�U��_���=�brH�&I[�	C�a�v�ˇ"r8�6v�цT+���	M��	��;�X�F8!
6DAA,�5Rzuu���F)r���ĳ��f^���xKJh)�H���]��!�g�hw�Z�h�k��5!�Q����������7���S���5)i 5m���;�k(�"s-�C���aH��}H��������~.	nNj�Q�A���sO���E�z�R���v��_-���C1�˵�q���q��%mX� ��fI�P�����%+]�5M89a(��Ϳ]��c�ru'8�b���͋�O����z�h��G����.���Ӡ͡����o�_��}�3r{Q��6@�T�))��\`W��O�s�R�����ٷ�
r���PP1J;��"�	_���ȑE����*��A�S_��F���@��sv���@��搉t��>��/�dP��{Vn96�����"c�L�+�ǜ��=��z�[$�g;~Ń=�Y��H��c/�$O{Xr���d�?�D�%%RaQy�g?A�Q;$�\<e���w��w�W�x%3�h9��#��s\�ڧ=�J(�.�t��!g��Я�C�؟�*��V�Bb1D�CM<z���S��8�nH�����/�n��z��NB��%Ū5�������^;sE@�`Kq����GlP�kP'�c���Ђ:���������B��w�����Bc&��}�~�I�d��v{w����T��ARI�� Vey�D�{�B�dZhz7]�*�Ӆ���-�K�zb=�s辮h�B#�6J[R<M�t��Qk�>�P)��.�I�;{�y���v�;!�%�Ɛ��1k�q(���A�B�����`�)噐ꯁ"�R���o��O6g���)j��qyП��go0rcI�d)7`�����~8��H��	��y��ʩ����Q�s�,P�ѩ�e�j��*�V�z��=RR�a�ʹT`��Kb>�����p���\.�Y����	���l��?C�����9�Q�(�	�~��ݬ�E���j����dM0逍�c$��S�~K�5���).��	�i��Oe	��8V3�x���<C��Y��d#�@��$���g/G��M&6'�d�1����tf�Iá>�фu����>����Ѥ�0� ��4G��V�5k�7<���Z-��3}?h�&��w֤��r�5	rC��P�fM��)r�7	rC���h��XOE���rw��f�a���Qə�="#(�s����B�����ܰ's�#y�x�`G��+�{JcO6A����Z�����C���:�	r���fJ��'�R5����ۇ����ntS�6Y�/D��h�Q�z�w�|$��aXt1e��;OR��T�j��S�9�\S�S��/)Uh�1\��.���3��rV�#�K
�dE�کB�י*�&��!��3���z�Y�:���P�`(���59�	繯��m>4O���%o��i�y�K�8ܯ�����$�s�u�Mϥ�fm��b�Ә�i*zW�D�+_�y�A]S�5}ɱ%@k��{��    tN���=��h�}�q�]���ʮ�4=��(��Bl�ܗ����=�M&��`b侮d�D_ڃ�w=%9���{.�i"rcqƁ������{䆍�C)o"�\�%`�{@A�������&&[�}"�;��	�%SXh��B�G�3?�?���~����ϯ�?%6�Q_E�N*O�{�`�r?�
�^�ԳK�Cn��z<����oId�\m�������������}wVII����FJ|䀏C�� 
��������e7�$+Q~v��˛�����{���_����J�.�)^�l�z7�EI�2Pl�:�9���r��uG}!p�W��I۝`�NT��?#���.~�]>{{�n�U�a�ϓ�D[�x|�v{=p
�{,�BK�t<��᛫n�S@#D���)m���O���5Ff�f=̿�����.���\�A����zt8���a-����c^��Ow��&H�q�+�YC;����'L���h�N����v�v�4���Hm[hG;?Ō���s���$Ю�F�ki�=�K�u���$�Ђ�'4>��@�9����jp��Z2i���|���+.���x 1.Ye�Dia�xh�i��R}�O��7�B� }����� F����p�!�{��ǞP�8��J�Tv��(���ϻ��]י����@��X��� ��4a�x�a՗��I��5pq��Տ�)�q��I��:�*ss=`3�U��+4h���Sr���~�`�F-��O�ċi���1X����pՖqhF�7͒�I�D����\�*���Y7ɒH�ڕyL�S�Ӡo��w��>�.����u�M�Ǚ}'��Sl
�H�������9�1����>�{�3m��I[�5!=���D|����)����f$E�<{,�+�m=�=E�5%9b�|T�����6�6l�I_����f4f��>0%�-s�֌�{�h�p2�sF	<�g��L����g�ږ�}����ݼ]��EC�ȥ��)v��]��`N��yH�<�`�2z�����ɖVaUVh����s��_3��fK-)��6�t��l5��ڣ�)������z��9?�'�0.Аe����jYh��Q�qI�,�d���'5��ܧ���R<ݐk1c��
�}�����$ﳩ����y)?���;T�d���j��������\?܍�:����2�:�ϱP����
jV�,x�Q���ݼ�d\� gZh䡞�
7-L�qa��В179�u
�z\� �Zh���kj�Mn\� �'��Ȁ7�n,��a��R0���X�������ҮSA�T����Zh�ҚV���T������G�3�u��T��{"�i"�r\�b��Y7S�qW����#��͡k�r>.24l,��(��eB7/2�u{�n�X�/���:�d
=�14tL��`<VdC9��h��ʸ7zR��󖊁"손%C���:¼�b����df��0�z*q^�D�EgA�I��Z[{A�`J�))c�-�Â���J�����4v,���'s��"����G���&Σ�̣j{�˫��۫����u���h��c@Qu/��x? -�8���4N�L�}���NCsC���MFΪL�}�������)�]�u����wv�����v�����E�8<�:6�b&b��F>��t��q���N���]�!�N�AO�F�yɂ�r?�20�2�4r�#1*2�R&R5߸��|��֩�#���(�!^������*F�{ԸW�f�-.,m�X��zܪ ^��D$f���<#֗�����˱�����5n�����y>��v�!����f"�y"폸(�7Yv��T,M�$�i=�=ݡ�=�5KgҒ�Z�p�ANV�5]9[�嵛v�=�Z ���Jm
�����w|eg��������'�v���Y3���-9G0u�����Y��NUg��_oo��c}�}{u�����^v��9�w���Xt��]?B)�.h�q�vXL�U��4�I84��\-����� L����'-ٞv1����~|,�.h�AIGs��87O��#䊭��	8�u<j�<ŞĚA��ϔr
���)�$֌�~�͎4�:'`�S6pvőFM@n)��\��=rv�S���El(���1���BO���c,��9�� ���Ie!6��""�s�a�S�Im!6�L�F��c)n^[$�[��D��c�o�ԗ�EB�Q���E�Q����?���޽ؼ����{�ŏF�A���� �S#?�gH�Q��WZ�l�(�i�
&	��ɇez�G�~�i���x-i�q�>rQ�y8��p�%M<�,�ϥzo^�$�J�x�X�;Z	z^�$�J�wX*G�)����&�UҴ��%�A�Qz-��N⫤Y�K����ڇ
�T`?�ǟ4�<�\H6��n�
���[����r�2��~^�59�UN_��s3&1\�|�(�����u�C1�WgMI�
約�z�m��x~�֜�e4T恟����'9̬I�It�Xcj���s����d�J_f2e�t��8Ş�0sC�Ph�r����9�A9D�^�f޳�*�fؓfnxY�M4�9/���Nۿ���SV�����so�&�/�׻��/��a;I�嬑��>�،[{���>�|�Ę��q�>K�	%'��X�JJ��� N�!GCh����_��m�=��p����:q�m��jk4��KI/�;E��Ï����h���W����c��&h����E?����c��&j�����J���?Vh4�x��/ 25�OՇ�4��V����+�����f#�@��N���S6�	�fcI��p����<�~����;�Mzyu����~{��|u�Ɇ�������T��-��wG7��]�2ϖ�u��n?5o�S[��<n�7�\�g ��n?9_�5��[�B�d��x�gR�����.�9#!�ś�<��O.UlMq+��Sʲ�<���.Ul�q[��6�t$f�Bi\�Eې��|2�Gbf�=Τ�mX�^������{�JG��<s�?8��٥�����5<�<�?����&�����Z��6�Re'�y�{P�hMK��Q�$��T��7�\�5)%��m�C:,���ٿ�]�������
C�I��c(ޯ�ΘiOiD�	輜������R�O����s�(�^����T���4�\�E�oi��S��'R�i�9�@��5/�yi������f����YGME�ň.{�}SM&�4]���AH�J�0�d�y脇�։da*��D���!�G�B��I�*�0Qd�y��y��52�!LY�(2д�_˘%��,Lhfr�p�8?����'�tZ�钔KjƂ+�]���}Z_~�%5��;0\�uJ��͆}I�p >��Ї��1������9P�j�7[�J�<����Vl�j��p���<�{��CԼ��!�h��*�y������+z��B^?�5�3��=bCm9aR��S������r��{�H��Ɏ+Z��S�Er(�`^v4.A��˧qy����{\vBl�d����o����K���R&SO���"ļf%��,	�φ}�\Y���%Q��Z���ɇ	?�p܂�q��,�k��ğm���}�U4_���)��	��b�Z�q�д�e�8Fk�:x鳛��݇��e��~ح�^�O���u=x6��㙞�5G	�� ��4��I��k��9����3G�Tч��������)V�:ݬ�D�MQ_�
�H�c�a���D��N�U�I��8�q"��&&���%R\*��8U�q����#����!ّ�Tiǉ���>s��6�'i�Tjǉ��J|@qG��k�J�8�ڪY������!����4N���*И��f�\�)ㄍ�U(r������ۊ�
f��-�J�
l>n�m��>1���T�B��CNܦ%���de��]�m�]&����p���~*�k�}XbJ�$S4m�^!T�B�~[�����y�x �[l�ܿX������cT�B�~�s��20���h�+�E���Úx�a���Z"�o������S�qUc�K� G��9�U�A[�`7������QU    nNϿ�w������G?�*��      e     x�mQ�r� |�>�P��_�B(�4 wN�~}��z-yn���U
��,|�Ly%�B�H6����c2�$腉3���&���@�1�� �Ig�)�mF8��q�[��v���T.f4�1���'O-ѻ[E�?_\� ӊ!��w��r��a��1�zmn�!}�0 N���\mY\��}�Qa8S0�|��T!Ynt�l�9�eO���}(�9y��N�|�R�2���M.���
l���OpPÓ�A��/��s�εYA�����Y+�;5�x�o[��      c   s  x����r�8������V(���x��Rick�Ex6ާߖ 9d��ʤ���nu����25�i��?B�����m�P�J�WF��V*!
��R��^觕ԌM��j��7�b�f%%�D;��t~\ 9�:��i5������9�]�Mg?L�\N�W�(%/J$[PW���κ�)Es��d��-%������w��cA˄[Dk�d���pc�v�0�b�0*A$v��S;b�L(��XLD'F�$�˶��N��}{3�8�������b[T�X^ ��v+�Ĕ�R�$H$��@�EW�u���=���I�0�+Ԙa�?n5~Q�]�$e��]�t�w�ug����8�axf����2jP�o��<_SJ%�y��}�D���u �����gu��;$H��S���֞L}�]��3�)KO��7KɟlD$��1F������������$�2�J�P�E2ddfj�ǩo���[������7 8R1QRN��D3�к��/I�ϟ�dlܾ��,$�LG�P��E���~ܔ�u8�
�Acy+����LyA.+�[��@��*VV
F9N��U]�)�����X���ȑG� ���֧����ף���Q�x�XE�ЪTdζ̢h��]��^��V�Y�Jؑ�H((j��9�چ�	�bl���Qs���|G��̞@y)�����p?��"|J��E�Q]h��_<�3�������u~��)��<h���Kg �C,���Z,���[���{���r����Kxr����{�(Z�prη��f�׽��P��G��p[��%�Ģ�]b��`=ӧ~�-��p����}0�|N%J�ÊD>�UX�%���g�÷�e[�H�8Y�0H[���vC���`>N�� ���s�2���{'E��fn'	Y-��C:��eN����!b�x�0�[�v��ף*��&�V2;P�]__�l� 

$d��f§�R��t��󩗡wZ�c�eEx!� �cd�����U�V��C�b
{1�&RhF�|�1(��T��y�^	�O�>�s�	�b�xf ��eK
A�~�n���'�U�^�TE��t5�BJ;�-5���x*�x���T��,���Kh�_�V�e�՟�������      x   �  x���[n�0 ���v}a�m�$!��4���H`����TU��-|���I�w��x�@D0fy�,�)�/��O�|����v�ߦ�k��X�@nj���yq�˓��k-����t[�����}�1�Ɂ(���b!���x91�vH��<�o��#5�c(�x(R��.��7�pmt6��t�f�����1�0�����I87b,N�FYl�\QA��Z�Rn�pvr֋>���"{�n��WnYF�3�<�i����
�" �B �	�#�G�^y{�KK�I�E�t�Ȫ���
1�����j*Ȫ45�PuG��h!�x�co����<X�����_"Hޠ��D�D��B��(
��bR%�@��ե��(�.��m1��H�_�T=m�nh4���T�R�k�������c��Mu)?�� ��U���L ��D,�i8�q8dM����8����(L�VzF��}��J����:tYg@G}� ��r�ќ�-��-��_"����!U�`E�����؏�6$2������ǣ��͝+�H1CS�{��7�_^�j<�md-����{3���@�5M~*� ��Q�	VD�|W�0�m�垇�(m���bW�Y��q�	���u3Ubݛ��K��nt���J��g��ki��z�������$A@��=*" �������?�~3�      o      x��][o\�u~�~�y��Gs!9$��H���A=ȱ
�v�@�{{�E7òh�
�H�%�r$p0�s9�''y8��K����};琢]�� �m�3����|�;s?y���\�׹N��Yh�����Y3��]l.-uz���ju�E>�,^�t���&��m�"/Fӻ�yq�L�C�⃤�u�[<*>:߻�L�ݤ������E?1�ȓN��~����QR����������,@�1*�dz�H�k��Wnr �,��$E�<'5K:�n��_��xn>�a�ʋ�O�O��_���!� ����W�����,e`^j_c�����7lMo7�G�=;I�l%��3{�)ol"�0/2�3��5�o�W���2��y���e������)B�1֘��G͟]�����3�Py���Ph>6��fx���gOhW��h�>R��,qzS~g6:�f�jY�t�,�H��w��%��;\ ͳ��6�h���{f�r2�B�q~U��!y����s�i!�'L�o�p	�<�C0s��;ӻ���}�3����!��J<�|-�n%�֒�	�82G�H���t�����]��Q}���oY�§�vq�Y)YJ>��|�������حp����q�8��ح������._�7f��9r@f֜C 2Pcd^���$o8��$A��
w��BnßX����%�(1�2Bb�~`�`li��@\'�	YR�"3��{�����}4�qSOsK����_6^a �>p�������Հ0��TE_��P5�7���^���DZ��O}�J�B�`�]��@�=�~qʥ�""��-���IY���Gݏ����y�h4��<e��t �J����̻̖U5Q�
�����:��5̋S8�B"�pש��K�Cb��JbO½\�]������-���)�>6Vżyd��?�}q �z�;�zЁx�0xL�UѴ䷜�(��Q��L3����=�X��#�����|�Lu=x��U�٧n����n:�9�"�a�Y)�Owη��^Mo˪�<Ȓ��M��%W+u�}`{�j13������2�˅�>6�|	�Da�j�6��D)*Z�j0K��E�Do��s�����?^�ry��/�k��fwyei�C|A�)���ٙ�\��d�g�ك���OI�!�4��mG8��Y��#~p$�^�ͶW�b���������C���@U��ͅ�ߋ,����œ�P[��X�9���������W8{O�,f����}.+7�=���[�� ����#C�������`9T����Z��;��'����
?Ȫ����CC(�!k���m�nT��(v�9j����6�Ӥ�{�5?��=��IM�D|��������'�4��D����}(p0�}���\��F�ɐx�!�}�
\/jm�=󴝊M�a��L��q�:���U;F��o@aR|Eb��*\�S��/�r���{昱�W��)�A!�ia��Lph�6�̾:��ګ���Ng����-t�I�� E���;�w�XZXj_M�ٱ!�sQM|�K�І�T�	@�L_�	�^�����2�!~�OI�*��	D�����VK����:�$v��eZa�'MS�2s�T��*9���!�s���ZR�[<���,j�IzD�1rr�n�`�������U�Bu{/R?<2Oܢ�z�����tͱ���b�$ed,�
�){�p�xBY�z�<�|!čp�&Tz����b|kl�O�;��uHԲT�<�sA%!լk�<P��y����7>�������h�o�X�N2ddE��+���y��=�-'���ַ���;����`�!�F�i
��<)�e�����J$�V$ͨ���>c�b-D:������}:��DC�h��J�>v�s��YE(E�D&K��FI�;#[��1)$��)���m����4�cc:> ��P��)##�,���T�!t}�KU�뤉��SJb#��??��q0�b�T6#mv�_��a�v�p0�|;<�F^>�CGq �'#l)��p�?�5X�p!���P�|�jm�d��fy��5e�����^�,ŀO8�|�p�f��С(�
B��=9/�Ў��@ʕ�O [}��P�C4��xּ������cM����!ɭZ��!�3�����֊,@��Aw����3���(�a�����~H��	{�_sE�/m�Ѐ��+k9�'��Ap&�(_R�T��|AA��k�ħmvZ�2bK �9��@��Z*������w����S��rs3"���\?�C��}:c>��|�R���U�`��;"��
�\ֱ�=�А�Ob��!���gd����5����Mde���-*wƟ�	j��\��J�<��8L�S����P���-{z%��&���i��댓��3(+c�����v�4�2P\��0B�	e�E}jQ;4�;�^��Z'�.8�k���i��%�� ��
X%*��8`Xڿ`b�b�(���\0�U�����
5F8��A�1�on��T�Z�8����T 0�ʏ���	q4U��#����+O�|"�6/�n�f�B��� l�D0�F��~�y~*Q\	�	:�Jk.��Qv:�� �y��`%�Ѩp_��׸�e=��N�����΍���82����Ņ�(t���S�n�9.	$sh�q^���=�`u�Ap��)��a�Gd�T4U��j�_���@E�%�m�t(�����J��:'I��������g,���G<��G�/����y�wB�T)���%�m�o��R�"ڪݞް���8vO��%$"����)�19�ɕ\�{d~�ݎ�[��]|���A�)}Qޝ�1mV��޹q
Vc �M�l�Q�o)ꢶ�@9ԍ�r�r�1��נ��x�^�l��{�� =�7P&��~����iׇ�K� ݭ��Kӡyǌ���Pf���xxM��d�
��lj��Dé���S��2�X$�=�=M�Ъ��h�����6��9x�'�잧�_1������K_�����{�.E�-�T��dS�$�V�Dl�o�Do�@���NzC�����ĝ�&GLS{F	u���/��n�w�`~@�󆟶h��q�\�ҵ�f/�~Q<���e�Be�v���J�o�1&s��R������v�(����Y<�4��Kׯ_�I�v�j�-.�uz�Vg��[�%ufI�YRg�Աy�ԙ%ufI�YRg�ԙ%ufI�b�ԙ%uNN�?�sfy���\��Yݕ�R����4s�fn��͚�Y37k�f�ܬ��5s�fn��͚�Y37��nV�L{�o/]�Ϸ/��A�׺���r{�ׅ����M��0�d��J(���m���13�Z	{L!�J�iйH����W�\�Ha`��AQ��҉��}f~�Q�r�7�]]<��s|ĹmQ'��E�m;��#:i�ԃ��HΚC=t M��M"�A`�����nB�d�kB��Vk���l8����=ȸ�߀�|h3�	>��D�|6!�M��X��H҆6�Q6m�H�����clKMנ�"ߘ�m�w�_�O��[\[71v���A��p��n���}A
���R��QC��� ɓ&��2� ����w�
���d�һ����*)=lB���uj�~��%e^��8}����@���Lվ�﨔��){��j$X|W�$P=/��#��5�3����)1��5�W�-�,R��������o�}VS���P��GA��k��`$;� )�_���}�'�r���L��Sy�3'��X�� �Ǯ�:8
��m�f @�$��섕/d��S�q/�^��Qvl�*�Q[ɥ�F�k�!R��\��܁@��<p����)u؊E|Ib����+���;𠝯9��:�/A*[B)�ر�ܩ���-��6ekN�܌�tR�ĺ&#����i)t��(�Z8��V��YMe��6��ۚu/���?�rP�_�DK����-�%��>i�FE;ZTi6�ƶb�Y��#aS[�V��g[    ,���%��fy84u��Rp誟���ۢD���it@��$0Z�R��{;��5(y�v��z��v�Xt���g���Lg2W`�
t�bBLI�����C���ϧ�4HoWk@.L[��Ux]��x��v������$՞���C7Ʒu�8p�;���(v6�u?�v��W��9���>�x����(S��4|�������%�ܾP|���dnd�e{��>r�c9F�X��N�i��:RK��YȞ�)¯�~��_���	щ5�zs�3���������T�--6{�nkyu�v��]fi�Y���Y�e�v��]fi�Y�e�v��]�Y�e�vyMڥ7�tfe�G����K��/]Sgke��-ɻ,�u����b��7W,�<�O�Sm�4
I���M��D� ���E��*AO����q�{U�E�5DGFi�M$������\�����w�M�x��7��}4P�.��8@�b-9��;��߿�����o~{}��_]K����?޹r�߮�۷����{�o~�p���w�p����T�%д�&Q%c6����v9z�^���j%��s��F�^�Lx���' �N0�����ƴ���r���!e�WX�Pk�� �V>,��u�g{��	��y��;��
D�T� y�B�͐�kG+�̶��2�r�
�#����Nj��`@���-!m]��ݎ�����(��(�Wڼb��C�StKrh��TD�q$gQbP?�-i��W-�rlp�;hS���Aj^(7m��ς6/���e�JU�z\]k�yRR+Ӏ�4�o>�8k�P?OzK	�qfE�(����Yj��+6W��Q���%9���+4pvo�f�8����-ن0(�}H��)�8t~(�1Dv��8��
�@����.`{�l/lB�9�rD01hiMh8��OV�I�N�F �\�8f)��3��sB/5��G��i��n��A�tl�n�xo{u9P|�d���kt}L����؎g@�,^��#U�1`��|�C�9L�s6I�� �S�I�!������:-��5O�@}Z���*�v�v9�0��10o�z:R���5[��=���s�ɾ˪ݫ�dG6ٹ`�t�|Pe<�^A����a���r�X+��cpvM��/8���7�N��#�۫ߖ[���������*����\f�J2-8�����3=���W��y�؜[j��3V�m�`l�Hd<��i2y����?�z�s6����u��SW)�߁d6p�ҩD4n�4A����*Q���C��Y����ǝ�w{��N�|{Y9���0j�q%���J�!��w�m��U�ߤ����/��U����͚�Ȏ9�]�z4'�ޢ2
dd�8
!K^�r`u\FJN�i>�S��#gV�~b��Pk��yo"���+W�z+�0õ:w��#�$Y����b��^^�-�䇙/�i��Ky`���^o\^����j��=��]����sU��r�(7o��?-�}��f�[#T�	�RNb�Y<�i���VZ���v5h���F�>�˂��Uu��΃�ܹ�d]���;߻���s���^[�ze~�0be�W�s��<���K�QT���-Nt����������I���A��<�YY]�\��u�U?'11��'����pmG�n��ʹ2�2�5��Ј��z�J,�A:��u��hC��/EG�J�h���]�[�	��8�>	��k&���'����#�0?Ȍh��3����W_"MJ6�lf�F�pɁ�Rr�U�X�ԗy�Wp���E�52�>օ�d��\��c��y4��%��H�NV��֏������8%��Q5�t�)���D^�[^�Q���[Q��/����o�Z�w�$��_��m4D�P�ם⫻`����m{S��
�����~�u�u�q�5k5�ͅ���P'�[�x���D=�H�.J��㎈����h~d�Bٗ6xUR�H}��E�zŕ�dxω6�Р�\.��r��kLK��V�X�!��{}�<��h�Y�4d�Һ|���Z�F���q�N������_��}D����;J���{�߼}���6D��kW��E�����DX��n���E��Q<=����p�f-�k�]�#��,t��\�&�J�Q�BE&1�ㇹ�q�����ڵ�����ùX/5Ԑ�^�c^�:g����6
�d���6۲�$�4.t�+��:b��<I}p���<�јb1�����$Tj���ݨ�1�aU���;&��A֪W���-��OB��oUN1T��e��"ݵ��M����t_oQ��]�3\��i�t���|���%�7��Ȃ j?�Y.U��y�y=ed��k��2�ԅ�
-qr5�0�7�|�+J���
���I�S���$!M�k��)@K��P��-j���qH����eY�K<֋�Xl�f���ي�2@�Xxt)��
�˔�����5;�m�7^V�_"�o�R�DZ��)1�c,L}�Ha�#CQSw o�ϭ��GԾ;;��,�!��9@��Ͱ����!u�,�[�S�i�Z�/���6,G/Fgtz"�Ǳʩ��kB�%*�E�h�ܵ�8˶���bcz��}ງ|YN��m���
ǟ��z^���_�_�1������|�֐N��H�Ya@���a�����1�¡Z��0l��Av��!��QI�=5�%�]����y}��R�W('�w���� �.&m$���C�\
��^�)T�Eݺˮ�.j�����#_:'k e$�>�;g��>�i"tF@�"���`�+\��d|�摬/;�[��&ؗ8�ꪢJ����k���蝔~�4Z��f z�%q��3��L|�z��?ME��|�L�=��K�.�u�z�H��Z��\]�u���SV/��:��Vs��Vn!�Vj���f3	�x���&l�)��09!����R�G����U-���6����pQ��r�5Ԧ��n�9E2�� �`�Fֆ�ܝ���(�4� .��Ep�7$$fk\�]��?�KL�Ls���4w-��b��Yz�z��|�B7DQɮP9��E���F��Ya�)`�����QbSb���IFxY5�Yфx�Z|ȷ�qvAq�KZ|!ķ�a3C��O�b��G���ͩ�RǄ�0����p��������*/�X$V*�����:�
�G5�m�l*�8�;�@�ðe���7�;s�yF��
���]�%�ܠ��å/T��a�Ek�b]��}�uZ������K��>4"/���V5�h���������F���F�$��@N��	�����^��n�O�z�.M����0�z��&�b�v
)�V$1koeڀ[	:pb��5/����	�9�T���6���>:���uH�� X"�Jyc'8�\��ޣ��[UǄp�;\��>[�D�P YB,7���#��"$��A�]�-���*�sV��P�C$�&u7�O���C�y���M]B[R�.��>��L��i�R�^�ϵ{;�I	ؾϥ��iT����[�}%�Y~X��硰V�;���D�I��xj���m�����-� E�AT�o&c������B����-���y���� #w�V=𩽇f�~6�u�/PY"�/թ+!�z��c$�E��A���`��6���aKQ>�Fu��߾c���|
�O���De�$�}"ci���9 �M�^���)Q�7S�pR�I(E<�2�jվ�0��'X�u&�M6e�&`E�8�g�#9�׬P�Y�*9���F7���-c8��<߂��`�E��br�y�9P(1�Ņ�B{�����6G�P� q\���K��lv��۞N�*�h�08 X� �5*�Ooҭk���lb��?��f�G^	��#�<g�,:K!#|;v�& Z�ڹ[��u���ݥ�_��W�qőP��^4��!q��8E���&k�������@G�A�'�a�Ot�]	��B������+w�29adA�N��/�r諛��0eKUF���l1�	�#wq�::�vD'�L�q�o^����r�   ���m�+�e�E�T����p
p��J��7�B�X`���C\49�g���d��V��W���.l���A~��v�o�)4����]�<]k�?s��*����Z��O�,mi�˶9��b�u����.ڃki�o�����(�uyA�|J��{�n��He�KY�.��=:��[���Z��A_��V�A�m�s�����o�3z���y�J(�������AhI���q���0}�ka[H�-�ˈ�����"kέ�u�t�~���/����Յv[QK�kݥfkq����,��Am3`\Z��j��Cm2�~Z ����*Wb:�ַ7�	pD�������~��K�7؈n�
� -:p��ԍXdν�>p��0��O<�ZФb�F�(�|x��jEpE�sd�7�[O#�T��F���N��WLw��.��c]E4:���Co�A�R�;N��EV�uV�J}�uEbPA��9�%�]����sjl�P�KDޚ?��AUs�����xT���?KM��]����{Zd�`�*T�_�G�WTK�'�}��rV���u�D�#EL|��;�	u�o��bК-��J*���7��|��-\���׈&]H�d���V}��EH>��i0��f�����,m�$�y��e�Ա�zI�4��h�H��ޚ���T�ƚMH����>��� 87E$�ܵ�Q�ƨw�t�;��"~T���͵\!���K)���.��O�iP�~T�KR9-�x���k�بo���j+4p�cM��Ұ�*�v��0��F���*��ؚ<
K�y�+��u3��(T$�>�)��<I/��̉-tj�t����h��I3+�L�fu;�QT;���K�0T�嬾C��+�	���:{R�%D��
�v�
�����Z�V�-��M�@lP�;�QTۃ���>;���#z��tu�p��t #*#^�ѶV:�$r&�CͳS�6��㙳(S�����T�Y�Q-���7��-��rKN�X$E�=���n�ߋ��$��q�(4�ç��n��#�q�s���f�����w�ދ�r]��B��W�H�g��l�����BC����:���Qx���BP�Z�)��TT����{ݨl+p�'uʟ������j���Zӗ"�xS�	q���s>4���t�0lؐ�h� (_(k���*`�c�GEt�5
��������L�{e��B
�
0�a�sx�"�9Ü�fJD�$(t<J��~���)�{�*�����@j'����i8��u�	qD�N�,�*�4��ڇ�MB�8 �f���HE�(f��Q7ly�{�#ſ�C�j��
pƼhIMV�CZ�P�<m�Dc��/+���:ڴ!O��zA�j���'�z÷8^B������5��^�	��N�M,{��ÚŢ4Oi͆��:��54�J��H�	�3FS:x������]=���������FENƧ�u��tzs��߽�����ז�ځ�J����_G�fgE�*0�|��j��B���ZNZݵ��Z���,���{��{�3?k�9s� f/l�      |   ;   x�ʱ !�X*�y[<4CL�?�D��	�`�L���0�*6���l��j$/��p      q   %   x�3�,�4�4�2��f\F`ڔ�L�s��qqq mY�      �   �  x���K��J����o�T��!��,���CQ�|+P�����ўn�ǡX|d��+���w��_�_x�X�練o����Fq�}���*�j[}��I��SA��
�h
����bN%d-�V7�윲�Q�̨a$��0T丒OR��H��;1G".w4uo�1l�6IP�|���-��q��4�.��Ն�%ۖ���ݣ��7�\}���������R����G
J�&��MC�
��*3Y���%a�;q��o��Uf��Y�gQ������(i;�����6r<�w�a ��ǉd�2��B$1��"Tb	��N���b	�|3����D��4��OE����f�p'&�P?5�us̀H���I$�����%vM��1�$jB��3���)~b)�G�[��� dҦn��zZ��ҹ��v:�~�=zsQ=�w#"�O��O��T%B	��n-���C]4��vK��F2��#��-On:��&>%�#
�O�����W�l6�О-[�]7��(��t���a�8�(���5+�zM��B��0����4�RV��9�t#e5�=�Sw�R����ևe����D��ɘP�UG�	9�]�W���^�����.���P��2�O��z�ֈK*����ܟ�Q<���S�7�,����#D�o��+$��&%�,��`N�#^qJ��·�}�N�a�;ȦQ�"��儾G��0-�`�'3:��=��'����^�4l�rf�s�̴$�xM(tg��~�T�k�ջ��{/F�t�O��eɿmx�<�c��g���p-����d�#H2��2bkdZ
#���$!�*4q;FR�`�	�DX�۶{y�`��U�NWm��h��]�x����{�^��ЂV�$
�v��@I�P�v����Dy���
X0m+�	���t��J�����hL$wv��v%⛅M����/��Y���� ����o$a4���j����r�R�k@��b�6ȁ�K�-�HE�;�Y�������o�.V�������`H�����xn����r_߬������Ô��d���H0�qZ[+�i閰k���~6�u&�oE�k�C���xi������"��A������oc�Z�U�8D�n߉�^K4�ʉ��$��j���p���]#�ў�c���F��%萓e*��M+{��$����hɫ�� =D2�i94A00�É%���BY��!�n�ܯ��A�Uî]���t�Y�=g7g��Xӝ�ja�H�T�!ؼTI�5X��j��"]��ĂH�Z�����ad�k<������]ʞ���,���q�/5�6���h�y�	�٩G�Hv�*���7-9���>�>�ITD�Ov5���'�����|-~g�l�-�L���+~\V磱
�p>��m����χG{��H	�$��*i��u�tV#;�x?!",Y�Ђ`��k�T��J�N���Z�4{"��(c��W��5����C�9D=�g҃
N�:�:�>����xT ���&����R�u�;-�<�[ͳ��KM�j4���y�n��yv{����y��B���~��LzP1��W{����*t�
�ˠ	1���%��d�;`�Ͱ�1��H��?tN`KO�����0����>��e�-拽o�������[�R���$�
Z��5�Xs��B$0��7'���L���&���I���t���^^�0j�d�PG׸��L��h�|���B�Lz��^�%�_��Z\a�@K� վ��Ȍ�
p�RCu\�wU���ד��֌]��|2��MОξ=b��$5��A�LzАH_�*�)��9Gf&�ڕ�=�*[;��O�xW��v��o߮��@�/gM��Zi=��ܖ�7ͽ˭�Y[�ϤX&�+R�'��KG[�Oz��D�$�����c��;��.��t��q7�!gDåyͷ�.}D�C������׺�>�4������c�R	߇9Vp>�j�d�H㖎�!���C�h7���gSK��G2�q�d� ��Ec��sW�����럷���      z   �   x�}�A� E��)8�T�ڕp��͔LHXB1��/�肤���������r)-M�����Hf�T�R��Ȯ���xy�\ʱ?�{�(�o�
��Վ�fs��F�/���j��;Aa��e�R*��Z	��`�9�O�[�mZ      �   �  x��T�N�0}v��? M�-o-�jUnj�բ�v��4�������8�Ҋ�U^�q<��9��e�s�I8���[m�~'3����َ̬�*(�sX��c��~DQ?�a���S�]��+�5f�m�&�*��hRl�iHbP��4N�w0��J���>yD.� L�m�Ws�	����9��3fp����^����zV��I&,�7g��E"���G�ОEH^�⮪pDbw��3��Y�؍��>��!���}��b����VV�<�Y�J�`H����J銍%�<q�ЅVI�Y�N�ۻd��vr4�[���F�gH�%����/�c� -�5��[��h�a_X�tFn�йv��������ʃC��GT�f�X��6ղW�p~B�x�)��wz��u������/��V�_U��%3e��V�cN�
���f}��$ժh�m���$3�a	f�-���FЬ$�UM�fy�m�>DB�sn�5K��n��uNl�>g��}��0;����΅��u�#օX)��{�C'��&���r���pLF�hN;.�-�W�?�Y(�t�`ȓY�t% O��S`s���$ϻ��I+k��b��e]�c!�_�My�uj`M����'YW���*K�~�"�b����	(q��:d�CѡA��"rô�)��7#{����������⎽�(.N5�\!@~��[]���^���/r      �   �  x���Kn�8���)��`=�<Ĝ�7VhQ0�4���OQv[����"��W��`@�C�|����c�򭞧��9�i�r�w���I�����1�Hy��_��<�$\����Y�c���c���8��M&j�κ�dP�]���r:_>�z���.�e�v<$�d�v���wީ��5�\j�S��O&h"�7�Or 
���c(�����1��:����1�ho8F�a��qzJ���_u+�s�!0��������j��:�)&���Pܓ�|ܷx5���}��4� ����PIa�$Ś�|�ƫt�u��Pbh�G0�Cp��;4&��=t{��A��<���J#*�|(_�w����� ���M�6b��0�-�Q���RԎ�__��VS8��Q�Ѹ����S��|�(2����&2:@tD�,� S�g���Q$�4�H�T�,���M�<�<���;m�B3��!�F�n�nE)��`��F.��6��H/��c4�W�J|�\Ŗ"���̬s���gP%_�!�>DqS�7�k���@R��2��Gϸ�A;�i-�"�F]�L����咥��M���|z���Or�:pC5��.�X�bIYh��|~�(����b���l�NM�,1��*��&����4�U������6�ӱU!��A�;��MSL��4��Z���u�5���v~��I2{bj��dw�ǡ5sY�����f�=D��g��=U�9���W��ׯ5j7[(&d�(xX�p+��ea��s:EI��sx��d�Z�L/Dkt��\�5G�7�7�����`1��doP��d����/}u3pùmcuI�PK�y�Lo�W��<��4�������2�53Q���P\#�!��?q���[�"Om�{(,cB�d�����a��9H
      �   1   x�3�4�4�4202�50�52rAؐ˄Ӏ�!aTe	�0����� �7�      �   �   x�u��� C��aPL��.��甶�s�Rx8��9@8��:�*�q�FB
v�X���$p�ֲo������7'Q�H�7b���.8Ǜs!l�Nn��KO���R��C���2�s�8փk��3���(�      �   Q   x����0�xpǻt�9�pn�{C�C�_���&J�Sf*���YL����K	����ח[t䎏��@      �   7  x����N�0F��O���N
�e��@�]��J+E��՘�v�N���g�i){���Ϟ��`*^P��l��p8�,͂h0r�+n�º�G��,
�N7z�,��)�"\���G`�ji��"R����y�s���#��M��F���I5�.6�ԥ:�l�dO�;�{�sm�$t!����4|����IsR��k�BڃtLC����j\��ْ<��t8����8�X�p�gN_6�7�6�@cP��]�M�����Y�n�-�qwzN[���Á�������Ӳ=�#��fM�"�����ɲ�?>��N �����i�<[|����GXѕ�'�P����4+����k� ����K�(8�"o ������C���]7��[�����/��o*�a%kWѥ��C�S�;���^�����ϻ������U�PY�Z����e)|��3yi�c���b�?5�}���v����q��U�u?�3XȪD�`&l7�/��{��'�>�c���?�y=�>j&�J
'6�CY8LtaE���jZ`}Y<����q`�=�Cn�4�����h4zGJg�      �   h   x��1�@C�Z:Lf�%�)bofhRq'7߆ϗ�V�DT��qTNH�F[w�h;��-CHGJEM�|!6ڈ�z�)�=����:��w��� y���      �   X   x�%���0��a��<�K���v+"� :%X�f��K1�2'�C\8X�v���x#!�e����hUY���0*�oU�%��`Z���E����      �   �  x��Wm�9�m�e��]���ت���2ʮF��Nc(���dݒU�5�TSy��p��Y;���Y:O�<{���O��0G����l?�~���E��k�W=�ߨO�	�F{/�.����l�����Ćٞi<>S{����<6��<�y�+��9����<�AX�<xn���t�,����̙�5�[�4ߞ$f�u�?}:���[����R8�u�g.�J��EH�2�K����Sf\)O�a�닰gC���J[�������$2U��;Ø��ȶ1���c�K��Ms�X�b�^�Y)}F�,��LX����CnD�+#�%\�Rey P��6��o%��Yv�P�>k�h�hY�O�\?���AX(�&#�T��gꄰ?ˢ�8��JX�2�9�J�r�"�E��	8_g�s߰uS�sA���Q����K���AΰQ��E{/*p})�	pA{�;ڋ)�~2���(�'W&i�d�����f������p�%^`@����Ļ檚X��̧��j}C��W�T��T�7zdE��P����E�w6�3���j�?pue�ޱQ���9�����P45����Kܤ�xM��h�'�M��5o����w����@���q��r%4m���V�n��e�<�q(� ioꆚBt)���I����B�uLJb�:��cQ�����	BTj��5WK�os��g�u����ס���~'؃��
��,ތ�p�C���9�R�Z�(���-$P}Kib�(D �ъ����"�	AX���^=K$x��h�~S������$<K��D$���'�
�vDE�+���JY�IѢ�qb�J8�Fv�{���3��[c{}Ĺ^�_���!�܎�+��S�����aVJ��+U6'�ô���TƮYX
�0v�/B�Ch�tb6��I�#�(0��@�I��vBd�;�ƺ7�np��HD��cPJ��֕z��U04Nw	��\�@��T&b��3Ǖ"�T����'s� aIݮ4Jz�s����v��8�S+�WZ,N�T�]5Iş�9�n��U
P�J|kf��2�v�X�`�h-�uӞ�'�� �V��"���]���@����jjLL�l.�e��l�gX�X�)n�ʞ�r&ѵ�}��a��u4i��n�_G�y�2����Ի��{�|Ѿ�!a���Z?�Z��}��g��)b���E{�c|��_�:
w��g0�����-;�u}z�>7-�A���������}&�G�=V	T�f��y�u�F:��Y��i�di/�\�'����V~(�?(�&Y��r���\�����ﺀ������Jh�D�f�I7E>��8SK����¸ϺH`j��3M[<u��o}��+V<L��_�*e�\������O=P������Ŕ�� ^]�/E��s��q��,��+O�n|-��\J�Y��w���9�la2�      �   :   x���  k{�<�u&`���β�AG7��J�>+�m�c�$^
*      �   9   x�3��HML�2��L�(QH��/�2��IM��M8�K2R���S*
�J�b���� �Q      �   P  x�eT�� ;�b�ll~�l�u�	�}sa2��d[�һ4R%�uq�.�6��/U����Q*?�Z�#��1q���-R1�()Pt�SB�ҹ�i��P�Ҥ�C�	��A���)]b����ҵ��|`�L�Ґl����	%�)cAY���f�`/@�%�t��u���5�D�7*%0[��{
C�n;y���Ʃ��Ymc����0u����P�\]vg���ZR,dw=7&Q���^�4�~��?OIC]jBr�rJ�&��y��82��u-4i���d�P�b�4��n����ň@�qK��T�1$d�v���q.vc�IB�Ae��I=a�۪�h�}P�mG�s;f��O�ψ���V�?C����/�΍����M�5Y�_�]�l�o}Ŝ%AQ#� Ș���m�jc�6bНv�{�ԁ�����<-Su&�e@�����`|��m�L:BW?�?n`QQ���<�<)��9��JP�u8&4xva�\�m��q4���	�E���h�RAɻ_�_�Լ�9(h6A����t8�R���:y_ y��VLR;�����\t��%�?�|5yE�� ��<�(�?ZJ�4kА      �   5   x�3��/-Q�OSHʯ�2�H�K�)�TH,JM�2�άЭL,J���qqq g      �   )  x�MT[�+1�&�A!@{��_ǵ���*�̄�ؘ1YK�����su0���l�bO[�i���`���!U\pD�<�5G�͝b��\�ɧ�q�w��b+�]��Xi^Y�o�BV����*�2����v�@0�Ǒ��$��;���m��#H� ��&��Q��X�f<A]H2�(��i��"IL\S\��r�c@��� �xN��:K���`�TS*�>u��|H�B��ͮ$�L��u�Y�@�A���M��/ Uu�vw/	�l_BL��{��l�� ~p�)1�B7ަ6t��(V� ����M�F�9]��L��@�Ay����;V�����?%�5���;���C̯~����J�w���X�ٟx�*GbV����j�KM���>�&׀��)���t�j7��e�@�6(䜚�m0��/b�$��r�Sh��vr�J&��"���6\u��֨C��Y[�]o��Bik5���Q�>��ܚu�V'�-�wcmֵu�R���3Nz֐������V�'`r�w}bB����`8^m�t��:{�m      �   O   x�3�t+��UH�/�K-�2��/H�S(�I��2�N-Q(�LMN�2�t�,JM.Qp+JM��L��2�H�K�)������ �z      �   
  x�uUa�$+�����ջ����%`���nm-_�4�		(i�Ԓh���X��!�1T����ddY�Ikb��'ۿ�7[�%�KK�/V?y���[n@Q�_�q����rOV��I��%�2F�Q&�+��ׯq�̓���]���Iq  -6dTyZ���5�Ery"+*�g���4N�WbK�y�n �<��	�P��q�HP�S
0�+�}���Y�vzx��/$E�Fv?�yS�$��ܳ�r�܇��v��ܲ4���,��v$�0#9v�5p��e�4�����k��Y>�R�d��T-����j��
߾\�i>@�I�d��XT�f�����T;�,�o�/�?�=ǔe�RZ����q�Fǂi�IEB���K��
b��� ��ַE_�"+�<�h�,�;J�o�`�@����x�^ w(:���{�%V���m5v�ܳ�mr'�~��� ����k�`Q�.�3�Pk���Fe9�<"�܆oI'�� .as�<�7��f[6L'����M���Sz����BDaz�Y.�GcG}h�¨@��WK{d�_,±���?W�v���U1�6�u�+��4 ���܍$ˮҎ�>'bϸeA���֫9��
 ��_8��@�d��sw�M�)��9K���|�1 $>�wة犓�9-�3���2�/�J����>�s��om���iy%4�y�?Ķ~ArIvV�TZ:W����	�����k��G\6L����rHr��W���P�s���Ȑ_����3�G ^{������A      �      x�}Qۍ1�&� 	�^��:�����;��$�mlp)�-�O�P�Q�u�+&�o� �3#jj��ޒ�4�r��RI|��	F8���fK����Ā�B��0�����8�AK�[ţ����u$��	�Z�#W��JJ2޷P�y�����)�)��ڐv/Ȩ1�4m�gX�+�.� &�^6Mf����ʆ��+�0_�	r���!:!��z����c���~�э%e?��Vp�F�\}d���͝�t6^�q�7�s��í2�kc�l�%�޹�]k��w[�      m   f  x�}�َ�@���)��;�X+��$���ֈ[&�,�"Ȣ��j�t��S9��(B}��f�o9�=ݚ�rU�@٪c��6-��g`̕v������,��Ӥ�;Ҹ�-N�U=�B�S%�}�#���9���?C�a�ԺG9�z�+ / 4��"�C�bX��\˹sﾏ~��.`������a�>F8
���ܸ��{cX�ؼf�"I���Ap����R��q�x����U������~K�2X�y�7X���0��~���� ��?wwv�'��l�U��-�w�l�|%/��6I]�۝'Ċ�������a��)���#���A�����~W0��57[�Ȕ�����M׮穝����@�#����M����^�V��u�a;^ i �A(K(��^w-[E|.���P�3y�c5/+rRE�z�v����Vg�9q	���8��"���B�-grf��G���C_ -a�^Bf�3�<��R�y��W<�u����=��[�,�o�~��Y\\v=]��p���5w�멿�^�3���g�K��p0gڞp�`�tҝޯ�j�$}L#~A��P���P�����(�Ձ�."�n��Xl1W�E�Z�|o��G��ˢ������9Q�uԍ6�����v��`?/�QJ@��d`�Rj �A!x�WJ����.�L�����LΣR!S9�N�t��h�����N��Ng��Ka��y���v�G�Ҟ|]�Q����X��1�����'3���I���i�!�@�Mr5�&��y�>S�$n�dY;/��N%�M\٪Im��y�*o�N�D�~,�¯+~����(m`�ňG�Ɩ1IeL�O�!���V����W�����V*�����      s      x������ � �      u      x������ � �      ~      x�3�,�4�4�25�L�4������ (/=      �      x�3�4202�F\1z\\\ ��     