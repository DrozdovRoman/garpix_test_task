--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: api_album; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.api_album (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    image character varying(100) NOT NULL,
    author_id bigint NOT NULL,
    views integer NOT NULL,
    thumbnail character varying(200),
    CONSTRAINT api_album_views_check CHECK ((views >= 0))
);


ALTER TABLE public.api_album OWNER TO "user";

--
-- Name: api_album_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.api_album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_album_id_seq OWNER TO "user";

--
-- Name: api_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.api_album_id_seq OWNED BY public.api_album.id;


--
-- Name: api_topalbums; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.api_topalbums (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    hash_key character varying(64) NOT NULL,
    webm_file character varying(200) NOT NULL
);


ALTER TABLE public.api_topalbums OWNER TO "user";

--
-- Name: api_topalbums_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.api_topalbums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_topalbums_id_seq OWNER TO "user";

--
-- Name: api_topalbums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.api_topalbums_id_seq OWNED BY public.api_topalbums.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "user";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "user";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "user";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "user";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "user";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "user";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO "user";

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO "user";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "user";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "user";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "user";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "user";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "user";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "user";

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO "user";

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO "user";

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: fcm_django_fcmdevice; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.fcm_django_fcmdevice (
    id bigint NOT NULL,
    name character varying(255),
    active boolean NOT NULL,
    date_created timestamp with time zone,
    device_id character varying(150),
    registration_id text NOT NULL,
    type character varying(10) NOT NULL,
    user_id bigint
);


ALTER TABLE public.fcm_django_fcmdevice OWNER TO "user";

--
-- Name: fcm_django_fcmdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.fcm_django_fcmdevice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fcm_django_fcmdevice_id_seq OWNER TO "user";

--
-- Name: fcm_django_fcmdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.fcm_django_fcmdevice_id_seq OWNED BY public.fcm_django_fcmdevice.id;


--
-- Name: garpix_admin_lock_databasepagelockmodel; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_admin_lock_databasepagelockmodel (
    id bigint NOT NULL,
    url character varying(200) NOT NULL,
    url_parameters character varying(1024),
    active boolean NOT NULL,
    user_reference character varying(255),
    locked boolean NOT NULL,
    locked_at timestamp with time zone NOT NULL,
    locked_out timestamp with time zone NOT NULL,
    tab_counter smallint NOT NULL,
    CONSTRAINT garpix_admin_lock_databasepagelockmodel_tab_counter_check CHECK ((tab_counter >= 0))
);


ALTER TABLE public.garpix_admin_lock_databasepagelockmodel OWNER TO "user";

--
-- Name: garpix_admin_lock_databasepagelockmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_admin_lock_databasepagelockmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_admin_lock_databasepagelockmodel_id_seq OWNER TO "user";

--
-- Name: garpix_admin_lock_databasepagelockmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_admin_lock_databasepagelockmodel_id_seq OWNED BY public.garpix_admin_lock_databasepagelockmodel.id;


--
-- Name: garpix_auth_accesstoken; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_auth_accesstoken (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.garpix_auth_accesstoken OWNER TO "user";

--
-- Name: garpix_auth_refreshtoken; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_auth_refreshtoken (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.garpix_auth_refreshtoken OWNER TO "user";

--
-- Name: garpix_menu_menuitem; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_menu_menuitem (
    id bigint NOT NULL,
    subpage_url character varying(256),
    url character varying(1000),
    hash character varying(256) NOT NULL,
    file character varying(100),
    title_for_admin character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    title_ru character varying(100),
    icon character varying(100),
    menu_type character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    target_blank boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    sort integer NOT NULL,
    css_class character varying(100),
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    page_id bigint,
    parent_id bigint,
    CONSTRAINT garpix_menu_menuitem_level_check CHECK ((level >= 0)),
    CONSTRAINT garpix_menu_menuitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT garpix_menu_menuitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT garpix_menu_menuitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.garpix_menu_menuitem OWNER TO "user";

--
-- Name: garpix_menu_menuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_menu_menuitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_menu_menuitem_id_seq OWNER TO "user";

--
-- Name: garpix_menu_menuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_menu_menuitem_id_seq OWNED BY public.garpix_menu_menuitem.id;


--
-- Name: garpix_menu_menuitem_sites; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_menu_menuitem_sites (
    id bigint NOT NULL,
    menuitem_id bigint NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.garpix_menu_menuitem_sites OWNER TO "user";

--
-- Name: garpix_menu_menuitem_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_menu_menuitem_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_menu_menuitem_sites_id_seq OWNER TO "user";

--
-- Name: garpix_menu_menuitem_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_menu_menuitem_sites_id_seq OWNED BY public.garpix_menu_menuitem_sites.id;


--
-- Name: garpix_notify_notify; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notify (
    id bigint NOT NULL,
    phone character varying(30) NOT NULL,
    telegram_chat_id character varying(200) NOT NULL,
    telegram_secret character varying(150) NOT NULL,
    viber_chat_id character varying(200) NOT NULL,
    viber_secret_key character varying(200) NOT NULL,
    subject character varying(255) NOT NULL,
    text text NOT NULL,
    html text NOT NULL,
    email character varying(255),
    sender_email character varying(255),
    state integer NOT NULL,
    event integer,
    room_name character varying(255),
    type integer NOT NULL,
    is_read boolean NOT NULL,
    data_json text,
    send_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    sent_at timestamp with time zone,
    is_delete_after boolean NOT NULL,
    category_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.garpix_notify_notify OWNER TO "user";

--
-- Name: garpix_notify_notify_files; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notify_files (
    id bigint NOT NULL,
    notify_id bigint NOT NULL,
    notifyfile_id bigint NOT NULL
);


ALTER TABLE public.garpix_notify_notify_files OWNER TO "user";

--
-- Name: garpix_notify_notify_files_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notify_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notify_files_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notify_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notify_files_id_seq OWNED BY public.garpix_notify_notify_files.id;


--
-- Name: garpix_notify_notify_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notify_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notify_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notify_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notify_id_seq OWNED BY public.garpix_notify_notify.id;


--
-- Name: garpix_notify_notify_users_list; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notify_users_list (
    id bigint NOT NULL,
    notify_id bigint NOT NULL,
    notifyuserlist_id bigint NOT NULL
);


ALTER TABLE public.garpix_notify_notify_users_list OWNER TO "user";

--
-- Name: garpix_notify_notify_users_list_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notify_users_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notify_users_list_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notify_users_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notify_users_list_id_seq OWNED BY public.garpix_notify_notify_users_list.id;


--
-- Name: garpix_notify_notifycategory; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notifycategory (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    template text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.garpix_notify_notifycategory OWNER TO "user";

--
-- Name: garpix_notify_notifycategory_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notifycategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notifycategory_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notifycategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notifycategory_id_seq OWNED BY public.garpix_notify_notifycategory.id;


--
-- Name: garpix_notify_notifyconfig; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notifyconfig (
    id bigint NOT NULL,
    periodic integer NOT NULL,
    email_max_day_limit integer NOT NULL,
    email_max_hour_limit integer NOT NULL,
    sms_url_type integer NOT NULL,
    sms_api_id character varying(255) NOT NULL,
    sms_login character varying(255) NOT NULL,
    sms_password character varying(255) NOT NULL,
    sms_from character varying(255) NOT NULL,
    call_url_type integer NOT NULL,
    call_api_id character varying(255) NOT NULL,
    call_login character varying(255) NOT NULL,
    call_password character varying(255) NOT NULL,
    telegram_api_key character varying(255) NOT NULL,
    telegram_bot_name character varying(255) NOT NULL,
    telegram_welcome_text text NOT NULL,
    telegram_help_text text NOT NULL,
    telegram_bad_command_text text NOT NULL,
    telegram_success_added_text text NOT NULL,
    telegram_failed_added_text text NOT NULL,
    telegram_parse_mode character varying(100) NOT NULL,
    telegram_disable_notification boolean NOT NULL,
    telegram_disable_web_page_preview boolean NOT NULL,
    telegram_allow_sending_without_reply boolean NOT NULL,
    telegram_timeout double precision,
    viber_api_key character varying(255) NOT NULL,
    viber_bot_name character varying(255) NOT NULL,
    whatsapp_sender character varying(30) NOT NULL,
    whatsapp_auth_token character varying(255) NOT NULL,
    whatsapp_account_sid character varying(255) NOT NULL,
    is_email_enabled boolean NOT NULL,
    is_sms_enabled boolean NOT NULL,
    is_call_enabled boolean NOT NULL,
    is_push_enabled boolean NOT NULL,
    is_telegram_enabled boolean NOT NULL,
    is_viber_enabled boolean NOT NULL,
    is_whatsapp_enabled boolean NOT NULL,
    viber_success_added_text text NOT NULL,
    viber_failed_added_text text NOT NULL,
    viber_text_for_new_sub text NOT NULL,
    viber_welcome_text text NOT NULL,
    email_malling integer NOT NULL
);


ALTER TABLE public.garpix_notify_notifyconfig OWNER TO "user";

--
-- Name: garpix_notify_notifyconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notifyconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notifyconfig_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notifyconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notifyconfig_id_seq OWNED BY public.garpix_notify_notifyconfig.id;


--
-- Name: garpix_notify_notifyerrorlog; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notifyerrorlog (
    id bigint NOT NULL,
    error text,
    created_at timestamp with time zone NOT NULL,
    notify_id bigint NOT NULL
);


ALTER TABLE public.garpix_notify_notifyerrorlog OWNER TO "user";

--
-- Name: garpix_notify_notifyerrorlog_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notifyerrorlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notifyerrorlog_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notifyerrorlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notifyerrorlog_id_seq OWNED BY public.garpix_notify_notifyerrorlog.id;


--
-- Name: garpix_notify_notifyfile; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notifyfile (
    id bigint NOT NULL,
    file character varying(1000) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.garpix_notify_notifyfile OWNER TO "user";

--
-- Name: garpix_notify_notifyfile_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notifyfile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notifyfile_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notifyfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notifyfile_id_seq OWNED BY public.garpix_notify_notifyfile.id;


--
-- Name: garpix_notify_notifytemplate; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notifytemplate (
    id bigint NOT NULL,
    phone character varying(30) NOT NULL,
    telegram_chat_id character varying(200) NOT NULL,
    telegram_secret character varying(150) NOT NULL,
    viber_chat_id character varying(200) NOT NULL,
    viber_secret_key character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    is_delete_after boolean NOT NULL,
    text text NOT NULL,
    html_from_type text NOT NULL,
    html text NOT NULL,
    zipfile character varying(100),
    email character varying(255),
    type integer NOT NULL,
    event integer,
    created_at timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    send_at timestamp with time zone,
    category_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.garpix_notify_notifytemplate OWNER TO "user";

--
-- Name: garpix_notify_notifytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notifytemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notifytemplate_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notifytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notifytemplate_id_seq OWNED BY public.garpix_notify_notifytemplate.id;


--
-- Name: garpix_notify_notifytemplate_user_lists; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notifytemplate_user_lists (
    id bigint NOT NULL,
    notifytemplate_id bigint NOT NULL,
    notifyuserlist_id bigint NOT NULL
);


ALTER TABLE public.garpix_notify_notifytemplate_user_lists OWNER TO "user";

--
-- Name: garpix_notify_notifytemplate_user_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notifytemplate_user_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notifytemplate_user_lists_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notifytemplate_user_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notifytemplate_user_lists_id_seq OWNED BY public.garpix_notify_notifytemplate_user_lists.id;


--
-- Name: garpix_notify_notifyuserlist; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notifyuserlist (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    mail_to_all boolean NOT NULL
);


ALTER TABLE public.garpix_notify_notifyuserlist OWNER TO "user";

--
-- Name: garpix_notify_notifyuserlist_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notifyuserlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notifyuserlist_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notifyuserlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notifyuserlist_id_seq OWNED BY public.garpix_notify_notifyuserlist.id;


--
-- Name: garpix_notify_notifyuserlist_user_groups; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notifyuserlist_user_groups (
    id bigint NOT NULL,
    notifyuserlist_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.garpix_notify_notifyuserlist_user_groups OWNER TO "user";

--
-- Name: garpix_notify_notifyuserlist_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notifyuserlist_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notifyuserlist_user_groups_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notifyuserlist_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notifyuserlist_user_groups_id_seq OWNED BY public.garpix_notify_notifyuserlist_user_groups.id;


--
-- Name: garpix_notify_notifyuserlist_users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notifyuserlist_users (
    id bigint NOT NULL,
    notifyuserlist_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.garpix_notify_notifyuserlist_users OWNER TO "user";

--
-- Name: garpix_notify_notifyuserlist_users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notifyuserlist_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notifyuserlist_users_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notifyuserlist_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notifyuserlist_users_id_seq OWNED BY public.garpix_notify_notifyuserlist_users.id;


--
-- Name: garpix_notify_notifyuserlistparticipant; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_notifyuserlistparticipant (
    id bigint NOT NULL,
    phone character varying(30) NOT NULL,
    telegram_chat_id character varying(200) NOT NULL,
    telegram_secret character varying(150) NOT NULL,
    viber_chat_id character varying(200) NOT NULL,
    viber_secret_key character varying(200) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    email character varying(255),
    user_id bigint,
    user_list_id bigint NOT NULL
);


ALTER TABLE public.garpix_notify_notifyuserlistparticipant OWNER TO "user";

--
-- Name: garpix_notify_notifyuserlistparticipant_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_notifyuserlistparticipant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_notifyuserlistparticipant_id_seq OWNER TO "user";

--
-- Name: garpix_notify_notifyuserlistparticipant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_notifyuserlistparticipant_id_seq OWNED BY public.garpix_notify_notifyuserlistparticipant.id;


--
-- Name: garpix_notify_smtpaccount; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_smtpaccount (
    id bigint NOT NULL,
    host character varying(255) NOT NULL,
    port integer NOT NULL,
    is_use_tls boolean NOT NULL,
    is_use_ssl boolean NOT NULL,
    sender character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    timeout integer NOT NULL,
    is_active boolean NOT NULL,
    email_hour_used_times integer NOT NULL,
    email_day_used_times integer NOT NULL,
    email_hour_used_date timestamp with time zone NOT NULL,
    email_day_used_date timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.garpix_notify_smtpaccount OWNER TO "user";

--
-- Name: garpix_notify_smtpaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_smtpaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_smtpaccount_id_seq OWNER TO "user";

--
-- Name: garpix_notify_smtpaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_smtpaccount_id_seq OWNED BY public.garpix_notify_smtpaccount.id;


--
-- Name: garpix_notify_systemnotify; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_systemnotify (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    state integer NOT NULL,
    event integer,
    room_name character varying(255),
    type integer NOT NULL,
    data_json jsonb,
    created_at timestamp with time zone NOT NULL,
    sent_at timestamp with time zone,
    is_read boolean NOT NULL,
    user_id bigint
);


ALTER TABLE public.garpix_notify_systemnotify OWNER TO "user";

--
-- Name: garpix_notify_systemnotify_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_systemnotify_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_systemnotify_id_seq OWNER TO "user";

--
-- Name: garpix_notify_systemnotify_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_systemnotify_id_seq OWNED BY public.garpix_notify_systemnotify.id;


--
-- Name: garpix_notify_systemnotifyerrorlog; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_notify_systemnotifyerrorlog (
    id bigint NOT NULL,
    error text,
    created_at timestamp with time zone NOT NULL,
    notify_id bigint NOT NULL
);


ALTER TABLE public.garpix_notify_systemnotifyerrorlog OWNER TO "user";

--
-- Name: garpix_notify_systemnotifyerrorlog_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_notify_systemnotifyerrorlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_notify_systemnotifyerrorlog_id_seq OWNER TO "user";

--
-- Name: garpix_notify_systemnotifyerrorlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_notify_systemnotifyerrorlog_id_seq OWNED BY public.garpix_notify_systemnotifyerrorlog.id;


--
-- Name: garpix_page_basecomponent; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_page_basecomponent (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ru character varying(255),
    is_deleted boolean NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    text_title character varying(128) NOT NULL,
    text_title_ru character varying(128),
    polymorphic_ctype_id integer
);


ALTER TABLE public.garpix_page_basecomponent OWNER TO "user";

--
-- Name: garpix_page_basecomponent_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_page_basecomponent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_page_basecomponent_id_seq OWNER TO "user";

--
-- Name: garpix_page_basecomponent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_page_basecomponent_id_seq OWNED BY public.garpix_page_basecomponent.id;


--
-- Name: garpix_page_basepage; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_page_basepage (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ru character varying(255),
    is_active boolean NOT NULL,
    display_on_sitemap boolean NOT NULL,
    slug character varying(150) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    seo_title character varying(250) NOT NULL,
    seo_title_ru character varying(250),
    seo_keywords character varying(250) NOT NULL,
    seo_keywords_ru character varying(250),
    seo_description text NOT NULL,
    seo_description_ru text,
    seo_author character varying(250) NOT NULL,
    seo_author_ru character varying(250),
    seo_og_type character varying(250) NOT NULL,
    seo_image character varying(100),
    url character varying(255) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    polymorphic_ctype_id integer,
    CONSTRAINT garpix_page_basepage_level_check CHECK ((level >= 0)),
    CONSTRAINT garpix_page_basepage_lft_check CHECK ((lft >= 0)),
    CONSTRAINT garpix_page_basepage_rght_check CHECK ((rght >= 0)),
    CONSTRAINT garpix_page_basepage_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.garpix_page_basepage OWNER TO "user";

--
-- Name: garpix_page_basepage_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_page_basepage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_page_basepage_id_seq OWNER TO "user";

--
-- Name: garpix_page_basepage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_page_basepage_id_seq OWNED BY public.garpix_page_basepage.id;


--
-- Name: garpix_page_basepage_sites; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_page_basepage_sites (
    id bigint NOT NULL,
    basepage_id bigint NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.garpix_page_basepage_sites OWNER TO "user";

--
-- Name: garpix_page_basepage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_page_basepage_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_page_basepage_sites_id_seq OWNER TO "user";

--
-- Name: garpix_page_basepage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_page_basepage_sites_id_seq OWNED BY public.garpix_page_basepage_sites.id;


--
-- Name: garpix_page_garpixpagesiteconfiguration; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_page_garpixpagesiteconfiguration (
    id bigint NOT NULL,
    robots_txt text NOT NULL,
    sitemap_frequency character varying(7) NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.garpix_page_garpixpagesiteconfiguration OWNER TO "user";

--
-- Name: garpix_page_garpixpagesiteconfiguration_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_page_garpixpagesiteconfiguration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_page_garpixpagesiteconfiguration_id_seq OWNER TO "user";

--
-- Name: garpix_page_garpixpagesiteconfiguration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_page_garpixpagesiteconfiguration_id_seq OWNED BY public.garpix_page_garpixpagesiteconfiguration.id;


--
-- Name: garpix_page_grapesjshtmlcomponent; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_page_grapesjshtmlcomponent (
    basecomponent_ptr_id bigint NOT NULL,
    html text NOT NULL
);


ALTER TABLE public.garpix_page_grapesjshtmlcomponent OWNER TO "user";

--
-- Name: garpix_page_pagecomponent; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_page_pagecomponent (
    id bigint NOT NULL,
    view_order integer NOT NULL,
    component_id bigint NOT NULL,
    page_id bigint NOT NULL
);


ALTER TABLE public.garpix_page_pagecomponent OWNER TO "user";

--
-- Name: garpix_page_pagecomponent_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_page_pagecomponent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_page_pagecomponent_id_seq OWNER TO "user";

--
-- Name: garpix_page_pagecomponent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_page_pagecomponent_id_seq OWNED BY public.garpix_page_pagecomponent.id;


--
-- Name: garpix_page_seotemplate; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_page_seotemplate (
    id bigint NOT NULL,
    is_active boolean NOT NULL,
    rule_field character varying(255) NOT NULL,
    model_rule_value character varying(255),
    rule_value character varying(255),
    seo_title character varying(250) NOT NULL,
    seo_title_ru character varying(250),
    seo_keywords character varying(250) NOT NULL,
    seo_keywords_ru character varying(250),
    seo_description text NOT NULL,
    seo_description_ru text,
    seo_author character varying(250) NOT NULL,
    seo_author_ru character varying(250),
    seo_og_type character varying(250) NOT NULL,
    seo_image character varying(100),
    priority_order integer NOT NULL,
    CONSTRAINT garpix_page_seotemplate_priority_order_check CHECK ((priority_order >= 0))
);


ALTER TABLE public.garpix_page_seotemplate OWNER TO "user";

--
-- Name: garpix_page_seotemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_page_seotemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_page_seotemplate_id_seq OWNER TO "user";

--
-- Name: garpix_page_seotemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_page_seotemplate_id_seq OWNED BY public.garpix_page_seotemplate.id;


--
-- Name: garpix_page_seotemplate_sites; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_page_seotemplate_sites (
    id bigint NOT NULL,
    seotemplate_id bigint NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.garpix_page_seotemplate_sites OWNER TO "user";

--
-- Name: garpix_page_seotemplate_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_page_seotemplate_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_page_seotemplate_sites_id_seq OWNER TO "user";

--
-- Name: garpix_page_seotemplate_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_page_seotemplate_sites_id_seq OWNED BY public.garpix_page_seotemplate_sites.id;


--
-- Name: garpix_user_accesstoken; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_user_accesstoken (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.garpix_user_accesstoken OWNER TO "user";

--
-- Name: garpix_user_referraltype; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_user_referraltype (
    id bigint NOT NULL,
    title character varying(128) NOT NULL,
    referral_hash character varying(32) NOT NULL
);


ALTER TABLE public.garpix_user_referraltype OWNER TO "user";

--
-- Name: garpix_user_referraltype_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_user_referraltype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_user_referraltype_id_seq OWNER TO "user";

--
-- Name: garpix_user_referraltype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_user_referraltype_id_seq OWNED BY public.garpix_user_referraltype.id;


--
-- Name: garpix_user_referraluserlink; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_user_referraluserlink (
    id bigint NOT NULL,
    referral_type_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.garpix_user_referraluserlink OWNER TO "user";

--
-- Name: garpix_user_referraluserlink_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_user_referraluserlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_user_referraluserlink_id_seq OWNER TO "user";

--
-- Name: garpix_user_referraluserlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_user_referraluserlink_id_seq OWNED BY public.garpix_user_referraluserlink.id;


--
-- Name: garpix_user_refreshtoken; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_user_refreshtoken (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.garpix_user_refreshtoken OWNER TO "user";

--
-- Name: garpix_user_usersession; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpix_user_usersession (
    id bigint NOT NULL,
    restore_password_confirm_code character varying(15),
    is_restore_code_confirmed boolean NOT NULL,
    restore_date timestamp with time zone,
    restore_by character varying(5) NOT NULL,
    phone_confirmation_code character varying(15),
    phone_code_send_date timestamp with time zone,
    phone_confirmed_date timestamp with time zone,
    new_phone character varying(128),
    email_confirmation_code character varying(255),
    email_code_send_date timestamp with time zone,
    email_confirmed_date timestamp with time zone,
    new_email character varying(254),
    email character varying(254),
    is_email_confirmed boolean NOT NULL,
    phone character varying(128) NOT NULL,
    is_phone_confirmed boolean NOT NULL,
    token_number character varying(256),
    recognized integer NOT NULL,
    last_access timestamp with time zone NOT NULL,
    user_id bigint,
    CONSTRAINT garpix_user_usersession_recognized_check CHECK ((recognized >= 0))
);


ALTER TABLE public.garpix_user_usersession OWNER TO "user";

--
-- Name: garpix_user_usersession_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.garpix_user_usersession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garpix_user_usersession_id_seq OWNER TO "user";

--
-- Name: garpix_user_usersession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.garpix_user_usersession_id_seq OWNED BY public.garpix_user_usersession.id;


--
-- Name: garpixcms_page; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.garpixcms_page (
    basepage_ptr_id bigint NOT NULL,
    content text NOT NULL,
    content_ru text
);


ALTER TABLE public.garpixcms_page OWNER TO "user";

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id bigint,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source_refresh_token_id bigint,
    id_token_id bigint
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO "user";

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO "user";

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.oauth2_provider_accesstoken_id_seq OWNED BY public.oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.oauth2_provider_application (
    id bigint NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id bigint,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    algorithm character varying(5) NOT NULL,
    post_logout_redirect_uris text NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO "user";

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO "user";

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.oauth2_provider_application_id_seq OWNED BY public.oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    code_challenge character varying(128) NOT NULL,
    code_challenge_method character varying(10) NOT NULL,
    nonce character varying(255) NOT NULL,
    claims text NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO "user";

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO "user";

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.oauth2_provider_grant_id_seq OWNED BY public.oauth2_provider_grant.id;


--
-- Name: oauth2_provider_idtoken; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.oauth2_provider_idtoken (
    id bigint NOT NULL,
    jti uuid NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    application_id bigint,
    user_id bigint
);


ALTER TABLE public.oauth2_provider_idtoken OWNER TO "user";

--
-- Name: oauth2_provider_idtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.oauth2_provider_idtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_idtoken_id_seq OWNER TO "user";

--
-- Name: oauth2_provider_idtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.oauth2_provider_idtoken_id_seq OWNED BY public.oauth2_provider_idtoken.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO "user";

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO "user";

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.oauth2_provider_refreshtoken_id_seq OWNED BY public.oauth2_provider_refreshtoken.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO "user";

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO "user";

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO "user";

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO "user";

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO "user";

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO "user";

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO "user";

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO "user";

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO "user";

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO "user";

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: user_user; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.user_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_deleted boolean NOT NULL,
    telegram_chat_id character varying(200) NOT NULL,
    telegram_secret character varying(150) NOT NULL,
    viber_chat_id character varying(200) NOT NULL,
    viber_secret_key character varying(200) NOT NULL,
    phone_confirmation_code character varying(15),
    phone_code_send_date timestamp with time zone,
    phone_confirmed_date timestamp with time zone,
    new_phone character varying(128),
    email_confirmation_code character varying(255),
    email_code_send_date timestamp with time zone,
    email_confirmed_date timestamp with time zone,
    new_email character varying(254),
    is_email_confirmed boolean NOT NULL,
    phone character varying(128) NOT NULL,
    is_phone_confirmed boolean NOT NULL
);


ALTER TABLE public.user_user OWNER TO "user";

--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.user_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_user_groups OWNER TO "user";

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.user_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_groups_id_seq OWNER TO "user";

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.user_user_groups_id_seq OWNED BY public.user_user_groups.id;


--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO "user";

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public.user_user.id;


--
-- Name: user_user_user_permissions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.user_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_user_user_permissions OWNER TO "user";

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.user_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_user_permissions_id_seq OWNER TO "user";

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.user_user_user_permissions_id_seq OWNED BY public.user_user_user_permissions.id;


--
-- Name: api_album id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.api_album ALTER COLUMN id SET DEFAULT nextval('public.api_album_id_seq'::regclass);


--
-- Name: api_topalbums id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.api_topalbums ALTER COLUMN id SET DEFAULT nextval('public.api_topalbums_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: fcm_django_fcmdevice id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.fcm_django_fcmdevice ALTER COLUMN id SET DEFAULT nextval('public.fcm_django_fcmdevice_id_seq'::regclass);


--
-- Name: garpix_admin_lock_databasepagelockmodel id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_admin_lock_databasepagelockmodel ALTER COLUMN id SET DEFAULT nextval('public.garpix_admin_lock_databasepagelockmodel_id_seq'::regclass);


--
-- Name: garpix_menu_menuitem id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_menu_menuitem ALTER COLUMN id SET DEFAULT nextval('public.garpix_menu_menuitem_id_seq'::regclass);


--
-- Name: garpix_menu_menuitem_sites id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_menu_menuitem_sites ALTER COLUMN id SET DEFAULT nextval('public.garpix_menu_menuitem_sites_id_seq'::regclass);


--
-- Name: garpix_notify_notify id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notify_id_seq'::regclass);


--
-- Name: garpix_notify_notify_files id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify_files ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notify_files_id_seq'::regclass);


--
-- Name: garpix_notify_notify_users_list id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify_users_list ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notify_users_list_id_seq'::regclass);


--
-- Name: garpix_notify_notifycategory id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifycategory ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notifycategory_id_seq'::regclass);


--
-- Name: garpix_notify_notifyconfig id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyconfig ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notifyconfig_id_seq'::regclass);


--
-- Name: garpix_notify_notifyerrorlog id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyerrorlog ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notifyerrorlog_id_seq'::regclass);


--
-- Name: garpix_notify_notifyfile id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyfile ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notifyfile_id_seq'::regclass);


--
-- Name: garpix_notify_notifytemplate id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifytemplate ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notifytemplate_id_seq'::regclass);


--
-- Name: garpix_notify_notifytemplate_user_lists id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifytemplate_user_lists ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notifytemplate_user_lists_id_seq'::regclass);


--
-- Name: garpix_notify_notifyuserlist id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notifyuserlist_id_seq'::regclass);


--
-- Name: garpix_notify_notifyuserlist_user_groups id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist_user_groups ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notifyuserlist_user_groups_id_seq'::regclass);


--
-- Name: garpix_notify_notifyuserlist_users id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist_users ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notifyuserlist_users_id_seq'::regclass);


--
-- Name: garpix_notify_notifyuserlistparticipant id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlistparticipant ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_notifyuserlistparticipant_id_seq'::regclass);


--
-- Name: garpix_notify_smtpaccount id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_smtpaccount ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_smtpaccount_id_seq'::regclass);


--
-- Name: garpix_notify_systemnotify id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_systemnotify ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_systemnotify_id_seq'::regclass);


--
-- Name: garpix_notify_systemnotifyerrorlog id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_systemnotifyerrorlog ALTER COLUMN id SET DEFAULT nextval('public.garpix_notify_systemnotifyerrorlog_id_seq'::regclass);


--
-- Name: garpix_page_basecomponent id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basecomponent ALTER COLUMN id SET DEFAULT nextval('public.garpix_page_basecomponent_id_seq'::regclass);


--
-- Name: garpix_page_basepage id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basepage ALTER COLUMN id SET DEFAULT nextval('public.garpix_page_basepage_id_seq'::regclass);


--
-- Name: garpix_page_basepage_sites id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basepage_sites ALTER COLUMN id SET DEFAULT nextval('public.garpix_page_basepage_sites_id_seq'::regclass);


--
-- Name: garpix_page_garpixpagesiteconfiguration id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_garpixpagesiteconfiguration ALTER COLUMN id SET DEFAULT nextval('public.garpix_page_garpixpagesiteconfiguration_id_seq'::regclass);


--
-- Name: garpix_page_pagecomponent id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_pagecomponent ALTER COLUMN id SET DEFAULT nextval('public.garpix_page_pagecomponent_id_seq'::regclass);


--
-- Name: garpix_page_seotemplate id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_seotemplate ALTER COLUMN id SET DEFAULT nextval('public.garpix_page_seotemplate_id_seq'::regclass);


--
-- Name: garpix_page_seotemplate_sites id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_seotemplate_sites ALTER COLUMN id SET DEFAULT nextval('public.garpix_page_seotemplate_sites_id_seq'::regclass);


--
-- Name: garpix_user_referraltype id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_referraltype ALTER COLUMN id SET DEFAULT nextval('public.garpix_user_referraltype_id_seq'::regclass);


--
-- Name: garpix_user_referraluserlink id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_referraluserlink ALTER COLUMN id SET DEFAULT nextval('public.garpix_user_referraluserlink_id_seq'::regclass);


--
-- Name: garpix_user_usersession id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_usersession ALTER COLUMN id SET DEFAULT nextval('public.garpix_user_usersession_id_seq'::regclass);


--
-- Name: oauth2_provider_accesstoken id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: oauth2_provider_application id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass);


--
-- Name: oauth2_provider_grant id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass);


--
-- Name: oauth2_provider_idtoken id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_idtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_idtoken_id_seq'::regclass);


--
-- Name: oauth2_provider_refreshtoken id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: user_user id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user ALTER COLUMN id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Name: user_user_groups id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_user_groups_id_seq'::regclass);


--
-- Name: user_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: api_album; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.api_album (id, created_at, title, image, author_id, views, thumbnail) FROM stdin;
\.


--
-- Data for Name: api_topalbums; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.api_topalbums (id, created_at, hash_key, webm_file) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add session	4	add_session
14	Can change session	4	change_session
15	Can delete session	4	delete_session
16	Can view session	4	view_session
17	Can add site	5	add_site
18	Can change site	5	change_site
19	Can delete site	5	delete_site
20	Can view site	5	view_site
21	Can add FCM device	6	add_fcmdevice
22	Can change FCM device	6	change_fcmdevice
23	Can delete FCM device	6	delete_fcmdevice
24	Can view FCM device	6	view_fcmdevice
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add token	8	add_tokenproxy
30	Can change token	8	change_tokenproxy
31	Can delete token	8	delete_tokenproxy
32	Can view token	8	view_tokenproxy
33	Can add application	9	add_application
34	Can change application	9	change_application
35	Can delete application	9	delete_application
36	Can view application	9	view_application
37	Can add access token	10	add_accesstoken
38	Can change access token	10	change_accesstoken
39	Can delete access token	10	delete_accesstoken
40	Can view access token	10	view_accesstoken
41	Can add grant	11	add_grant
42	Can change grant	11	change_grant
43	Can delete grant	11	delete_grant
44	Can view grant	11	view_grant
45	Can add refresh token	12	add_refreshtoken
46	Can change refresh token	12	change_refreshtoken
47	Can delete refresh token	12	delete_refreshtoken
48	Can view refresh token	12	view_refreshtoken
49	Can add id token	13	add_idtoken
50	Can change id token	13	change_idtoken
51	Can delete id token	13	delete_idtoken
52	Can view id token	13	view_idtoken
53	Can add association	14	add_association
54	Can change association	14	change_association
55	Can delete association	14	delete_association
56	Can view association	14	view_association
57	Can add code	15	add_code
58	Can change code	15	change_code
59	Can delete code	15	delete_code
60	Can view code	15	view_code
61	Can add nonce	16	add_nonce
62	Can change nonce	16	change_nonce
63	Can delete nonce	16	delete_nonce
64	Can view nonce	16	view_nonce
65	Can add user social auth	17	add_usersocialauth
66	Can change user social auth	17	change_usersocialauth
67	Can delete user social auth	17	delete_usersocialauth
68	Can view user social auth	17	view_usersocialauth
69	Can add partial	18	add_partial
70	Can change partial	18	change_partial
71	Can delete partial	18	delete_partial
72	Can view partial	18	view_partial
73	Can add Компонент	19	add_basecomponent
74	Can change Компонент	19	change_basecomponent
75	Can delete Компонент	19	delete_basecomponent
76	Can view Компонент	19	view_basecomponent
77	Can add Структура страниц	20	add_basepage
78	Can change Структура страниц	20	change_basepage
79	Can delete Структура страниц	20	delete_basepage
80	Can view Структура страниц	20	view_basepage
81	Can add GrapesJs компонент	21	add_grapesjshtmlcomponent
82	Can change GrapesJs компонент	21	change_grapesjshtmlcomponent
83	Can delete GrapesJs компонент	21	delete_grapesjshtmlcomponent
84	Can view GrapesJs компонент	21	view_grapesjshtmlcomponent
85	Can add Шаблон для seo	22	add_seotemplate
86	Can change Шаблон для seo	22	change_seotemplate
87	Can delete Шаблон для seo	22	delete_seotemplate
88	Can view Шаблон для seo	22	view_seotemplate
89	Can add Компонент страницы	23	add_pagecomponent
90	Can change Компонент страницы	23	change_pagecomponent
91	Can delete Компонент страницы	23	delete_pagecomponent
92	Can view Компонент страницы	23	view_pagecomponent
93	Can add Настройки	24	add_garpixpagesiteconfiguration
94	Can change Настройки	24	change_garpixpagesiteconfiguration
95	Can delete Настройки	24	delete_garpixpagesiteconfiguration
96	Can view Настройки	24	view_garpixpagesiteconfiguration
97	Can add Пункт меню	25	add_menuitem
98	Can change Пункт меню	25	change_menuitem
99	Can delete Пункт меню	25	delete_menuitem
100	Can view Пункт меню	25	view_menuitem
101	Can add Уведомление	26	add_notify
102	Can change Уведомление	26	change_notify
103	Can delete Уведомление	26	delete_notify
104	Can view Уведомление	26	view_notify
105	Can add Категория	27	add_notifycategory
106	Can change Категория	27	change_notifycategory
107	Can delete Категория	27	delete_notifycategory
108	Can view Категория	27	view_notifycategory
109	Can add Настройка	28	add_notifyconfig
110	Can change Настройка	28	change_notifyconfig
111	Can delete Настройка	28	delete_notifyconfig
112	Can view Настройка	28	view_notifyconfig
113	Can add Лог отправки уведомления	29	add_notifyerrorlog
114	Can change Лог отправки уведомления	29	change_notifyerrorlog
115	Can delete Лог отправки уведомления	29	delete_notifyerrorlog
116	Can view Лог отправки уведомления	29	view_notifyerrorlog
117	Can add Файл	30	add_notifyfile
118	Can change Файл	30	change_notifyfile
119	Can delete Файл	30	delete_notifyfile
120	Can view Файл	30	view_notifyfile
121	Can add Шаблон	31	add_notifytemplate
122	Can change Шаблон	31	change_notifytemplate
123	Can delete Шаблон	31	delete_notifytemplate
124	Can view Шаблон	31	view_notifytemplate
125	Can add Список пользователей для рассылки	32	add_notifyuserlist
126	Can change Список пользователей для рассылки	32	change_notifyuserlist
127	Can delete Список пользователей для рассылки	32	delete_notifyuserlist
128	Can view Список пользователей для рассылки	32	view_notifyuserlist
129	Can add Дополнительный участник списка рассылки	33	add_notifyuserlistparticipant
130	Can change Дополнительный участник списка рассылки	33	change_notifyuserlistparticipant
131	Can delete Дополнительный участник списка рассылки	33	delete_notifyuserlistparticipant
132	Can view Дополнительный участник списка рассылки	33	view_notifyuserlistparticipant
133	Can add SMTP аккаунт	34	add_smtpaccount
134	Can change SMTP аккаунт	34	change_smtpaccount
135	Can delete SMTP аккаунт	34	delete_smtpaccount
136	Can view SMTP аккаунт	34	view_smtpaccount
137	Can add Ситемное уведомление	35	add_systemnotify
138	Can change Ситемное уведомление	35	change_systemnotify
139	Can delete Ситемное уведомление	35	delete_systemnotify
140	Can view Ситемное уведомление	35	view_systemnotify
141	Can add FCM аккаунт	36	add_notifydevice
142	Can change FCM аккаунт	36	change_notifydevice
143	Can delete FCM аккаунт	36	delete_notifydevice
144	Can view FCM аккаунт	36	view_notifydevice
145	Can add Лог отправки системного уведомления	37	add_systemnotifyerrorlog
146	Can change Лог отправки системного уведомления	37	change_systemnotifyerrorlog
147	Can delete Лог отправки системного уведомления	37	delete_systemnotifyerrorlog
148	Can view Лог отправки системного уведомления	37	view_systemnotifyerrorlog
149	Can add Access Token	38	add_accesstoken
150	Can change Access Token	38	change_accesstoken
151	Can delete Access Token	38	delete_accesstoken
152	Can view Access Token	38	view_accesstoken
153	Can add referral type	39	add_referraltype
154	Can change referral type	39	change_referraltype
155	Can delete referral type	39	delete_referraltype
156	Can view referral type	39	view_referraltype
157	Can add referral user link	40	add_referraluserlink
158	Can change referral user link	40	change_referraluserlink
159	Can delete referral user link	40	delete_referraluserlink
160	Can view referral user link	40	view_referraluserlink
161	Can add Refresh Token	41	add_refreshtoken
162	Can change Refresh Token	41	change_refreshtoken
163	Can delete Refresh Token	41	delete_refreshtoken
164	Can view Refresh Token	41	view_refreshtoken
165	Can add Системный пользователь	42	add_usersession
166	Can change Системный пользователь	42	change_usersession
167	Can delete Системный пользователь	42	delete_usersession
168	Can view Системный пользователь	42	view_usersession
169	Can add Страница	43	add_page
170	Can change Страница	43	change_page
171	Can delete Страница	43	delete_page
172	Can view Страница	43	view_page
173	Can add Пользователь	44	add_user
174	Can change Пользователь	44	change_user
175	Can delete Пользователь	44	delete_user
176	Can view Пользователь	44	view_user
177	Can add Page Lock	45	add_databasepagelockmodel
178	Can change Page Lock	45	change_databasepagelockmodel
179	Can delete Page Lock	45	delete_databasepagelockmodel
180	Can view Page Lock	45	view_databasepagelockmodel
181	Can add log entry	46	add_logentry
182	Can change log entry	46	change_logentry
183	Can delete log entry	46	delete_logentry
184	Can view log entry	46	view_logentry
185	Can add Фотография	47	add_album
186	Can change Фотография	47	change_album
187	Can delete Фотография	47	delete_album
188	Can view Фотография	47	view_album
189	Can add Access Token	48	add_accesstoken
190	Can change Access Token	48	change_accesstoken
191	Can delete Access Token	48	delete_accesstoken
192	Can view Access Token	48	view_accesstoken
193	Can add Refresh Token	49	add_refreshtoken
194	Can change Refresh Token	49	change_refreshtoken
195	Can delete Refresh Token	49	delete_refreshtoken
196	Can view Refresh Token	49	view_refreshtoken
197	Can add Топ фотографий	50	add_topalbums
198	Can change Топ фотографий	50	change_topalbums
199	Can delete Топ фотографий	50	delete_topalbums
200	Can view Топ фотографий	50	view_topalbums
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-08-14 08:57:16.952896+00	2	test2	1	[{"added": {}}]	44	1
2	2023-08-14 08:57:42.630341+00	2	test2	2	[{"changed": {"fields": ["Active"]}}]	44	1
3	2023-08-14 08:57:57.675709+00	2	test2	3		44	1
4	2023-08-14 16:31:18.076473+00	1	123	1	[{"added": {}}]	47	1
5	2023-08-14 16:31:27.463847+00	1	123	3		47	1
6	2023-08-15 04:26:02.022938+00	2	Test	1	[{"added": {}}]	47	1
7	2023-08-15 04:48:29.714884+00	3	test2	1	[{"added": {}}]	47	1
8	2023-08-15 04:59:53.777568+00	3	test2	2	[]	47	1
9	2023-08-15 05:02:55.462454+00	3	test2	2	[]	47	1
10	2023-08-15 05:11:00.759143+00	3	test2	2	[]	47	1
11	2023-08-15 05:11:52.105007+00	3	test2	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	47	1
12	2023-08-15 08:57:31.846005+00	12	423123215552421	3		47	1
13	2023-08-15 08:59:27.969195+00	9	432131256	2	[]	47	1
14	2023-08-15 09:02:15.443082+00	14	hello	1	[{"added": {}}]	47	1
15	2023-08-15 09:02:41.668268+00	7	4321312	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	47	1
16	2023-08-15 09:03:40.364013+00	11	4231232155	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	47	1
17	2023-08-15 09:09:04.774952+00	15	aaa	1	[{"added": {}}]	47	1
18	2023-08-15 09:10:42.737667+00	16	ABC	1	[{"added": {}}]	47	1
19	2023-08-15 09:44:05.385688+00	16	ABC	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u044b"]}}]	47	1
20	2023-08-15 10:19:06.002924+00	25	ABC	1	[{"added": {}}]	47	1
21	2023-08-17 07:44:29.586988+00	43	gba	1	[{"added": {}}]	47	1
22	2023-08-17 07:46:06.346064+00	44	ds	1	[{"added": {}}]	47	1
23	2023-08-17 07:46:54.938622+00	44	dsd	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
24	2023-08-17 07:48:33.091992+00	44	dsdd	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
25	2023-08-17 07:49:55.026587+00	44	dsddas	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
26	2023-08-17 08:23:03.171201+00	44	dsddasddds	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
27	2023-08-17 08:24:04.599435+00	45	sda	1	[{"added": {}}]	47	1
28	2023-08-17 08:25:59.530751+00	45	sdad	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
29	2023-08-17 08:26:31.141058+00	45	ddsdad	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
30	2023-08-17 08:26:49.77706+00	45	ddsdadss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
31	2023-08-17 08:28:09.482424+00	45	ddsdadsss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
32	2023-08-17 08:32:35.766981+00	45	ddsdadsssd	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
33	2023-08-17 08:39:14.871492+00	45	ddsdadsssddd	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
34	2023-08-17 08:40:54.139846+00	45	ddsdadsssd	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
35	2023-08-17 08:41:17.348534+00	45	ddsdadsssds	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
36	2023-08-17 08:46:52.396807+00	45	ddsdadsssdss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
37	2023-08-17 08:48:12.265765+00	45	ddsdadsssdssd	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
38	2023-08-17 08:48:52.779621+00	45	ddsdadsssdssds	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
39	2023-08-17 08:49:21.781328+00	44	dsddasdddss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
40	2023-08-17 08:51:24.194424+00	45	ddsdadsssdss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
41	2023-08-17 08:53:28.786829+00	45	ddsdadsssdsss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
42	2023-08-17 08:57:55.464713+00	46	dsdd	1	[{"added": {}}]	47	1
43	2023-08-17 09:08:38.712525+00	46	dsdds	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
44	2023-08-17 09:08:56.100146+00	46	dsddss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
45	2023-08-17 09:09:41.01175+00	46	dsddss	2	[{"changed": {"fields": ["\\u041c\\u0438\\u043d\\u0438\\u0430\\u0442\\u044e\\u0440\\u043d\\u043e\\u0435 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	47	1
46	2023-08-17 09:14:08.234766+00	46	dsddssd	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
47	2023-08-17 09:42:20.3827+00	46	dsddssds	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
48	2023-08-17 09:43:30.221816+00	46	sdsddssds	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
49	2023-08-17 09:44:11.746088+00	46	sdsddssdssss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
50	2023-08-17 09:46:53.033922+00	46	ssssdsddssdssss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
51	2023-08-17 09:47:24.188166+00	46	ssssdsddssdsssss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
52	2023-08-17 09:48:17.330222+00	46	ssssdsddssdssssss	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
53	2023-08-17 09:54:49.875273+00	46	ssssdsddssdssssssb	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
54	2023-08-17 09:55:16.589074+00	3	test23	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
55	2023-08-17 09:56:08.780483+00	3	test234	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
56	2023-08-17 11:37:54.320233+00	46	ssssdsddssdssssssb	3		47	1
57	2023-08-17 11:37:54.335302+00	45	ddsdadsssdsss	3		47	1
58	2023-08-17 11:37:54.337563+00	44	dsddasdddss	3		47	1
59	2023-08-17 11:37:54.339116+00	43	gba	3		47	1
60	2023-08-17 11:37:54.341402+00	31	233213	3		47	1
61	2023-08-17 11:37:54.34373+00	14	hello	3		47	1
62	2023-08-17 11:37:54.345717+00	11	4231232155	3		47	1
63	2023-08-17 11:37:54.347507+00	9	432131256	3		47	1
64	2023-08-17 11:37:54.348808+00	7	4321312	3		47	1
65	2023-08-17 11:37:54.350509+00	5	332131231	3		47	1
66	2023-08-17 11:37:54.351989+00	4	test333	3		47	1
67	2023-08-17 11:37:54.353757+00	3	test234	3		47	1
68	2023-08-17 11:37:54.355222+00	2	Test	3		47	1
69	2023-08-17 11:38:32.074467+00	47	Test	1	[{"added": {}}]	47	1
70	2023-08-17 11:38:50.898814+00	47	Test	2	[]	47	1
71	2023-08-17 11:39:12.457804+00	47	Test1	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
72	2023-08-17 11:39:22.633409+00	47	Test	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
73	2023-08-17 11:59:05.410969+00	49	Test Value	3		47	1
74	2023-08-17 12:01:44.787442+00	51	Test Value 2	3		47	1
75	2023-08-17 12:01:44.802178+00	50	Test Value	3		47	1
76	2023-08-18 04:52:55.821989+00	56	sdads	1	[{"added": {}}]	47	1
77	2023-08-18 04:53:00.293305+00	56	sdadsd	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
78	2023-08-18 04:54:08.980604+00	56	sdadsdd	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
79	2023-08-18 04:54:41.079124+00	56	ddsdadsdd	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
80	2023-08-18 04:54:51.070665+00	56	ddsdadsdd	3		47	1
81	2023-08-18 04:54:51.079164+00	55	Test Value 5	3		47	1
82	2023-08-18 04:54:51.082185+00	54	Test Value 2345	3		47	1
83	2023-08-18 04:54:51.084494+00	53	Test Value 234	3		47	1
84	2023-08-18 04:54:51.087239+00	52	Test Value 2	3		47	1
85	2023-08-18 04:54:51.089594+00	47	Test	3		47	1
86	2023-08-18 05:17:38.08516+00	None	scads	1	[{"added": {}}]	47	1
87	2023-08-18 05:17:49.400082+00	None	dsdas	1	[{"added": {}}]	47	1
88	2023-08-18 05:18:42.960578+00	None	dsadas	1	[{"added": {}}]	47	1
89	2023-08-18 07:49:49.026326+00	None	abc	1	[{"added": {}}]	47	1
90	2023-08-18 07:52:52.179781+00	None	a	1	[{"added": {}}]	47	1
91	2023-08-18 07:54:01.421853+00	None	sdads	1	[{"added": {}}]	47	1
92	2023-08-18 07:56:20.55387+00	None	ssd	1	[{"added": {}}]	47	1
93	2023-08-18 07:57:34.974729+00	None	sda	1	[{"added": {}}]	47	1
94	2023-08-18 07:59:07.333793+00	57	Test 1	1	[{"added": {}}]	47	1
95	2023-08-18 07:59:54.826932+00	57	Test 1	3		47	1
96	2023-08-18 08:00:56.453315+00	58	Perfect test	1	[{"added": {}}]	47	1
97	2023-08-18 08:02:02.322542+00	58	Perfect test 1	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
98	2023-08-18 08:02:47.209263+00	58	Perfect test	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	47	1
99	2023-08-18 08:03:01.290243+00	58	Perfect test	2	[]	47	1
100	2023-08-18 08:03:45.006997+00	59	Perfect test 2	1	[{"added": {}}]	47	1
101	2023-08-18 09:15:58.867593+00	86	Other test	1	[{"added": {}}]	47	1
102	2023-08-18 09:37:43.558371+00	88	Test Value 31	3		47	1
103	2023-08-18 09:37:43.566898+00	86	Other test	3		47	1
104	2023-08-18 09:37:43.569062+00	85	Test Value 30	3		47	1
105	2023-08-18 09:37:43.570478+00	84	Test Value 29	3		47	1
106	2023-08-18 09:37:43.572202+00	83	Test Value 28	3		47	1
107	2023-08-18 09:37:43.573637+00	82	Test Value 27	3		47	1
108	2023-08-18 09:37:43.574963+00	81	Test Value 26	3		47	1
109	2023-08-18 09:37:43.576385+00	80	Test Value 25	3		47	1
110	2023-08-18 09:37:43.577552+00	79	Test Value 23	3		47	1
111	2023-08-18 09:37:43.578876+00	78	Test Value 22	3		47	1
112	2023-08-18 09:37:43.580232+00	77	Test Value 21	3		47	1
113	2023-08-18 09:37:43.581553+00	76	Test Value 20	3		47	1
114	2023-08-18 09:37:43.583291+00	75	Test Value 19	3		47	1
115	2023-08-18 09:37:43.58502+00	74	Test Value 18	3		47	1
116	2023-08-18 09:37:43.586258+00	73	Test Value 17	3		47	1
117	2023-08-18 09:37:43.587862+00	72	Test Value 15	3		47	1
118	2023-08-18 09:37:43.589473+00	70	Test Value 14	3		47	1
119	2023-08-18 09:37:43.591053+00	69	Test Value 13	3		47	1
120	2023-08-18 09:37:43.592269+00	67	Test Value 12	3		47	1
121	2023-08-18 09:37:43.593596+00	66	Test Value 11	3		47	1
122	2023-08-18 09:37:43.595614+00	65	Test Value 10	3		47	1
123	2023-08-18 09:37:43.597535+00	64	Test Value 9	3		47	1
124	2023-08-18 09:37:43.599066+00	63	Test Value 8	3		47	1
125	2023-08-18 09:37:43.601288+00	62	Test Value 7	3		47	1
126	2023-08-18 09:37:43.602379+00	61	Test Value 6	3		47	1
127	2023-08-18 09:37:43.604141+00	60	Test Value 5	3		47	1
128	2023-08-18 09:37:43.605616+00	59	Perfect test 2	3		47	1
129	2023-08-18 09:37:43.606784+00	58	Perfect test	3		47	1
130	2023-08-18 14:39:01.9522+00	119	OOOO	1	[{"added": {}}]	47	1
131	2023-08-22 12:26:18.153545+00	1	Настройки	2	[{"changed": {"fields": ["\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0438\\u0442\\u044c \\u043e\\u0442\\u043f\\u0440\\u0430\\u0432\\u043a\\u0443 SMS", "\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0438\\u0442\\u044c \\u043e\\u0442\\u043f\\u0440\\u0430\\u0432\\u043a\\u0443 \\u0437\\u0432\\u043e\\u043d\\u043a\\u043e\\u0432", "\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0438\\u0442\\u044c \\u043e\\u0442\\u043f\\u0440\\u0430\\u0432\\u043a\\u0443 PUSH", "\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0438\\u0442\\u044c \\u043e\\u0442\\u043f\\u0440\\u0430\\u0432\\u043a\\u0443 Telegram", "\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0438\\u0442\\u044c \\u043e\\u0442\\u043f\\u0440\\u0430\\u0432\\u043a\\u0443 Viber", "\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0438\\u0442\\u044c \\u043e\\u0442\\u043f\\u0440\\u0430\\u0432\\u043a\\u0443 WhatsApp"]}}]	28	1
132	2023-08-22 12:42:52.399994+00	1	Стандарт	1	[{"added": {}}]	27	1
133	2023-08-22 12:55:09.201787+00	1	Топ-3 просматриваемых фото сайта за месяц	1	[{"added": {}}]	31	1
134	2023-08-22 12:55:18.118305+00	1	Топ-3 просматриваемых фото сайта за месяц	2	[]	31	1
135	2023-08-22 12:55:22.271681+00	1	Топ-3 просматриваемых фото сайта за месяц	2	[]	31	1
136	2023-08-22 13:43:42.191135+00	1	test	2	[{"changed": {"fields": ["Email address"]}}]	44	1
137	2023-08-22 13:50:53.353198+00	1	Топ-3 просматриваемых фото сайта за месяц	2	[{"changed": {"fields": ["HTML"]}}]	31	1
138	2023-08-23 11:28:58.330189+00	1	123	1	[{"added": {}}]	50	1
139	2023-08-23 11:31:17.651302+00	1	123	3		50	1
140	2023-08-23 13:29:49.660663+00	2	fc08ffa0f6d72dd9c42b8d266770cb7c01265022f1a1c1fe871e08323c91e082	1	[{"added": {}}]	50	1
141	2023-08-23 13:32:06.247435+00	2	fc08ffa0f6d72dd9c42b8d266770cb7c01265022f1a1c1fe871e08323c91e082	3		50	1
142	2023-08-24 07:53:43.051461+00	4	60cdc6ec6fd3ef0925d67b7414ca7a1be5eb7a4e661a696e6d58ff0c6156bfdd	3		50	1
143	2023-08-24 07:53:43.06814+00	3	cd42f3d72c6caa9b5f8a7b8e28f1145ba595f5379d4a0c0331cdc411e0b84f04	3		50	1
144	2023-08-24 07:57:31.581638+00	5	60cdc6ec6fd3ef0925d67b7414ca7a1be5eb7a4e661a696e6d58ff0c6156bfdd	3		50	1
145	2023-08-24 08:30:36.715207+00	7	60cdc6ec6fd3ef0925d67b7414ca7a1be5eb7a4e661a696e6d58ff0c6156bfdd	3		50	1
146	2023-08-24 08:30:36.731451+00	6	cd42f3d72c6caa9b5f8a7b8e28f1145ba595f5379d4a0c0331cdc411e0b84f04	3		50	1
147	2023-08-24 09:27:16.040137+00	127	Test Value 102	3		47	1
148	2023-08-24 09:27:16.058476+00	123	APPLE	3		47	1
149	2023-08-24 09:27:16.061797+00	122	Test Value 10	3		47	1
150	2023-08-24 09:27:16.072578+00	121	Test Value 00	3		47	1
151	2023-08-24 09:27:16.075365+00	120	Test Value 0	3		47	1
152	2023-08-24 09:27:16.077773+00	119	OOOO	3		47	1
153	2023-08-24 09:27:16.080088+00	117	Test Value 150	3		47	1
154	2023-08-24 09:27:16.081649+00	116	Test Value 115	3		47	1
155	2023-08-24 09:27:16.083671+00	114	Test Value 114	3		47	1
156	2023-08-24 09:27:16.085447+00	113	Test Value 113	3		47	1
157	2023-08-24 09:27:16.088034+00	112	Test Value 112	3		47	1
158	2023-08-24 09:27:16.100106+00	111	Test Value 111	3		47	1
159	2023-08-24 09:27:16.102647+00	110	Test Value 101	3		47	1
160	2023-08-24 09:27:16.104068+00	109	Test Value 100	3		47	1
161	2023-08-24 09:27:16.105516+00	108	Test Value 59	3		47	1
162	2023-08-24 09:27:16.106957+00	107	Test Value 53	3		47	1
163	2023-08-24 09:27:16.109232+00	106	Test Value 51	3		47	1
164	2023-08-24 09:27:16.111594+00	105	Test Value 50	3		47	1
165	2023-08-24 09:27:16.113652+00	104	Test Value 49	3		47	1
166	2023-08-24 09:27:16.115803+00	103	Test Value 48	3		47	1
167	2023-08-24 09:27:16.118136+00	102	Test Value 47	3		47	1
168	2023-08-24 09:27:16.119877+00	101	Test Value 46	3		47	1
169	2023-08-24 09:27:16.121581+00	100	Test Value 36	3		47	1
170	2023-08-24 09:27:16.123636+00	99	Test Value 35	3		47	1
171	2023-08-24 09:27:16.125248+00	98	Test Value 33	3		47	1
172	2023-08-24 09:27:16.127561+00	97	Test Value 29	3		47	1
173	2023-08-24 09:27:16.12937+00	96	Test Value 28	3		47	1
174	2023-08-24 09:27:16.13093+00	95	Test Value 27	3		47	1
175	2023-08-24 09:27:16.132273+00	94	Test Value 25	3		47	1
176	2023-08-24 09:27:16.133663+00	93	Test Value 24	3		47	1
177	2023-08-24 09:27:16.135141+00	91	Test Value 23	3		47	1
178	2023-08-24 09:27:16.136607+00	90	Test Value 2	3		47	1
179	2023-08-24 09:27:16.138554+00	89	Test Value	3		47	1
180	2023-08-24 09:27:53.595933+00	9	cd42f3d72c6caa9b5f8a7b8e28f1145ba595f5379d4a0c0331cdc411e0b84f04	3		50	1
181	2023-08-24 09:27:53.605581+00	8	60cdc6ec6fd3ef0925d67b7414ca7a1be5eb7a4e661a696e6d58ff0c6156bfdd	3		50	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	fcm_django	fcmdevice
7	authtoken	token
8	authtoken	tokenproxy
9	oauth2_provider	application
10	oauth2_provider	accesstoken
11	oauth2_provider	grant
12	oauth2_provider	refreshtoken
13	oauth2_provider	idtoken
14	social_django	association
15	social_django	code
16	social_django	nonce
17	social_django	usersocialauth
18	social_django	partial
19	garpix_page	basecomponent
20	garpix_page	basepage
21	garpix_page	grapesjshtmlcomponent
22	garpix_page	seotemplate
23	garpix_page	pagecomponent
24	garpix_page	garpixpagesiteconfiguration
25	garpix_menu	menuitem
26	garpix_notify	notify
27	garpix_notify	notifycategory
28	garpix_notify	notifyconfig
29	garpix_notify	notifyerrorlog
30	garpix_notify	notifyfile
31	garpix_notify	notifytemplate
32	garpix_notify	notifyuserlist
33	garpix_notify	notifyuserlistparticipant
34	garpix_notify	smtpaccount
35	garpix_notify	systemnotify
36	garpix_notify	notifydevice
37	garpix_notify	systemnotifyerrorlog
38	garpix_user	accesstoken
39	garpix_user	referraltype
40	garpix_user	referraluserlink
41	garpix_user	refreshtoken
42	garpix_user	usersession
43	garpixcms	page
44	user	user
45	garpix_admin_lock	databasepagelockmodel
46	admin	logentry
47	api	album
48	garpix_auth	accesstoken
49	garpix_auth	refreshtoken
50	api	topalbums
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-08-14 07:32:37.198601+00
2	contenttypes	0002_remove_content_type_name	2023-08-14 07:32:37.215363+00
3	auth	0001_initial	2023-08-14 07:32:37.308615+00
4	auth	0002_alter_permission_name_max_length	2023-08-14 07:32:37.319384+00
5	auth	0003_alter_user_email_max_length	2023-08-14 07:32:37.327983+00
6	auth	0004_alter_user_username_opts	2023-08-14 07:32:37.366705+00
7	auth	0005_alter_user_last_login_null	2023-08-14 07:32:37.373014+00
8	auth	0006_require_contenttypes_0002	2023-08-14 07:32:37.37683+00
9	auth	0007_alter_validators_add_error_messages	2023-08-14 07:32:37.382415+00
10	auth	0008_alter_user_username_max_length	2023-08-14 07:32:37.387962+00
11	auth	0009_alter_user_last_name_max_length	2023-08-14 07:32:37.393041+00
12	auth	0010_alter_group_name_max_length	2023-08-14 07:32:37.401827+00
13	auth	0011_update_proxy_permissions	2023-08-14 07:32:37.406928+00
14	auth	0012_alter_user_first_name_max_length	2023-08-14 07:32:37.411986+00
15	user	0001_initial	2023-08-14 07:32:37.521357+00
16	admin	0001_initial	2023-08-14 07:32:37.559626+00
17	admin	0002_logentry_remove_auto_add	2023-08-14 07:32:37.569155+00
18	admin	0003_logentry_add_action_flag_choices	2023-08-14 07:32:37.575675+00
19	authtoken	0001_initial	2023-08-14 07:32:37.605983+00
20	authtoken	0002_auto_20160226_1747	2023-08-14 07:32:37.626421+00
21	authtoken	0003_tokenproxy	2023-08-14 07:32:37.630423+00
22	fcm_django	0001_initial	2023-08-14 07:32:37.656578+00
23	fcm_django	0002_fcmdevice_user	2023-08-14 07:32:37.669619+00
24	garpix_admin_lock	0001_initial	2023-08-14 07:32:37.693965+00
25	sites	0001_initial	2023-08-14 07:32:37.705242+00
26	sites	0002_alter_domain_unique	2023-08-14 07:32:37.717474+00
27	garpix_page	0001_initial	2023-08-14 07:32:37.986149+00
28	garpix_menu	0001_initial	2023-08-14 07:32:38.014731+00
29	garpix_menu	0002_initial	2023-08-14 07:32:38.103355+00
30	garpix_menu	0003_alter_menuitem_menu_type	2023-08-14 07:32:38.114995+00
31	garpix_notify	0001_initial	2023-08-14 07:32:38.359126+00
32	garpix_notify	0002_initial	2023-08-14 07:32:38.789042+00
33	garpix_notify	0003_auto_20230811_1309	2023-08-14 07:32:38.824318+00
34	garpix_user	0001_initial	2023-08-14 07:32:38.901458+00
35	garpix_user	0002_initial	2023-08-14 07:32:39.021554+00
36	garpixcms	0001_initial	2023-08-14 07:32:39.060111+00
37	oauth2_provider	0001_initial	2023-08-14 07:32:39.372762+00
38	oauth2_provider	0002_auto_20190406_1805	2023-08-14 07:32:39.408888+00
39	oauth2_provider	0003_auto_20201211_1314	2023-08-14 07:32:39.426331+00
40	oauth2_provider	0004_auto_20200902_2022	2023-08-14 07:32:39.580808+00
41	oauth2_provider	0005_auto_20211222_2352	2023-08-14 07:32:39.7345+00
42	oauth2_provider	0006_alter_application_client_secret	2023-08-14 07:32:39.775662+00
43	oauth2_provider	0007_application_post_logout_redirect_uris	2023-08-14 07:32:39.793701+00
44	sessions	0001_initial	2023-08-14 07:32:39.820638+00
45	default	0001_initial	2023-08-14 07:32:39.951943+00
46	social_auth	0001_initial	2023-08-14 07:32:39.953573+00
47	default	0002_add_related_name	2023-08-14 07:32:39.97883+00
48	social_auth	0002_add_related_name	2023-08-14 07:32:39.98041+00
49	default	0003_alter_email_max_length	2023-08-14 07:32:39.987477+00
50	social_auth	0003_alter_email_max_length	2023-08-14 07:32:39.988876+00
51	default	0004_auto_20160423_0400	2023-08-14 07:32:40.006573+00
52	social_auth	0004_auto_20160423_0400	2023-08-14 07:32:40.008038+00
53	social_auth	0005_auto_20160727_2333	2023-08-14 07:32:40.017357+00
54	social_django	0006_partial	2023-08-14 07:32:40.045038+00
55	social_django	0007_code_timestamp	2023-08-14 07:32:40.05467+00
56	social_django	0008_partial_timestamp	2023-08-14 07:32:40.065043+00
57	social_django	0009_auto_20191118_0520	2023-08-14 07:32:40.099151+00
58	social_django	0010_uid_db_index	2023-08-14 07:32:40.125415+00
59	social_django	0011_alter_id_fields	2023-08-14 07:32:40.295602+00
60	social_django	0012_auto_20230814_1032	2023-08-14 07:32:40.5478+00
61	social_django	0004_auto_20160423_0400	2023-08-14 07:32:40.631209+00
62	social_django	0002_add_related_name	2023-08-14 07:32:40.637169+00
63	social_django	0003_alter_email_max_length	2023-08-14 07:32:40.639224+00
64	social_django	0001_initial	2023-08-14 07:32:40.641235+00
65	social_django	0005_auto_20160727_2333	2023-08-14 07:32:40.643117+00
66	garpix_menu	0004_alter_menuitem_menu_type	2023-08-14 08:56:10.446295+00
67	garpix_notify	0004_auto_20230814_1154	2023-08-14 08:56:10.522982+00
68	api	0001_initial	2023-08-14 15:01:01.165933+00
69	api	0002_auto_20230815_1242	2023-08-15 09:42:46.903677+00
70	api	0003_remove_album_это название уже занято	2023-08-15 10:13:30.340616+00
71	api	0004_alter_album_unique_together	2023-08-15 10:45:36.689424+00
72	api	0005_alter_album_image	2023-08-15 12:26:44.361464+00
73	garpix_auth	0001_initial	2023-08-16 08:14:13.163334+00
74	api	0006_album_thumbnail	2023-08-16 14:00:54.880932+00
75	api	0007_alter_album_thumbnail	2023-08-17 09:42:02.360741+00
76	api	0008_topalbums	2023-08-23 11:25:40.89473+00
77	garpix_notify	0005_auto_20230823_1425	2023-08-23 11:25:40.954158+00
78	api	0009_alter_topalbums_webm_file	2023-08-24 08:22:21.991247+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
dnzo2w7ehdhqrgafnk96zjo74q8xlxt8	.eJxVjLEOwiAYhN-F2RChBYqje5-BAP8hVQNJaSfjuytJB11uuO-7ezHn9y27vWF1C7ELE-z02wUfHygd0N2XW-Wxlm1dAu8KP2jjcyU8r4f7d5B9y9-1H3WyCkEaOyJGJaEMRaieWkwJFMSAcxJeBqRpkKNWljQEGcBYYu8PBRg43g:1qVTS6:qXWA1QU5mm2eKBRhPnCK1Hxgmd9qM_VZ45gINfKGJyM	2023-08-28 09:01:30.340413+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: fcm_django_fcmdevice; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.fcm_django_fcmdevice (id, name, active, date_created, device_id, registration_id, type, user_id) FROM stdin;
\.


--
-- Data for Name: garpix_admin_lock_databasepagelockmodel; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_admin_lock_databasepagelockmodel (id, url, url_parameters, active, user_reference, locked, locked_at, locked_out, tab_counter) FROM stdin;
\.


--
-- Data for Name: garpix_auth_accesstoken; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_auth_accesstoken (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: garpix_auth_refreshtoken; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_auth_refreshtoken (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: garpix_menu_menuitem; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_menu_menuitem (id, subpage_url, url, hash, file, title_for_admin, title, title_ru, icon, menu_type, is_active, target_blank, created_at, updated_at, sort, css_class, lft, rght, tree_id, level, page_id, parent_id) FROM stdin;
\.


--
-- Data for Name: garpix_menu_menuitem_sites; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_menu_menuitem_sites (id, menuitem_id, site_id) FROM stdin;
\.


--
-- Data for Name: garpix_notify_notify; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notify (id, phone, telegram_chat_id, telegram_secret, viber_chat_id, viber_secret_key, subject, text, html, email, sender_email, state, event, room_name, type, is_read, data_json, send_at, created_at, sent_at, is_delete_after, category_id, user_id) FROM stdin;
1			74887758f7fa44b580069297f0f945e9			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p></p>\r\n\r\n<p>&nbsp;</p>	\N	\N	-2	\N	\N	0	f	\N	\N	2023-08-22 12:55:18.125169+00	\N	f	1	1
3			544f33c7ed1246a0bd3c8e0755b160aa			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:13.589255+00	\N	f	1	1
8			f7b6e796253f4264afa6c40885f41f30			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	user@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:52.636057+00	\N	f	1	3
9			88e7e755bc754caa99ad1f4f52975372			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:52.665995+00	\N	f	1	1
10			aa701460c8904ce9a9e01e5a6490ac14			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:52.680815+00	\N	f	1	1
11			5d76579d338c4fe68c95c4e4847c090b			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	user@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:56.509047+00	\N	f	1	3
12			07c1ab24179d480281a72c35138a1929			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:56.532249+00	\N	f	1	1
13			15bb598c45414bc984056fa7d34ce0b9			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:56.551943+00	\N	f	1	1
15			d93e081c403e40739d7a2338ada1107f			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:02:00.249044+00	\N	f	1	1
18			2bb52520972d4235bd7217150cac4443			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:06:41.756049+00	\N	f	1	1
2			d9a805ac27c246bf8fea18278bcec652			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	user@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:13.561734+00	\N	f	1	3
4			416c7751dc3148c6b35a972857d10d6e			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:13.605684+00	\N	f	1	1
5			15a2e5c796634ece8d8118f429e0db61			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	user@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:17.005987+00	\N	f	1	3
6			212df8f50a8b450c88e1f5c3557bbee1			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:17.027089+00	\N	f	1	1
7			512749a7948744a988dbd81782053970			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 07:56:17.040466+00	\N	f	1	1
14			ceb2a346be1e4337a7df53743be75dbf			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	user@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:02:00.220231+00	\N	f	1	3
16			d61b5b6e39154db2afcb4fe44afef5a2			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:02:00.259562+00	\N	f	1	1
17			4e02f4700ac448ccbfbbe58fd82264a5			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	user@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:06:41.73658+00	\N	f	1	3
23			b0f7f103ea6847dc85d23f5a5ec8688d			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	user@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:10:00.135603+00	\N	f	1	3
19			569de640d12f49ffadb5807be12b0185			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:06:41.764254+00	\N	f	1	1
24			24fbba9fef2d4509829479cef161c5bb			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:10:00.228706+00	\N	f	1	1
25			4b65601def724fc685bf311342ebae2a			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:10:00.250791+00	\N	f	1	1
20			9001fe715d0442a7bda9eabd1f8cfabc			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	user@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:08:00.159679+00	\N	f	1	3
21			8a67986befde49498d9ced2e1bbf8032			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:08:00.182578+00	\N	f	1	1
22			fa531e71f45d4b0d99494245a1e07945			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	-2	1	\N	0	f	\N	\N	2023-08-23 08:08:00.195131+00	\N	f	1	1
26			6d15ab749ba941cfb54d2fca42b69b45			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	user@example.com	\N	0	1	\N	0	f	\N	\N	2023-08-23 08:12:00.176276+00	\N	f	1	3
27			3937fece91b840f48b18381838d79b44			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	0	1	\N	0	f	\N	\N	2023-08-23 08:12:00.200144+00	\N	f	1	1
28			8bfba3c644994cb2b7e220f267c4032e			Топ-3 самых просматриваемых фото сайта за месяц	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	test@example.com	\N	0	1	\N	0	f	\N	\N	2023-08-23 08:12:00.208679+00	\N	f	1	1
\.


--
-- Data for Name: garpix_notify_notify_files; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notify_files (id, notify_id, notifyfile_id) FROM stdin;
\.


--
-- Data for Name: garpix_notify_notify_users_list; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notify_users_list (id, notify_id, notifyuserlist_id) FROM stdin;
\.


--
-- Data for Name: garpix_notify_notifycategory; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notifycategory (id, title, template, created_at) FROM stdin;
1	Стандарт	{{text}}	2023-08-22 12:42:52.379051+00
\.


--
-- Data for Name: garpix_notify_notifyconfig; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notifyconfig (id, periodic, email_max_day_limit, email_max_hour_limit, sms_url_type, sms_api_id, sms_login, sms_password, sms_from, call_url_type, call_api_id, call_login, call_password, telegram_api_key, telegram_bot_name, telegram_welcome_text, telegram_help_text, telegram_bad_command_text, telegram_success_added_text, telegram_failed_added_text, telegram_parse_mode, telegram_disable_notification, telegram_disable_web_page_preview, telegram_allow_sending_without_reply, telegram_timeout, viber_api_key, viber_bot_name, whatsapp_sender, whatsapp_auth_token, whatsapp_account_sid, is_email_enabled, is_sms_enabled, is_call_enabled, is_push_enabled, is_telegram_enabled, is_viber_enabled, is_whatsapp_enabled, viber_success_added_text, viber_failed_added_text, viber_text_for_new_sub, viber_welcome_text, email_malling) FROM stdin;
1	60	240	40	0	1234567890				0	1234567890			000000000:AAAAAAAAAA-AAAAAAAA-_AAAAAAAAAAAAAA		Добрый день! Здесь вы можете получать уведомления от нашего сайта	Используйте команду /set <уникальный код> для того, чтобы получать сообщения от бота. Уникальный код вы можете получить на нашем сайте	Неправильный формат команды	Ваша учетная запись успешно привязана к боту. Вы будете получать уведомления!	Ошибка при привязке учетной записи. Пожалуйста, свяжитесь с техподдержкой		f	f	f	\N	000000000:AAAAAAAAAA-AAAAAAAA-_AAAAAAAAAAAAAA	Viber bot		XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX	ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX	t	f	f	f	f	f	f	Ваша учетная запись успешно привязана к боту. Вы будете получать уведомления!	Ошибка при привязке учетной записи. Пожалуйста, свяжитесь с техподдержкой	cпасибо за подписку, Введите secret_key чтобы получать сообщения от бота.	для активации бота нужно отправить любое сообщения	1
\.


--
-- Data for Name: garpix_notify_notifyerrorlog; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notifyerrorlog (id, error, created_at, notify_id) FROM stdin;
1	No SMTPAccount	2023-08-22 12:55:18.161979+00	1
2	No SMTPAccount	2023-08-23 07:57:12.006724+00	2
3	No SMTPAccount	2023-08-23 07:57:12.024295+00	3
4	No SMTPAccount	2023-08-23 07:57:12.031049+00	4
5	No SMTPAccount	2023-08-23 07:57:12.037553+00	5
6	No SMTPAccount	2023-08-23 07:57:12.043451+00	6
7	No SMTPAccount	2023-08-23 07:57:12.04981+00	7
8	No SMTPAccount	2023-08-23 07:57:12.055773+00	8
9	No SMTPAccount	2023-08-23 07:57:12.061178+00	9
10	No SMTPAccount	2023-08-23 07:57:12.068481+00	10
11	No SMTPAccount	2023-08-23 07:57:12.07604+00	11
12	No SMTPAccount	2023-08-23 07:57:12.085242+00	12
13	No SMTPAccount	2023-08-23 07:57:12.091088+00	13
14	No SMTPAccount	2023-08-23 08:02:11.902479+00	14
15	No SMTPAccount	2023-08-23 08:02:11.919615+00	15
16	No SMTPAccount	2023-08-23 08:02:11.929116+00	16
17	No SMTPAccount	2023-08-23 08:07:40.139081+00	17
18	No SMTPAccount	2023-08-23 08:07:40.155157+00	18
19	No SMTPAccount	2023-08-23 08:07:40.168427+00	19
20	No SMTPAccount	2023-08-23 08:08:40.027492+00	20
21	No SMTPAccount	2023-08-23 08:08:40.041635+00	21
22	No SMTPAccount	2023-08-23 08:08:40.051567+00	22
23	No SMTPAccount	2023-08-23 08:10:40.093465+00	23
24	No SMTPAccount	2023-08-23 08:10:40.12974+00	24
25	No SMTPAccount	2023-08-23 08:10:40.142029+00	25
\.


--
-- Data for Name: garpix_notify_notifyfile; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notifyfile (id, file, created_at) FROM stdin;
\.


--
-- Data for Name: garpix_notify_notifytemplate; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notifytemplate (id, phone, telegram_chat_id, telegram_secret, viber_chat_id, viber_secret_key, title, subject, is_delete_after, text, html_from_type, html, zipfile, email, type, event, created_at, is_active, send_at, category_id, user_id) FROM stdin;
1			fbac0daa821244359d823f8b3a9343c3			Топ-3 просматриваемых фото сайта за месяц	Топ-3 самых просматриваемых фото сайта за месяц	f	Ваша фотография попала в топ-3 просматриваемых фотографий на сайте за месяц.	ckeditor	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>		\N	0	1	2023-08-22 12:55:09.160891+00	t	\N	1	\N
\.


--
-- Data for Name: garpix_notify_notifytemplate_user_lists; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notifytemplate_user_lists (id, notifytemplate_id, notifyuserlist_id) FROM stdin;
\.


--
-- Data for Name: garpix_notify_notifyuserlist; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notifyuserlist (id, title, created_at, mail_to_all) FROM stdin;
\.


--
-- Data for Name: garpix_notify_notifyuserlist_user_groups; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notifyuserlist_user_groups (id, notifyuserlist_id, group_id) FROM stdin;
\.


--
-- Data for Name: garpix_notify_notifyuserlist_users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notifyuserlist_users (id, notifyuserlist_id, user_id) FROM stdin;
\.


--
-- Data for Name: garpix_notify_notifyuserlistparticipant; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_notifyuserlistparticipant (id, phone, telegram_chat_id, telegram_secret, viber_chat_id, viber_secret_key, created_at, email, user_id, user_list_id) FROM stdin;
\.


--
-- Data for Name: garpix_notify_smtpaccount; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_smtpaccount (id, host, port, is_use_tls, is_use_ssl, sender, username, password, timeout, is_active, email_hour_used_times, email_day_used_times, email_hour_used_date, email_day_used_date, created_at, category_id) FROM stdin;
\.


--
-- Data for Name: garpix_notify_systemnotify; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_systemnotify (id, title, state, event, room_name, type, data_json, created_at, sent_at, is_read, user_id) FROM stdin;
\.


--
-- Data for Name: garpix_notify_systemnotifyerrorlog; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_notify_systemnotifyerrorlog (id, error, created_at, notify_id) FROM stdin;
\.


--
-- Data for Name: garpix_page_basecomponent; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_page_basecomponent (id, title, title_ru, is_deleted, is_active, created_at, updated_at, text_title, text_title_ru, polymorphic_ctype_id) FROM stdin;
\.


--
-- Data for Name: garpix_page_basepage; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_page_basepage (id, title, title_ru, is_active, display_on_sitemap, slug, created_at, updated_at, seo_title, seo_title_ru, seo_keywords, seo_keywords_ru, seo_description, seo_description_ru, seo_author, seo_author_ru, seo_og_type, seo_image, url, lft, rght, tree_id, level, parent_id, polymorphic_ctype_id) FROM stdin;
\.


--
-- Data for Name: garpix_page_basepage_sites; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_page_basepage_sites (id, basepage_id, site_id) FROM stdin;
\.


--
-- Data for Name: garpix_page_garpixpagesiteconfiguration; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_page_garpixpagesiteconfiguration (id, robots_txt, sitemap_frequency, site_id) FROM stdin;
1	User-agent: *\nDisallow: /admin/\nDisallow: /api/	always	1
\.


--
-- Data for Name: garpix_page_grapesjshtmlcomponent; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_page_grapesjshtmlcomponent (basecomponent_ptr_id, html) FROM stdin;
\.


--
-- Data for Name: garpix_page_pagecomponent; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_page_pagecomponent (id, view_order, component_id, page_id) FROM stdin;
\.


--
-- Data for Name: garpix_page_seotemplate; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_page_seotemplate (id, is_active, rule_field, model_rule_value, rule_value, seo_title, seo_title_ru, seo_keywords, seo_keywords_ru, seo_description, seo_description_ru, seo_author, seo_author_ru, seo_og_type, seo_image, priority_order) FROM stdin;
\.


--
-- Data for Name: garpix_page_seotemplate_sites; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_page_seotemplate_sites (id, seotemplate_id, site_id) FROM stdin;
\.


--
-- Data for Name: garpix_user_accesstoken; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_user_accesstoken (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: garpix_user_referraltype; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_user_referraltype (id, title, referral_hash) FROM stdin;
\.


--
-- Data for Name: garpix_user_referraluserlink; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_user_referraluserlink (id, referral_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: garpix_user_refreshtoken; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_user_refreshtoken (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: garpix_user_usersession; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpix_user_usersession (id, restore_password_confirm_code, is_restore_code_confirmed, restore_date, restore_by, phone_confirmation_code, phone_code_send_date, phone_confirmed_date, new_phone, email_confirmation_code, email_code_send_date, email_confirmed_date, new_email, email, is_email_confirmed, phone, is_phone_confirmed, token_number, recognized, last_access, user_id) FROM stdin;
1	\N	f	\N	email	\N	\N	\N	\N	\N	\N	\N	\N	\N	f		f	245bfc4b-a15d-40ad-9a84-539178cec87d	2	2023-08-16 08:25:49.475008+00	3
\.


--
-- Data for Name: garpixcms_page; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.garpixcms_page (basepage_ptr_id, content, content_ru) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id, id_token_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated, algorithm, post_logout_redirect_uris) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated, code_challenge, code_challenge_method, nonce, claims) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_idtoken; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.oauth2_provider_idtoken (id, jti, expires, scope, created, updated, application_id, user_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: user_user; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.user_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, is_deleted, telegram_chat_id, telegram_secret, viber_chat_id, viber_secret_key, phone_confirmation_code, phone_code_send_date, phone_confirmed_date, new_phone, email_confirmation_code, email_code_send_date, email_confirmed_date, new_email, is_email_confirmed, phone, is_phone_confirmed) FROM stdin;
3	pbkdf2_sha256$260000$l86yzKdDPgKGNgAETc0VLF$NeFqrGrVcx8KgD00atHVItsiyEVe9oD4dJGpWc0ZdxY=	\N	f	DuG-lTg@r-BTiQWnKIpmmYslm1f@o9lS55Ixu4W3T1FIwe_eYHb.			user@example.com	f	t	2023-08-16 08:25:49.276149+00	f		e9851139f609415899aa2ebad111781a			\N	\N	\N	\N	\N	\N	\N	\N	t		t
1	pbkdf2_sha256$260000$C5KwPJGg2YDw0gscUH9ZkJ$r7La+M5L0kmm16NIMigI15lPIp7pqYdLZSMEtH/z6Jw=	2023-08-14 09:01:30+00	t	test			test@example.com	t	t	2023-08-14 07:34:14+00	f		db4c1db8f65b43f39410068c9804931e			\N	\N	\N	\N	\N	\N	\N	\N	t		t
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.user_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.user_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: api_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.api_album_id_seq', 127, true);


--
-- Name: api_topalbums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.api_topalbums_id_seq', 9, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 200, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 181, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 50, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 78, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: fcm_django_fcmdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.fcm_django_fcmdevice_id_seq', 1, false);


--
-- Name: garpix_admin_lock_databasepagelockmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_admin_lock_databasepagelockmodel_id_seq', 1, false);


--
-- Name: garpix_menu_menuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_menu_menuitem_id_seq', 1, false);


--
-- Name: garpix_menu_menuitem_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_menu_menuitem_sites_id_seq', 1, false);


--
-- Name: garpix_notify_notify_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notify_files_id_seq', 1, false);


--
-- Name: garpix_notify_notify_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notify_id_seq', 28, true);


--
-- Name: garpix_notify_notify_users_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notify_users_list_id_seq', 1, false);


--
-- Name: garpix_notify_notifycategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notifycategory_id_seq', 1, true);


--
-- Name: garpix_notify_notifyconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notifyconfig_id_seq', 1, false);


--
-- Name: garpix_notify_notifyerrorlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notifyerrorlog_id_seq', 25, true);


--
-- Name: garpix_notify_notifyfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notifyfile_id_seq', 1, false);


--
-- Name: garpix_notify_notifytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notifytemplate_id_seq', 1, true);


--
-- Name: garpix_notify_notifytemplate_user_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notifytemplate_user_lists_id_seq', 1, false);


--
-- Name: garpix_notify_notifyuserlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notifyuserlist_id_seq', 1, false);


--
-- Name: garpix_notify_notifyuserlist_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notifyuserlist_user_groups_id_seq', 1, false);


--
-- Name: garpix_notify_notifyuserlist_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notifyuserlist_users_id_seq', 1, false);


--
-- Name: garpix_notify_notifyuserlistparticipant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_notifyuserlistparticipant_id_seq', 1, false);


--
-- Name: garpix_notify_smtpaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_smtpaccount_id_seq', 1, false);


--
-- Name: garpix_notify_systemnotify_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_systemnotify_id_seq', 1, false);


--
-- Name: garpix_notify_systemnotifyerrorlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_notify_systemnotifyerrorlog_id_seq', 1, false);


--
-- Name: garpix_page_basecomponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_page_basecomponent_id_seq', 1, false);


--
-- Name: garpix_page_basepage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_page_basepage_id_seq', 1, false);


--
-- Name: garpix_page_basepage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_page_basepage_sites_id_seq', 1, false);


--
-- Name: garpix_page_garpixpagesiteconfiguration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_page_garpixpagesiteconfiguration_id_seq', 1, true);


--
-- Name: garpix_page_pagecomponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_page_pagecomponent_id_seq', 1, false);


--
-- Name: garpix_page_seotemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_page_seotemplate_id_seq', 1, false);


--
-- Name: garpix_page_seotemplate_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_page_seotemplate_sites_id_seq', 1, false);


--
-- Name: garpix_user_referraltype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_user_referraltype_id_seq', 1, false);


--
-- Name: garpix_user_referraluserlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_user_referraluserlink_id_seq', 1, false);


--
-- Name: garpix_user_usersession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.garpix_user_usersession_id_seq', 1, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 1, false);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_idtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.oauth2_provider_idtoken_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.user_user_groups_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.user_user_id_seq', 3, true);


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.user_user_user_permissions_id_seq', 1, false);


--
-- Name: api_album api_album_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.api_album
    ADD CONSTRAINT api_album_pkey PRIMARY KEY (id);


--
-- Name: api_album api_album_title_author_id_0734ad17_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.api_album
    ADD CONSTRAINT api_album_title_author_id_0734ad17_uniq UNIQUE (title, author_id);


--
-- Name: api_topalbums api_topalbums_hash_key_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.api_topalbums
    ADD CONSTRAINT api_topalbums_hash_key_key UNIQUE (hash_key);


--
-- Name: api_topalbums api_topalbums_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.api_topalbums
    ADD CONSTRAINT api_topalbums_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: fcm_django_fcmdevice fcm_django_fcmdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.fcm_django_fcmdevice
    ADD CONSTRAINT fcm_django_fcmdevice_pkey PRIMARY KEY (id);


--
-- Name: garpix_admin_lock_databasepagelockmodel garpix_admin_lock_databasepagelockmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_admin_lock_databasepagelockmodel
    ADD CONSTRAINT garpix_admin_lock_databasepagelockmodel_pkey PRIMARY KEY (id);


--
-- Name: garpix_auth_accesstoken garpix_auth_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_auth_accesstoken
    ADD CONSTRAINT garpix_auth_accesstoken_pkey PRIMARY KEY (key);


--
-- Name: garpix_auth_refreshtoken garpix_auth_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_auth_refreshtoken
    ADD CONSTRAINT garpix_auth_refreshtoken_pkey PRIMARY KEY (key);


--
-- Name: garpix_menu_menuitem garpix_menu_menuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_menu_menuitem
    ADD CONSTRAINT garpix_menu_menuitem_pkey PRIMARY KEY (id);


--
-- Name: garpix_menu_menuitem_sites garpix_menu_menuitem_sites_menuitem_id_site_id_6cc2964b_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_menu_menuitem_sites
    ADD CONSTRAINT garpix_menu_menuitem_sites_menuitem_id_site_id_6cc2964b_uniq UNIQUE (menuitem_id, site_id);


--
-- Name: garpix_menu_menuitem_sites garpix_menu_menuitem_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_menu_menuitem_sites
    ADD CONSTRAINT garpix_menu_menuitem_sites_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notify_files garpix_notify_notify_fil_notify_id_notifyfile_id_0c4b8664_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify_files
    ADD CONSTRAINT garpix_notify_notify_fil_notify_id_notifyfile_id_0c4b8664_uniq UNIQUE (notify_id, notifyfile_id);


--
-- Name: garpix_notify_notify_files garpix_notify_notify_files_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify_files
    ADD CONSTRAINT garpix_notify_notify_files_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notify garpix_notify_notify_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify
    ADD CONSTRAINT garpix_notify_notify_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notify garpix_notify_notify_telegram_secret_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify
    ADD CONSTRAINT garpix_notify_notify_telegram_secret_key UNIQUE (telegram_secret);


--
-- Name: garpix_notify_notify_users_list garpix_notify_notify_use_notify_id_notifyuserlist_af94a583_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify_users_list
    ADD CONSTRAINT garpix_notify_notify_use_notify_id_notifyuserlist_af94a583_uniq UNIQUE (notify_id, notifyuserlist_id);


--
-- Name: garpix_notify_notify_users_list garpix_notify_notify_users_list_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify_users_list
    ADD CONSTRAINT garpix_notify_notify_users_list_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifycategory garpix_notify_notifycategory_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifycategory
    ADD CONSTRAINT garpix_notify_notifycategory_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifyconfig garpix_notify_notifyconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyconfig
    ADD CONSTRAINT garpix_notify_notifyconfig_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifyerrorlog garpix_notify_notifyerrorlog_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyerrorlog
    ADD CONSTRAINT garpix_notify_notifyerrorlog_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifyfile garpix_notify_notifyfile_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyfile
    ADD CONSTRAINT garpix_notify_notifyfile_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifytemplate_user_lists garpix_notify_notifytemp_notifytemplate_id_notify_d244696d_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifytemplate_user_lists
    ADD CONSTRAINT garpix_notify_notifytemp_notifytemplate_id_notify_d244696d_uniq UNIQUE (notifytemplate_id, notifyuserlist_id);


--
-- Name: garpix_notify_notifytemplate garpix_notify_notifytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifytemplate
    ADD CONSTRAINT garpix_notify_notifytemplate_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifytemplate garpix_notify_notifytemplate_telegram_secret_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifytemplate
    ADD CONSTRAINT garpix_notify_notifytemplate_telegram_secret_key UNIQUE (telegram_secret);


--
-- Name: garpix_notify_notifytemplate_user_lists garpix_notify_notifytemplate_user_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifytemplate_user_lists
    ADD CONSTRAINT garpix_notify_notifytemplate_user_lists_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifyuserlist_user_groups garpix_notify_notifyuser_notifyuserlist_id_group__826a2f23_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist_user_groups
    ADD CONSTRAINT garpix_notify_notifyuser_notifyuserlist_id_group__826a2f23_uniq UNIQUE (notifyuserlist_id, group_id);


--
-- Name: garpix_notify_notifyuserlist_users garpix_notify_notifyuser_notifyuserlist_id_user_i_4fe82840_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist_users
    ADD CONSTRAINT garpix_notify_notifyuser_notifyuserlist_id_user_i_4fe82840_uniq UNIQUE (notifyuserlist_id, user_id);


--
-- Name: garpix_notify_notifyuserlist garpix_notify_notifyuserlist_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist
    ADD CONSTRAINT garpix_notify_notifyuserlist_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifyuserlist_user_groups garpix_notify_notifyuserlist_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist_user_groups
    ADD CONSTRAINT garpix_notify_notifyuserlist_user_groups_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifyuserlist_users garpix_notify_notifyuserlist_users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist_users
    ADD CONSTRAINT garpix_notify_notifyuserlist_users_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifyuserlistparticipant garpix_notify_notifyuserlistparticipant_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlistparticipant
    ADD CONSTRAINT garpix_notify_notifyuserlistparticipant_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_notifyuserlistparticipant garpix_notify_notifyuserlistparticipant_telegram_secret_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlistparticipant
    ADD CONSTRAINT garpix_notify_notifyuserlistparticipant_telegram_secret_key UNIQUE (telegram_secret);


--
-- Name: garpix_notify_smtpaccount garpix_notify_smtpaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_smtpaccount
    ADD CONSTRAINT garpix_notify_smtpaccount_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_systemnotify garpix_notify_systemnotify_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_systemnotify
    ADD CONSTRAINT garpix_notify_systemnotify_pkey PRIMARY KEY (id);


--
-- Name: garpix_notify_systemnotifyerrorlog garpix_notify_systemnotifyerrorlog_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_systemnotifyerrorlog
    ADD CONSTRAINT garpix_notify_systemnotifyerrorlog_pkey PRIMARY KEY (id);


--
-- Name: garpix_page_basecomponent garpix_page_basecomponent_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basecomponent
    ADD CONSTRAINT garpix_page_basecomponent_pkey PRIMARY KEY (id);


--
-- Name: garpix_page_basepage garpix_page_basepage_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basepage
    ADD CONSTRAINT garpix_page_basepage_pkey PRIMARY KEY (id);


--
-- Name: garpix_page_basepage_sites garpix_page_basepage_sites_basepage_id_site_id_5e80fdb2_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basepage_sites
    ADD CONSTRAINT garpix_page_basepage_sites_basepage_id_site_id_5e80fdb2_uniq UNIQUE (basepage_id, site_id);


--
-- Name: garpix_page_basepage_sites garpix_page_basepage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basepage_sites
    ADD CONSTRAINT garpix_page_basepage_sites_pkey PRIMARY KEY (id);


--
-- Name: garpix_page_garpixpagesiteconfiguration garpix_page_garpixpagesiteconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_garpixpagesiteconfiguration
    ADD CONSTRAINT garpix_page_garpixpagesiteconfiguration_pkey PRIMARY KEY (id);


--
-- Name: garpix_page_grapesjshtmlcomponent garpix_page_grapesjshtmlcomponent_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_grapesjshtmlcomponent
    ADD CONSTRAINT garpix_page_grapesjshtmlcomponent_pkey PRIMARY KEY (basecomponent_ptr_id);


--
-- Name: garpix_page_pagecomponent garpix_page_pagecomponent_component_id_page_id_df70bd8b_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_pagecomponent
    ADD CONSTRAINT garpix_page_pagecomponent_component_id_page_id_df70bd8b_uniq UNIQUE (component_id, page_id);


--
-- Name: garpix_page_pagecomponent garpix_page_pagecomponent_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_pagecomponent
    ADD CONSTRAINT garpix_page_pagecomponent_pkey PRIMARY KEY (id);


--
-- Name: garpix_page_seotemplate_sites garpix_page_seotemplate__seotemplate_id_site_id_52083e3b_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_seotemplate_sites
    ADD CONSTRAINT garpix_page_seotemplate__seotemplate_id_site_id_52083e3b_uniq UNIQUE (seotemplate_id, site_id);


--
-- Name: garpix_page_seotemplate garpix_page_seotemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_seotemplate
    ADD CONSTRAINT garpix_page_seotemplate_pkey PRIMARY KEY (id);


--
-- Name: garpix_page_seotemplate_sites garpix_page_seotemplate_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_seotemplate_sites
    ADD CONSTRAINT garpix_page_seotemplate_sites_pkey PRIMARY KEY (id);


--
-- Name: garpix_user_accesstoken garpix_user_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_accesstoken
    ADD CONSTRAINT garpix_user_accesstoken_pkey PRIMARY KEY (key);


--
-- Name: garpix_user_referraltype garpix_user_referraltype_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_referraltype
    ADD CONSTRAINT garpix_user_referraltype_pkey PRIMARY KEY (id);


--
-- Name: garpix_user_referraluserlink garpix_user_referraluser_user_id_referral_type_id_ae3b573b_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_referraluserlink
    ADD CONSTRAINT garpix_user_referraluser_user_id_referral_type_id_ae3b573b_uniq UNIQUE (user_id, referral_type_id);


--
-- Name: garpix_user_referraluserlink garpix_user_referraluserlink_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_referraluserlink
    ADD CONSTRAINT garpix_user_referraluserlink_pkey PRIMARY KEY (id);


--
-- Name: garpix_user_refreshtoken garpix_user_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_refreshtoken
    ADD CONSTRAINT garpix_user_refreshtoken_pkey PRIMARY KEY (key);


--
-- Name: garpix_user_usersession garpix_user_usersession_new_phone_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_usersession
    ADD CONSTRAINT garpix_user_usersession_new_phone_key UNIQUE (new_phone);


--
-- Name: garpix_user_usersession garpix_user_usersession_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_usersession
    ADD CONSTRAINT garpix_user_usersession_pkey PRIMARY KEY (id);


--
-- Name: garpix_user_usersession garpix_user_usersession_user_id_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_usersession
    ADD CONSTRAINT garpix_user_usersession_user_id_key UNIQUE (user_id);


--
-- Name: garpixcms_page garpixcms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpixcms_page
    ADD CONSTRAINT garpixcms_page_pkey PRIMARY KEY (basepage_ptr_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_id_token_id_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_id_token_id_key UNIQUE (id_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_key UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_key UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_idtoken oauth2_provider_idtoken_jti_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idtoken_jti_key UNIQUE (jti);


--
-- Name: oauth2_provider_idtoken oauth2_provider_idtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_user_groups user_user_groups_user_id_group_id_bb60391f_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_group_id_bb60391f_uniq UNIQUE (user_id, group_id);


--
-- Name: user_user user_user_new_phone_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_new_phone_key UNIQUE (new_phone);


--
-- Name: user_user user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_pkey PRIMARY KEY (id);


--
-- Name: user_user user_user_telegram_secret_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_telegram_secret_key UNIQUE (telegram_secret);


--
-- Name: user_user_user_permissions user_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq UNIQUE (user_id, permission_id);


--
-- Name: user_user user_user_username_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_username_key UNIQUE (username);


--
-- Name: api_album_author_id_a4f77dc1; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX api_album_author_id_a4f77dc1 ON public.api_album USING btree (author_id);


--
-- Name: api_topalbums_hash_key_ac8e6d9e_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX api_topalbums_hash_key_ac8e6d9e_like ON public.api_topalbums USING btree (hash_key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: fcm_django_fcmdevice_device_id_a9406c36; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX fcm_django_fcmdevice_device_id_a9406c36 ON public.fcm_django_fcmdevice USING btree (device_id);


--
-- Name: fcm_django_fcmdevice_device_id_a9406c36_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX fcm_django_fcmdevice_device_id_a9406c36_like ON public.fcm_django_fcmdevice USING btree (device_id varchar_pattern_ops);


--
-- Name: fcm_django_fcmdevice_user_id_6cdfc0a2; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX fcm_django_fcmdevice_user_id_6cdfc0a2 ON public.fcm_django_fcmdevice USING btree (user_id);


--
-- Name: garpix_admin_lock_databasepagelockmodel_locked_at_e8456630; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_admin_lock_databasepagelockmodel_locked_at_e8456630 ON public.garpix_admin_lock_databasepagelockmodel USING btree (locked_at);


--
-- Name: garpix_admin_lock_databasepagelockmodel_locked_out_13f37961; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_admin_lock_databasepagelockmodel_locked_out_13f37961 ON public.garpix_admin_lock_databasepagelockmodel USING btree (locked_out);


--
-- Name: garpix_auth_accesstoken_key_0e135c92_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_auth_accesstoken_key_0e135c92_like ON public.garpix_auth_accesstoken USING btree (key varchar_pattern_ops);


--
-- Name: garpix_auth_accesstoken_user_id_c8e3f165; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_auth_accesstoken_user_id_c8e3f165 ON public.garpix_auth_accesstoken USING btree (user_id);


--
-- Name: garpix_auth_refreshtoken_key_d3110647_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_auth_refreshtoken_key_d3110647_like ON public.garpix_auth_refreshtoken USING btree (key varchar_pattern_ops);


--
-- Name: garpix_auth_refreshtoken_user_id_4d1019e8; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_auth_refreshtoken_user_id_4d1019e8 ON public.garpix_auth_refreshtoken USING btree (user_id);


--
-- Name: garpix_menu_menuitem_page_id_ee746656; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_menu_menuitem_page_id_ee746656 ON public.garpix_menu_menuitem USING btree (page_id);


--
-- Name: garpix_menu_menuitem_parent_id_0fa7f5f4; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_menu_menuitem_parent_id_0fa7f5f4 ON public.garpix_menu_menuitem USING btree (parent_id);


--
-- Name: garpix_menu_menuitem_sites_menuitem_id_57e65e2d; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_menu_menuitem_sites_menuitem_id_57e65e2d ON public.garpix_menu_menuitem_sites USING btree (menuitem_id);


--
-- Name: garpix_menu_menuitem_sites_site_id_d45015c6; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_menu_menuitem_sites_site_id_d45015c6 ON public.garpix_menu_menuitem_sites USING btree (site_id);


--
-- Name: garpix_menu_menuitem_tree_id_c2fc2f46; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_menu_menuitem_tree_id_c2fc2f46 ON public.garpix_menu_menuitem USING btree (tree_id);


--
-- Name: garpix_notify_notify_category_id_0a47804b; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notify_category_id_0a47804b ON public.garpix_notify_notify USING btree (category_id);


--
-- Name: garpix_notify_notify_files_notify_id_60e05d3f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notify_files_notify_id_60e05d3f ON public.garpix_notify_notify_files USING btree (notify_id);


--
-- Name: garpix_notify_notify_files_notifyfile_id_3caa1c8f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notify_files_notifyfile_id_3caa1c8f ON public.garpix_notify_notify_files USING btree (notifyfile_id);


--
-- Name: garpix_notify_notify_telegram_secret_a349006b_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notify_telegram_secret_a349006b_like ON public.garpix_notify_notify USING btree (telegram_secret varchar_pattern_ops);


--
-- Name: garpix_notify_notify_user_id_2415ab78; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notify_user_id_2415ab78 ON public.garpix_notify_notify USING btree (user_id);


--
-- Name: garpix_notify_notify_users_list_notify_id_7255d7c9; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notify_users_list_notify_id_7255d7c9 ON public.garpix_notify_notify_users_list USING btree (notify_id);


--
-- Name: garpix_notify_notify_users_list_notifyuserlist_id_d93dfc8f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notify_users_list_notifyuserlist_id_d93dfc8f ON public.garpix_notify_notify_users_list USING btree (notifyuserlist_id);


--
-- Name: garpix_notify_notifyerrorlog_notify_id_4fda0b60; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifyerrorlog_notify_id_4fda0b60 ON public.garpix_notify_notifyerrorlog USING btree (notify_id);


--
-- Name: garpix_notify_notifytempla_notifytemplate_id_5468a3e9; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifytempla_notifytemplate_id_5468a3e9 ON public.garpix_notify_notifytemplate_user_lists USING btree (notifytemplate_id);


--
-- Name: garpix_notify_notifytempla_notifyuserlist_id_08fe5004; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifytempla_notifyuserlist_id_08fe5004 ON public.garpix_notify_notifytemplate_user_lists USING btree (notifyuserlist_id);


--
-- Name: garpix_notify_notifytemplate_category_id_409f148a; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifytemplate_category_id_409f148a ON public.garpix_notify_notifytemplate USING btree (category_id);


--
-- Name: garpix_notify_notifytemplate_telegram_secret_bf3c5a0c_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifytemplate_telegram_secret_bf3c5a0c_like ON public.garpix_notify_notifytemplate USING btree (telegram_secret varchar_pattern_ops);


--
-- Name: garpix_notify_notifytemplate_user_id_00054b59; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifytemplate_user_id_00054b59 ON public.garpix_notify_notifytemplate USING btree (user_id);


--
-- Name: garpix_notify_notifyuser_telegram_secret_c577f741_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifyuser_telegram_secret_c577f741_like ON public.garpix_notify_notifyuserlistparticipant USING btree (telegram_secret varchar_pattern_ops);


--
-- Name: garpix_notify_notifyuserli_notifyuserlist_id_e03ca697; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifyuserli_notifyuserlist_id_e03ca697 ON public.garpix_notify_notifyuserlist_user_groups USING btree (notifyuserlist_id);


--
-- Name: garpix_notify_notifyuserlist_user_groups_group_id_2c906db3; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifyuserlist_user_groups_group_id_2c906db3 ON public.garpix_notify_notifyuserlist_user_groups USING btree (group_id);


--
-- Name: garpix_notify_notifyuserlist_users_notifyuserlist_id_4b499c42; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifyuserlist_users_notifyuserlist_id_4b499c42 ON public.garpix_notify_notifyuserlist_users USING btree (notifyuserlist_id);


--
-- Name: garpix_notify_notifyuserlist_users_user_id_4400da1e; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifyuserlist_users_user_id_4400da1e ON public.garpix_notify_notifyuserlist_users USING btree (user_id);


--
-- Name: garpix_notify_notifyuserlistparticipant_user_id_d32d21eb; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifyuserlistparticipant_user_id_d32d21eb ON public.garpix_notify_notifyuserlistparticipant USING btree (user_id);


--
-- Name: garpix_notify_notifyuserlistparticipant_user_list_id_58577a9f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_notifyuserlistparticipant_user_list_id_58577a9f ON public.garpix_notify_notifyuserlistparticipant USING btree (user_list_id);


--
-- Name: garpix_notify_smtpaccount_category_id_5e9a374c; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_smtpaccount_category_id_5e9a374c ON public.garpix_notify_smtpaccount USING btree (category_id);


--
-- Name: garpix_notify_systemnotify_user_id_e28082ac; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_systemnotify_user_id_e28082ac ON public.garpix_notify_systemnotify USING btree (user_id);


--
-- Name: garpix_notify_systemnotifyerrorlog_notify_id_f225e2a8; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_notify_systemnotifyerrorlog_notify_id_f225e2a8 ON public.garpix_notify_systemnotifyerrorlog USING btree (notify_id);


--
-- Name: garpix_page_basecomponent_polymorphic_ctype_id_eb3a987d; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_basecomponent_polymorphic_ctype_id_eb3a987d ON public.garpix_page_basecomponent USING btree (polymorphic_ctype_id);


--
-- Name: garpix_page_basepage_parent_id_7b55a93d; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_basepage_parent_id_7b55a93d ON public.garpix_page_basepage USING btree (parent_id);


--
-- Name: garpix_page_basepage_polymorphic_ctype_id_dfa626b6; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_basepage_polymorphic_ctype_id_dfa626b6 ON public.garpix_page_basepage USING btree (polymorphic_ctype_id);


--
-- Name: garpix_page_basepage_sites_basepage_id_57ebf6fc; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_basepage_sites_basepage_id_57ebf6fc ON public.garpix_page_basepage_sites USING btree (basepage_id);


--
-- Name: garpix_page_basepage_sites_site_id_4e21af6e; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_basepage_sites_site_id_4e21af6e ON public.garpix_page_basepage_sites USING btree (site_id);


--
-- Name: garpix_page_basepage_slug_cb93d5dd; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_basepage_slug_cb93d5dd ON public.garpix_page_basepage USING btree (slug);


--
-- Name: garpix_page_basepage_slug_cb93d5dd_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_basepage_slug_cb93d5dd_like ON public.garpix_page_basepage USING btree (slug varchar_pattern_ops);


--
-- Name: garpix_page_basepage_tree_id_5882a981; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_basepage_tree_id_5882a981 ON public.garpix_page_basepage USING btree (tree_id);


--
-- Name: garpix_page_garpixpagesiteconfiguration_site_id_c038901e; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_garpixpagesiteconfiguration_site_id_c038901e ON public.garpix_page_garpixpagesiteconfiguration USING btree (site_id);


--
-- Name: garpix_page_pagecomponent_component_id_150c98c1; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_pagecomponent_component_id_150c98c1 ON public.garpix_page_pagecomponent USING btree (component_id);


--
-- Name: garpix_page_pagecomponent_page_id_04236726; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_pagecomponent_page_id_04236726 ON public.garpix_page_pagecomponent USING btree (page_id);


--
-- Name: garpix_page_seotemplate_sites_seotemplate_id_5af26254; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_seotemplate_sites_seotemplate_id_5af26254 ON public.garpix_page_seotemplate_sites USING btree (seotemplate_id);


--
-- Name: garpix_page_seotemplate_sites_site_id_5dda9e4d; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_page_seotemplate_sites_site_id_5dda9e4d ON public.garpix_page_seotemplate_sites USING btree (site_id);


--
-- Name: garpix_user_accesstoken_key_e0a44d13_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_user_accesstoken_key_e0a44d13_like ON public.garpix_user_accesstoken USING btree (key varchar_pattern_ops);


--
-- Name: garpix_user_accesstoken_user_id_8736327d; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_user_accesstoken_user_id_8736327d ON public.garpix_user_accesstoken USING btree (user_id);


--
-- Name: garpix_user_referraluserlink_referral_type_id_f987e21f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_user_referraluserlink_referral_type_id_f987e21f ON public.garpix_user_referraluserlink USING btree (referral_type_id);


--
-- Name: garpix_user_referraluserlink_user_id_2be96f62; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_user_referraluserlink_user_id_2be96f62 ON public.garpix_user_referraluserlink USING btree (user_id);


--
-- Name: garpix_user_refreshtoken_key_fc9c2c66_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_user_refreshtoken_key_fc9c2c66_like ON public.garpix_user_refreshtoken USING btree (key varchar_pattern_ops);


--
-- Name: garpix_user_refreshtoken_user_id_51175e63; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_user_refreshtoken_user_id_51175e63 ON public.garpix_user_refreshtoken USING btree (user_id);


--
-- Name: garpix_user_usersession_new_phone_bd8dcad3_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX garpix_user_usersession_new_phone_bd8dcad3_like ON public.garpix_user_usersession USING btree (new_phone varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_idtoken_application_id_08c5ff4f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_idtoken_application_id_08c5ff4f ON public.oauth2_provider_idtoken USING btree (application_id);


--
-- Name: oauth2_provider_idtoken_user_id_dd512b59; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_idtoken_user_id_dd512b59 ON public.oauth2_provider_idtoken USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: user_user_groups_group_id_c57f13c0; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX user_user_groups_group_id_c57f13c0 ON public.user_user_groups USING btree (group_id);


--
-- Name: user_user_groups_user_id_13f9a20d; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX user_user_groups_user_id_13f9a20d ON public.user_user_groups USING btree (user_id);


--
-- Name: user_user_new_phone_bd81a405_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX user_user_new_phone_bd81a405_like ON public.user_user USING btree (new_phone varchar_pattern_ops);


--
-- Name: user_user_telegram_secret_b4486ec7_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX user_user_telegram_secret_b4486ec7_like ON public.user_user USING btree (telegram_secret varchar_pattern_ops);


--
-- Name: user_user_user_permissions_permission_id_ce49d4de; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX user_user_user_permissions_permission_id_ce49d4de ON public.user_user_user_permissions USING btree (permission_id);


--
-- Name: user_user_user_permissions_user_id_31782f58; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX user_user_user_permissions_user_id_31782f58 ON public.user_user_user_permissions USING btree (user_id);


--
-- Name: user_user_username_e2bdfe0c_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX user_user_username_e2bdfe0c_like ON public.user_user USING btree (username varchar_pattern_ops);


--
-- Name: api_album api_album_author_id_a4f77dc1_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.api_album
    ADD CONSTRAINT api_album_author_id_a4f77dc1_fk_user_user_id FOREIGN KEY (author_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fcm_django_fcmdevice fcm_django_fcmdevice_user_id_6cdfc0a2_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.fcm_django_fcmdevice
    ADD CONSTRAINT fcm_django_fcmdevice_user_id_6cdfc0a2_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_auth_accesstoken garpix_auth_accesstoken_user_id_c8e3f165_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_auth_accesstoken
    ADD CONSTRAINT garpix_auth_accesstoken_user_id_c8e3f165_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_auth_refreshtoken garpix_auth_refreshtoken_user_id_4d1019e8_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_auth_refreshtoken
    ADD CONSTRAINT garpix_auth_refreshtoken_user_id_4d1019e8_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_menu_menuitem_sites garpix_menu_menuitem_menuitem_id_57e65e2d_fk_garpix_me; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_menu_menuitem_sites
    ADD CONSTRAINT garpix_menu_menuitem_menuitem_id_57e65e2d_fk_garpix_me FOREIGN KEY (menuitem_id) REFERENCES public.garpix_menu_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_menu_menuitem garpix_menu_menuitem_page_id_ee746656_fk_garpix_pa; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_menu_menuitem
    ADD CONSTRAINT garpix_menu_menuitem_page_id_ee746656_fk_garpix_pa FOREIGN KEY (page_id) REFERENCES public.garpix_page_basepage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_menu_menuitem garpix_menu_menuitem_parent_id_0fa7f5f4_fk_garpix_me; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_menu_menuitem
    ADD CONSTRAINT garpix_menu_menuitem_parent_id_0fa7f5f4_fk_garpix_me FOREIGN KEY (parent_id) REFERENCES public.garpix_menu_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_menu_menuitem_sites garpix_menu_menuitem_sites_site_id_d45015c6_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_menu_menuitem_sites
    ADD CONSTRAINT garpix_menu_menuitem_sites_site_id_d45015c6_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notify garpix_notify_notify_category_id_0a47804b_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify
    ADD CONSTRAINT garpix_notify_notify_category_id_0a47804b_fk_garpix_no FOREIGN KEY (category_id) REFERENCES public.garpix_notify_notifycategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifytemplate garpix_notify_notify_category_id_409f148a_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifytemplate
    ADD CONSTRAINT garpix_notify_notify_category_id_409f148a_fk_garpix_no FOREIGN KEY (category_id) REFERENCES public.garpix_notify_notifycategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifyuserlist_user_groups garpix_notify_notify_group_id_2c906db3_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist_user_groups
    ADD CONSTRAINT garpix_notify_notify_group_id_2c906db3_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifyerrorlog garpix_notify_notify_notify_id_4fda0b60_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyerrorlog
    ADD CONSTRAINT garpix_notify_notify_notify_id_4fda0b60_fk_garpix_no FOREIGN KEY (notify_id) REFERENCES public.garpix_notify_notify(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notify_files garpix_notify_notify_notify_id_60e05d3f_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify_files
    ADD CONSTRAINT garpix_notify_notify_notify_id_60e05d3f_fk_garpix_no FOREIGN KEY (notify_id) REFERENCES public.garpix_notify_notify(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notify_users_list garpix_notify_notify_notify_id_7255d7c9_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify_users_list
    ADD CONSTRAINT garpix_notify_notify_notify_id_7255d7c9_fk_garpix_no FOREIGN KEY (notify_id) REFERENCES public.garpix_notify_notify(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notify_files garpix_notify_notify_notifyfile_id_3caa1c8f_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify_files
    ADD CONSTRAINT garpix_notify_notify_notifyfile_id_3caa1c8f_fk_garpix_no FOREIGN KEY (notifyfile_id) REFERENCES public.garpix_notify_notifyfile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifytemplate_user_lists garpix_notify_notify_notifytemplate_id_5468a3e9_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifytemplate_user_lists
    ADD CONSTRAINT garpix_notify_notify_notifytemplate_id_5468a3e9_fk_garpix_no FOREIGN KEY (notifytemplate_id) REFERENCES public.garpix_notify_notifytemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifytemplate_user_lists garpix_notify_notify_notifyuserlist_id_08fe5004_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifytemplate_user_lists
    ADD CONSTRAINT garpix_notify_notify_notifyuserlist_id_08fe5004_fk_garpix_no FOREIGN KEY (notifyuserlist_id) REFERENCES public.garpix_notify_notifyuserlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifyuserlist_users garpix_notify_notify_notifyuserlist_id_4b499c42_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist_users
    ADD CONSTRAINT garpix_notify_notify_notifyuserlist_id_4b499c42_fk_garpix_no FOREIGN KEY (notifyuserlist_id) REFERENCES public.garpix_notify_notifyuserlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notify_users_list garpix_notify_notify_notifyuserlist_id_d93dfc8f_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify_users_list
    ADD CONSTRAINT garpix_notify_notify_notifyuserlist_id_d93dfc8f_fk_garpix_no FOREIGN KEY (notifyuserlist_id) REFERENCES public.garpix_notify_notifyuserlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifyuserlist_user_groups garpix_notify_notify_notifyuserlist_id_e03ca697_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist_user_groups
    ADD CONSTRAINT garpix_notify_notify_notifyuserlist_id_e03ca697_fk_garpix_no FOREIGN KEY (notifyuserlist_id) REFERENCES public.garpix_notify_notifyuserlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notify garpix_notify_notify_user_id_2415ab78_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notify
    ADD CONSTRAINT garpix_notify_notify_user_id_2415ab78_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifyuserlist_users garpix_notify_notify_user_id_4400da1e_fk_user_user; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlist_users
    ADD CONSTRAINT garpix_notify_notify_user_id_4400da1e_fk_user_user FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifyuserlistparticipant garpix_notify_notify_user_id_d32d21eb_fk_user_user; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlistparticipant
    ADD CONSTRAINT garpix_notify_notify_user_id_d32d21eb_fk_user_user FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifyuserlistparticipant garpix_notify_notify_user_list_id_58577a9f_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifyuserlistparticipant
    ADD CONSTRAINT garpix_notify_notify_user_list_id_58577a9f_fk_garpix_no FOREIGN KEY (user_list_id) REFERENCES public.garpix_notify_notifyuserlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_notifytemplate garpix_notify_notifytemplate_user_id_00054b59_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_notifytemplate
    ADD CONSTRAINT garpix_notify_notifytemplate_user_id_00054b59_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_smtpaccount garpix_notify_smtpac_category_id_5e9a374c_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_smtpaccount
    ADD CONSTRAINT garpix_notify_smtpac_category_id_5e9a374c_fk_garpix_no FOREIGN KEY (category_id) REFERENCES public.garpix_notify_notifycategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_systemnotifyerrorlog garpix_notify_system_notify_id_f225e2a8_fk_garpix_no; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_systemnotifyerrorlog
    ADD CONSTRAINT garpix_notify_system_notify_id_f225e2a8_fk_garpix_no FOREIGN KEY (notify_id) REFERENCES public.garpix_notify_systemnotify(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_notify_systemnotify garpix_notify_systemnotify_user_id_e28082ac_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_notify_systemnotify
    ADD CONSTRAINT garpix_notify_systemnotify_user_id_e28082ac_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_basecomponent garpix_page_basecomp_polymorphic_ctype_id_eb3a987d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basecomponent
    ADD CONSTRAINT garpix_page_basecomp_polymorphic_ctype_id_eb3a987d_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_basepage_sites garpix_page_basepage_basepage_id_57ebf6fc_fk_garpix_pa; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basepage_sites
    ADD CONSTRAINT garpix_page_basepage_basepage_id_57ebf6fc_fk_garpix_pa FOREIGN KEY (basepage_id) REFERENCES public.garpix_page_basepage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_basepage garpix_page_basepage_parent_id_7b55a93d_fk_garpix_pa; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basepage
    ADD CONSTRAINT garpix_page_basepage_parent_id_7b55a93d_fk_garpix_pa FOREIGN KEY (parent_id) REFERENCES public.garpix_page_basepage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_basepage garpix_page_basepage_polymorphic_ctype_id_dfa626b6_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basepage
    ADD CONSTRAINT garpix_page_basepage_polymorphic_ctype_id_dfa626b6_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_basepage_sites garpix_page_basepage_sites_site_id_4e21af6e_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_basepage_sites
    ADD CONSTRAINT garpix_page_basepage_sites_site_id_4e21af6e_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_garpixpagesiteconfiguration garpix_page_garpixpa_site_id_c038901e_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_garpixpagesiteconfiguration
    ADD CONSTRAINT garpix_page_garpixpa_site_id_c038901e_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_grapesjshtmlcomponent garpix_page_grapesjs_basecomponent_ptr_id_e0946040_fk_garpix_pa; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_grapesjshtmlcomponent
    ADD CONSTRAINT garpix_page_grapesjs_basecomponent_ptr_id_e0946040_fk_garpix_pa FOREIGN KEY (basecomponent_ptr_id) REFERENCES public.garpix_page_basecomponent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_pagecomponent garpix_page_pagecomp_component_id_150c98c1_fk_garpix_pa; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_pagecomponent
    ADD CONSTRAINT garpix_page_pagecomp_component_id_150c98c1_fk_garpix_pa FOREIGN KEY (component_id) REFERENCES public.garpix_page_basecomponent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_pagecomponent garpix_page_pagecomp_page_id_04236726_fk_garpix_pa; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_pagecomponent
    ADD CONSTRAINT garpix_page_pagecomp_page_id_04236726_fk_garpix_pa FOREIGN KEY (page_id) REFERENCES public.garpix_page_basepage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_seotemplate_sites garpix_page_seotempl_seotemplate_id_5af26254_fk_garpix_pa; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_seotemplate_sites
    ADD CONSTRAINT garpix_page_seotempl_seotemplate_id_5af26254_fk_garpix_pa FOREIGN KEY (seotemplate_id) REFERENCES public.garpix_page_seotemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_page_seotemplate_sites garpix_page_seotempl_site_id_5dda9e4d_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_page_seotemplate_sites
    ADD CONSTRAINT garpix_page_seotempl_site_id_5dda9e4d_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_user_accesstoken garpix_user_accesstoken_user_id_8736327d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_accesstoken
    ADD CONSTRAINT garpix_user_accesstoken_user_id_8736327d_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_user_referraluserlink garpix_user_referral_referral_type_id_f987e21f_fk_garpix_us; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_referraluserlink
    ADD CONSTRAINT garpix_user_referral_referral_type_id_f987e21f_fk_garpix_us FOREIGN KEY (referral_type_id) REFERENCES public.garpix_user_referraltype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_user_referraluserlink garpix_user_referral_user_id_2be96f62_fk_garpix_us; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_referraluserlink
    ADD CONSTRAINT garpix_user_referral_user_id_2be96f62_fk_garpix_us FOREIGN KEY (user_id) REFERENCES public.garpix_user_usersession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_user_refreshtoken garpix_user_refreshtoken_user_id_51175e63_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_refreshtoken
    ADD CONSTRAINT garpix_user_refreshtoken_user_id_51175e63_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpix_user_usersession garpix_user_usersession_user_id_4c431112_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpix_user_usersession
    ADD CONSTRAINT garpix_user_usersession_user_id_4c431112_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: garpixcms_page garpixcms_page_basepage_ptr_id_7d163ae4_fk_garpix_pa; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.garpixcms_page
    ADD CONSTRAINT garpixcms_page_basepage_ptr_id_7d163ae4_fk_garpix_pa FOREIGN KEY (basepage_ptr_id) REFERENCES public.garpix_page_basepage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr FOREIGN KEY (id_token_id) REFERENCES public.oauth2_provider_idtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_gran_application_id_81923564_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_gran_application_id_81923564_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_idtoken oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_idtoken oauth2_provider_idtoken_user_id_dd512b59_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idtoken_user_id_dd512b59_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_group_id_c57f13c0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_group_id_c57f13c0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_user_id_13f9a20d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_13f9a20d_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permi_permission_id_ce49d4de_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permi_permission_id_ce49d4de_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_31782f58_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_31782f58_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

