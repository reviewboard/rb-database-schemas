--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 14.3

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

--
-- Name: accounts_localsiteprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_localsiteprofile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    profile_id integer NOT NULL,
    local_site_id integer,
    permissions text,
    direct_incoming_request_count integer,
    total_incoming_request_count integer,
    pending_outgoing_request_count integer,
    total_outgoing_request_count integer,
    starred_public_request_count integer
);


ALTER TABLE public.accounts_localsiteprofile OWNER TO postgres;

--
-- Name: accounts_localsiteprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_localsiteprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_localsiteprofile_id_seq OWNER TO postgres;

--
-- Name: accounts_localsiteprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_localsiteprofile_id_seq OWNED BY public.accounts_localsiteprofile.id;


--
-- Name: accounts_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_profile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    first_time_setup_done boolean NOT NULL,
    should_send_email boolean NOT NULL,
    should_send_own_updates boolean NOT NULL,
    collapsed_diffs boolean NOT NULL,
    wordwrapped_diffs boolean NOT NULL,
    syntax_highlighting boolean NOT NULL,
    is_private boolean NOT NULL,
    open_an_issue boolean NOT NULL,
    default_use_rich_text boolean,
    show_closed boolean NOT NULL,
    sort_review_request_columns character varying(256) NOT NULL,
    sort_dashboard_columns character varying(256) NOT NULL,
    sort_submitter_columns character varying(256) NOT NULL,
    sort_group_columns character varying(256) NOT NULL,
    review_request_columns character varying(256) NOT NULL,
    dashboard_columns character varying(256) NOT NULL,
    submitter_columns character varying(256) NOT NULL,
    group_columns character varying(256) NOT NULL,
    timezone character varying(30) NOT NULL,
    settings text,
    extra_data text
);


ALTER TABLE public.accounts_profile OWNER TO postgres;

--
-- Name: accounts_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_profile_id_seq OWNER TO postgres;

--
-- Name: accounts_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_profile_id_seq OWNED BY public.accounts_profile.id;


--
-- Name: accounts_profile_starred_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_profile_starred_groups (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_profile_starred_groups OWNER TO postgres;

--
-- Name: accounts_profile_starred_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_profile_starred_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_profile_starred_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_profile_starred_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_profile_starred_groups_id_seq OWNED BY public.accounts_profile_starred_groups.id;


--
-- Name: accounts_profile_starred_review_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_profile_starred_review_requests (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    reviewrequest_id integer NOT NULL
);


ALTER TABLE public.accounts_profile_starred_review_requests OWNER TO postgres;

--
-- Name: accounts_profile_starred_review_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_profile_starred_review_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_profile_starred_review_requests_id_seq OWNER TO postgres;

--
-- Name: accounts_profile_starred_review_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_profile_starred_review_requests_id_seq OWNED BY public.accounts_profile_starred_review_requests.id;


--
-- Name: accounts_reviewrequestvisit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_reviewrequestvisit (
    id integer NOT NULL,
    user_id integer NOT NULL,
    review_request_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    visibility character varying(1) NOT NULL
);


ALTER TABLE public.accounts_reviewrequestvisit OWNER TO postgres;

--
-- Name: accounts_reviewrequestvisit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_reviewrequestvisit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_reviewrequestvisit_id_seq OWNER TO postgres;

--
-- Name: accounts_reviewrequestvisit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_reviewrequestvisit_id_seq OWNED BY public.accounts_reviewrequestvisit.id;


--
-- Name: accounts_trophy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_trophy (
    id integer NOT NULL,
    category character varying(100) NOT NULL,
    received_date timestamp with time zone NOT NULL,
    review_request_id integer NOT NULL,
    local_site_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_trophy OWNER TO postgres;

--
-- Name: accounts_trophy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_trophy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_trophy_id_seq OWNER TO postgres;

--
-- Name: accounts_trophy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_trophy_id_seq OWNED BY public.accounts_trophy.id;


--
-- Name: attachments_fileattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachments_fileattachment (
    id integer NOT NULL,
    caption character varying(256) NOT NULL,
    draft_caption character varying(256) NOT NULL,
    orig_filename character varying(256),
    user_id integer,
    local_site_id integer,
    uuid character varying(255) NOT NULL,
    file character varying(512),
    mimetype character varying(256) NOT NULL,
    repo_path character varying(1024),
    repo_revision character varying(64),
    repository_id integer,
    added_in_filediff_id integer,
    attachment_history_id integer,
    attachment_revision integer NOT NULL
);


ALTER TABLE public.attachments_fileattachment OWNER TO postgres;

--
-- Name: attachments_fileattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachments_fileattachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_fileattachment_id_seq OWNER TO postgres;

--
-- Name: attachments_fileattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachments_fileattachment_id_seq OWNED BY public.attachments_fileattachment.id;


--
-- Name: attachments_fileattachmenthistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachments_fileattachmenthistory (
    id integer NOT NULL,
    display_position integer NOT NULL,
    latest_revision integer
);


ALTER TABLE public.attachments_fileattachmenthistory OWNER TO postgres;

--
-- Name: attachments_fileattachmenthistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachments_fileattachmenthistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_fileattachmenthistory_id_seq OWNER TO postgres;

--
-- Name: attachments_fileattachmenthistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachments_fileattachmenthistory_id_seq OWNED BY public.attachments_fileattachmenthistory.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: changedescs_changedescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changedescs_changedescription (
    id integer NOT NULL,
    user_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    public boolean NOT NULL,
    text text NOT NULL,
    rich_text boolean NOT NULL,
    fields_changed text NOT NULL
);


ALTER TABLE public.changedescs_changedescription OWNER TO postgres;

--
-- Name: changedescs_changedescription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.changedescs_changedescription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changedescs_changedescription_id_seq OWNER TO postgres;

--
-- Name: changedescs_changedescription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.changedescs_changedescription_id_seq OWNED BY public.changedescs_changedescription.id;


--
-- Name: corsheaders_corsmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.corsheaders_corsmodel (
    id integer NOT NULL,
    cors character varying(255) NOT NULL
);


ALTER TABLE public.corsheaders_corsmodel OWNER TO postgres;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.corsheaders_corsmodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.corsheaders_corsmodel_id_seq OWNER TO postgres;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.corsheaders_corsmodel_id_seq OWNED BY public.corsheaders_corsmodel.id;


--
-- Name: diffviewer_diffset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_diffset (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    revision integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    basedir character varying(256) NOT NULL,
    history_id integer,
    repository_id integer NOT NULL,
    diffcompat integer NOT NULL,
    base_commit_id character varying(64),
    extra_data text
);


ALTER TABLE public.diffviewer_diffset OWNER TO postgres;

--
-- Name: diffviewer_diffset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diffviewer_diffset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diffviewer_diffset_id_seq OWNER TO postgres;

--
-- Name: diffviewer_diffset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diffviewer_diffset_id_seq OWNED BY public.diffviewer_diffset.id;


--
-- Name: diffviewer_diffsethistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_diffsethistory (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    last_diff_updated timestamp with time zone,
    extra_data text
);


ALTER TABLE public.diffviewer_diffsethistory OWNER TO postgres;

--
-- Name: diffviewer_diffsethistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diffviewer_diffsethistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diffviewer_diffsethistory_id_seq OWNER TO postgres;

--
-- Name: diffviewer_diffsethistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diffviewer_diffsethistory_id_seq OWNED BY public.diffviewer_diffsethistory.id;


--
-- Name: diffviewer_filediff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_filediff (
    id integer NOT NULL,
    diffset_id integer NOT NULL,
    source_file character varying(1024) NOT NULL,
    dest_file character varying(1024) NOT NULL,
    source_revision character varying(512) NOT NULL,
    dest_detail character varying(512) NOT NULL,
    "binary" boolean NOT NULL,
    status character varying(1) NOT NULL,
    diff_base64 text NOT NULL,
    diff_hash_id character varying(40),
    raw_diff_hash_id integer,
    parent_diff_base64 text NOT NULL,
    parent_diff_hash_id character varying(40),
    raw_parent_diff_hash_id integer,
    extra_data text
);


ALTER TABLE public.diffviewer_filediff OWNER TO postgres;

--
-- Name: diffviewer_filediff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diffviewer_filediff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diffviewer_filediff_id_seq OWNER TO postgres;

--
-- Name: diffviewer_filediff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diffviewer_filediff_id_seq OWNED BY public.diffviewer_filediff.id;


--
-- Name: diffviewer_filediffdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_filediffdata (
    binary_hash character varying(40) NOT NULL,
    "binary" text NOT NULL,
    extra_data text
);


ALTER TABLE public.diffviewer_filediffdata OWNER TO postgres;

--
-- Name: diffviewer_rawfilediffdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_rawfilediffdata (
    id integer NOT NULL,
    binary_hash character varying(40) NOT NULL,
    "binary" bytea NOT NULL,
    compression character varying(1),
    extra_data text
);


ALTER TABLE public.diffviewer_rawfilediffdata OWNER TO postgres;

--
-- Name: diffviewer_rawfilediffdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diffviewer_rawfilediffdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diffviewer_rawfilediffdata_id_seq OWNER TO postgres;

--
-- Name: diffviewer_rawfilediffdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diffviewer_rawfilediffdata_id_seq OWNED BY public.diffviewer_rawfilediffdata.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_evolution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_evolution (
    id integer NOT NULL,
    version_id integer NOT NULL,
    app_label character varying(200) NOT NULL,
    label character varying(100) NOT NULL
);


ALTER TABLE public.django_evolution OWNER TO postgres;

--
-- Name: django_evolution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_evolution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_evolution_id_seq OWNER TO postgres;

--
-- Name: django_evolution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_evolution_id_seq OWNED BY public.django_evolution.id;


--
-- Name: django_project_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_project_version (
    id integer NOT NULL,
    signature text NOT NULL,
    "when" timestamp with time zone NOT NULL
);


ALTER TABLE public.django_project_version OWNER TO postgres;

--
-- Name: django_project_version_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_project_version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_project_version_id_seq OWNER TO postgres;

--
-- Name: django_project_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_project_version_id_seq OWNED BY public.django_project_version.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: djblets_privacy_storedconsentdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.djblets_privacy_storedconsentdata (
    id integer NOT NULL,
    user_id integer,
    audit_identifier character varying(255),
    time_added timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    consent_grants text NOT NULL,
    audit_trail text NOT NULL
);


ALTER TABLE public.djblets_privacy_storedconsentdata OWNER TO postgres;

--
-- Name: djblets_privacy_storedconsentdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.djblets_privacy_storedconsentdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djblets_privacy_storedconsentdata_id_seq OWNER TO postgres;

--
-- Name: djblets_privacy_storedconsentdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.djblets_privacy_storedconsentdata_id_seq OWNED BY public.djblets_privacy_storedconsentdata.id;


--
-- Name: extensions_registeredextension; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extensions_registeredextension (
    id integer NOT NULL,
    class_name character varying(128) NOT NULL,
    name character varying(32) NOT NULL,
    enabled boolean NOT NULL,
    installed boolean NOT NULL,
    settings text NOT NULL
);


ALTER TABLE public.extensions_registeredextension OWNER TO postgres;

--
-- Name: extensions_registeredextension_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extensions_registeredextension_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extensions_registeredextension_id_seq OWNER TO postgres;

--
-- Name: extensions_registeredextension_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extensions_registeredextension_id_seq OWNED BY public.extensions_registeredextension.id;


--
-- Name: hostingsvcs_hostingserviceaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hostingsvcs_hostingserviceaccount (
    id integer NOT NULL,
    service_name character varying(128) NOT NULL,
    hosting_url character varying(255),
    username character varying(128) NOT NULL,
    data text NOT NULL,
    visible boolean NOT NULL,
    local_site_id integer
);


ALTER TABLE public.hostingsvcs_hostingserviceaccount OWNER TO postgres;

--
-- Name: hostingsvcs_hostingserviceaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hostingsvcs_hostingserviceaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hostingsvcs_hostingserviceaccount_id_seq OWNER TO postgres;

--
-- Name: hostingsvcs_hostingserviceaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hostingsvcs_hostingserviceaccount_id_seq OWNED BY public.hostingsvcs_hostingserviceaccount.id;


--
-- Name: integrations_integrationconfig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.integrations_integrationconfig (
    id integer NOT NULL,
    integration_id character varying(255) NOT NULL,
    time_added timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(255),
    enabled boolean NOT NULL,
    settings text NOT NULL,
    extra_data text NOT NULL,
    local_site_id integer
);


ALTER TABLE public.integrations_integrationconfig OWNER TO postgres;

--
-- Name: integrations_integrationconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.integrations_integrationconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.integrations_integrationconfig_id_seq OWNER TO postgres;

--
-- Name: integrations_integrationconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.integrations_integrationconfig_id_seq OWNED BY public.integrations_integrationconfig.id;


--
-- Name: notifications_webhooktarget; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications_webhooktarget (
    id integer NOT NULL,
    enabled boolean NOT NULL,
    events character varying(105) NOT NULL,
    url character varying(200) NOT NULL,
    encoding character varying(40) NOT NULL,
    use_custom_content boolean NOT NULL,
    custom_content text,
    secret character varying(128) NOT NULL,
    apply_to character varying(1) NOT NULL,
    local_site_id integer,
    extra_data text
);


ALTER TABLE public.notifications_webhooktarget OWNER TO postgres;

--
-- Name: notifications_webhooktarget_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_webhooktarget_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_webhooktarget_id_seq OWNER TO postgres;

--
-- Name: notifications_webhooktarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_webhooktarget_id_seq OWNED BY public.notifications_webhooktarget.id;


--
-- Name: notifications_webhooktarget_repositories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications_webhooktarget_repositories (
    id integer NOT NULL,
    webhooktarget_id integer NOT NULL,
    repository_id integer NOT NULL
);


ALTER TABLE public.notifications_webhooktarget_repositories OWNER TO postgres;

--
-- Name: notifications_webhooktarget_repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_webhooktarget_repositories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_webhooktarget_repositories_id_seq OWNER TO postgres;

--
-- Name: notifications_webhooktarget_repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_webhooktarget_repositories_id_seq OWNED BY public.notifications_webhooktarget_repositories.id;


--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    application_id integer NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_accesstoken_id_seq OWNED BY public.oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_application (
    id integer NOT NULL,
    client_id character varying(100) NOT NULL,
    user_id integer NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    skip_authorization boolean NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_application_id_seq OWNED BY public.oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_grant (
    id integer NOT NULL,
    user_id integer NOT NULL,
    code character varying(255) NOT NULL,
    application_id integer NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_grant_id_seq OWNED BY public.oauth2_provider_grant.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(255) NOT NULL,
    application_id integer NOT NULL,
    access_token_id integer NOT NULL
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_refreshtoken_id_seq OWNED BY public.oauth2_provider_refreshtoken.id;


--
-- Name: reviewboard_oauth_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviewboard_oauth_application (
    id integer NOT NULL,
    client_id character varying(100) NOT NULL,
    user_id integer NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    skip_authorization boolean NOT NULL,
    enabled boolean NOT NULL,
    original_user_id integer,
    local_site_id integer,
    extra_data text
);


ALTER TABLE public.reviewboard_oauth_application OWNER TO postgres;

--
-- Name: reviewboard_oauth_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviewboard_oauth_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviewboard_oauth_application_id_seq OWNER TO postgres;

--
-- Name: reviewboard_oauth_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviewboard_oauth_application_id_seq OWNED BY public.reviewboard_oauth_application.id;


--
-- Name: reviews_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_comment (
    id integer NOT NULL,
    issue_opened boolean NOT NULL,
    issue_status character varying(1),
    reply_to_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    text text NOT NULL,
    rich_text boolean NOT NULL,
    extra_data text,
    filediff_id integer NOT NULL,
    interfilediff_id integer,
    first_line integer,
    num_lines integer,
    CONSTRAINT reviews_comment_first_line_check CHECK ((first_line >= 0)),
    CONSTRAINT reviews_comment_num_lines_check CHECK ((num_lines >= 0))
);


ALTER TABLE public.reviews_comment OWNER TO postgres;

--
-- Name: reviews_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_comment_id_seq OWNER TO postgres;

--
-- Name: reviews_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_comment_id_seq OWNED BY public.reviews_comment.id;


--
-- Name: reviews_defaultreviewer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_defaultreviewer (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    file_regex character varying(256) NOT NULL,
    local_site_id integer
);


ALTER TABLE public.reviews_defaultreviewer OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_defaultreviewer_groups (
    id integer NOT NULL,
    defaultreviewer_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.reviews_defaultreviewer_groups OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_defaultreviewer_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_defaultreviewer_groups_id_seq OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_defaultreviewer_groups_id_seq OWNED BY public.reviews_defaultreviewer_groups.id;


--
-- Name: reviews_defaultreviewer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_defaultreviewer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_defaultreviewer_id_seq OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_defaultreviewer_id_seq OWNED BY public.reviews_defaultreviewer.id;


--
-- Name: reviews_defaultreviewer_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_defaultreviewer_people (
    id integer NOT NULL,
    defaultreviewer_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reviews_defaultreviewer_people OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_defaultreviewer_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_defaultreviewer_people_id_seq OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_defaultreviewer_people_id_seq OWNED BY public.reviews_defaultreviewer_people.id;


--
-- Name: reviews_defaultreviewer_repository; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_defaultreviewer_repository (
    id integer NOT NULL,
    defaultreviewer_id integer NOT NULL,
    repository_id integer NOT NULL
);


ALTER TABLE public.reviews_defaultreviewer_repository OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_repository_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_defaultreviewer_repository_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_defaultreviewer_repository_id_seq OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_defaultreviewer_repository_id_seq OWNED BY public.reviews_defaultreviewer_repository.id;


--
-- Name: reviews_fileattachmentcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_fileattachmentcomment (
    id integer NOT NULL,
    issue_opened boolean NOT NULL,
    issue_status character varying(1),
    reply_to_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    text text NOT NULL,
    rich_text boolean NOT NULL,
    extra_data text,
    file_attachment_id integer NOT NULL,
    diff_against_file_attachment_id integer
);


ALTER TABLE public.reviews_fileattachmentcomment OWNER TO postgres;

--
-- Name: reviews_fileattachmentcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_fileattachmentcomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_fileattachmentcomment_id_seq OWNER TO postgres;

--
-- Name: reviews_fileattachmentcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_fileattachmentcomment_id_seq OWNED BY public.reviews_fileattachmentcomment.id;


--
-- Name: reviews_generalcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_generalcomment (
    id integer NOT NULL,
    issue_opened boolean NOT NULL,
    issue_status character varying(1),
    reply_to_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    text text NOT NULL,
    rich_text boolean NOT NULL,
    extra_data text
);


ALTER TABLE public.reviews_generalcomment OWNER TO postgres;

--
-- Name: reviews_generalcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_generalcomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_generalcomment_id_seq OWNER TO postgres;

--
-- Name: reviews_generalcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_generalcomment_id_seq OWNED BY public.reviews_generalcomment.id;


--
-- Name: reviews_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_group (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    display_name character varying(64) NOT NULL,
    mailing_list character varying(254) NOT NULL,
    email_list_only boolean NOT NULL,
    local_site_id integer,
    is_default_group boolean NOT NULL,
    incoming_request_count integer,
    invite_only boolean NOT NULL,
    visible boolean NOT NULL,
    extra_data text
);


ALTER TABLE public.reviews_group OWNER TO postgres;

--
-- Name: reviews_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_group_id_seq OWNER TO postgres;

--
-- Name: reviews_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_group_id_seq OWNED BY public.reviews_group.id;


--
-- Name: reviews_group_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_group_users (
    id integer NOT NULL,
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reviews_group_users OWNER TO postgres;

--
-- Name: reviews_group_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_group_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_group_users_id_seq OWNER TO postgres;

--
-- Name: reviews_group_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_group_users_id_seq OWNED BY public.reviews_group_users.id;


--
-- Name: reviews_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review (
    id integer NOT NULL,
    review_request_id integer NOT NULL,
    user_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    public boolean NOT NULL,
    ship_it boolean NOT NULL,
    base_reply_to_id integer,
    email_message_id character varying(255),
    time_emailed timestamp with time zone,
    body_top text NOT NULL,
    body_top_rich_text boolean NOT NULL,
    body_bottom text NOT NULL,
    body_bottom_rich_text boolean NOT NULL,
    body_top_reply_to_id integer,
    body_bottom_reply_to_id integer,
    extra_data text,
    rich_text boolean NOT NULL,
    reviewed_diffset_id integer
);


ALTER TABLE public.reviews_review OWNER TO postgres;

--
-- Name: reviews_review_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review_comments (
    id integer NOT NULL,
    review_id integer NOT NULL,
    comment_id integer NOT NULL
);


ALTER TABLE public.reviews_review_comments OWNER TO postgres;

--
-- Name: reviews_review_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_comments_id_seq OWNER TO postgres;

--
-- Name: reviews_review_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_comments_id_seq OWNED BY public.reviews_review_comments.id;


--
-- Name: reviews_review_file_attachment_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review_file_attachment_comments (
    id integer NOT NULL,
    review_id integer NOT NULL,
    fileattachmentcomment_id integer NOT NULL
);


ALTER TABLE public.reviews_review_file_attachment_comments OWNER TO postgres;

--
-- Name: reviews_review_file_attachment_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_file_attachment_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_file_attachment_comments_id_seq OWNER TO postgres;

--
-- Name: reviews_review_file_attachment_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_file_attachment_comments_id_seq OWNED BY public.reviews_review_file_attachment_comments.id;


--
-- Name: reviews_review_general_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review_general_comments (
    id integer NOT NULL,
    review_id integer NOT NULL,
    generalcomment_id integer NOT NULL
);


ALTER TABLE public.reviews_review_general_comments OWNER TO postgres;

--
-- Name: reviews_review_general_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_general_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_general_comments_id_seq OWNER TO postgres;

--
-- Name: reviews_review_general_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_general_comments_id_seq OWNED BY public.reviews_review_general_comments.id;


--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_id_seq OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews_review.id;


--
-- Name: reviews_review_screenshot_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review_screenshot_comments (
    id integer NOT NULL,
    review_id integer NOT NULL,
    screenshotcomment_id integer NOT NULL
);


ALTER TABLE public.reviews_review_screenshot_comments OWNER TO postgres;

--
-- Name: reviews_review_screenshot_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_screenshot_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_screenshot_comments_id_seq OWNER TO postgres;

--
-- Name: reviews_review_screenshot_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_screenshot_comments_id_seq OWNED BY public.reviews_review_screenshot_comments.id;


--
-- Name: reviews_reviewrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest (
    id integer NOT NULL,
    description text NOT NULL,
    description_rich_text boolean NOT NULL,
    testing_done text NOT NULL,
    testing_done_rich_text boolean NOT NULL,
    bugs_closed character varying(300) NOT NULL,
    branch character varying(300) NOT NULL,
    commit_id character varying(64),
    extra_data text,
    rich_text boolean NOT NULL,
    summary character varying(300) NOT NULL,
    submitter_id integer NOT NULL,
    time_added timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    status character varying(1) NOT NULL,
    public boolean NOT NULL,
    changenum integer,
    repository_id integer,
    email_message_id character varying(255),
    time_emailed timestamp with time zone,
    diffset_history_id integer NOT NULL,
    last_review_timestamp timestamp with time zone,
    shipit_count integer,
    issue_open_count integer,
    issue_resolved_count integer,
    issue_dropped_count integer,
    issue_verifying_count integer,
    screenshots_count integer,
    inactive_screenshots_count integer,
    file_attachments_count integer,
    inactive_file_attachments_count integer,
    local_site_id integer,
    local_id integer,
    CONSTRAINT reviews_reviewrequest_changenum_check CHECK ((changenum >= 0))
);


ALTER TABLE public.reviews_reviewrequest OWNER TO postgres;

--
-- Name: reviews_reviewrequest_changedescs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_changedescs (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    changedescription_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_changedescs OWNER TO postgres;

--
-- Name: reviews_reviewrequest_changedescs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_changedescs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_changedescs_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_changedescs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_changedescs_id_seq OWNED BY public.reviews_reviewrequest_changedescs.id;


--
-- Name: reviews_reviewrequest_depends_on; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_depends_on (
    id integer NOT NULL,
    from_reviewrequest_id integer NOT NULL,
    to_reviewrequest_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_depends_on OWNER TO postgres;

--
-- Name: reviews_reviewrequest_depends_on_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_depends_on_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_depends_on_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_depends_on_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_depends_on_id_seq OWNED BY public.reviews_reviewrequest_depends_on.id;


--
-- Name: reviews_reviewrequest_file_attachment_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_file_attachment_histories (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    fileattachmenthistory_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_file_attachment_histories OWNER TO postgres;

--
-- Name: reviews_reviewrequest_file_attachment_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_file_attachment_histories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_file_attachment_histories_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_file_attachment_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_file_attachment_histories_id_seq OWNED BY public.reviews_reviewrequest_file_attachment_histories.id;


--
-- Name: reviews_reviewrequest_file_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_file_attachments (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    fileattachment_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_file_attachments OWNER TO postgres;

--
-- Name: reviews_reviewrequest_file_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_file_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_file_attachments_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_file_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_file_attachments_id_seq OWNED BY public.reviews_reviewrequest_file_attachments.id;


--
-- Name: reviews_reviewrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_id_seq OWNED BY public.reviews_reviewrequest.id;


--
-- Name: reviews_reviewrequest_inactive_file_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_inactive_file_attachments (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    fileattachment_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_inactive_file_attachments OWNER TO postgres;

--
-- Name: reviews_reviewrequest_inactive_file_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_inactive_file_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_inactive_file_attachments_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_inactive_file_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_inactive_file_attachments_id_seq OWNED BY public.reviews_reviewrequest_inactive_file_attachments.id;


--
-- Name: reviews_reviewrequest_inactive_screenshots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_inactive_screenshots (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    screenshot_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_inactive_screenshots OWNER TO postgres;

--
-- Name: reviews_reviewrequest_inactive_screenshots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_inactive_screenshots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_inactive_screenshots_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_inactive_screenshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_inactive_screenshots_id_seq OWNED BY public.reviews_reviewrequest_inactive_screenshots.id;


--
-- Name: reviews_reviewrequest_screenshots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_screenshots (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    screenshot_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_screenshots OWNER TO postgres;

--
-- Name: reviews_reviewrequest_screenshots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_screenshots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_screenshots_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_screenshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_screenshots_id_seq OWNED BY public.reviews_reviewrequest_screenshots.id;


--
-- Name: reviews_reviewrequest_target_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_target_groups (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_target_groups OWNER TO postgres;

--
-- Name: reviews_reviewrequest_target_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_target_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_target_groups_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_target_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_target_groups_id_seq OWNED BY public.reviews_reviewrequest_target_groups.id;


--
-- Name: reviews_reviewrequest_target_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_target_people (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_target_people OWNER TO postgres;

--
-- Name: reviews_reviewrequest_target_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_target_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_target_people_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_target_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_target_people_id_seq OWNED BY public.reviews_reviewrequest_target_people.id;


--
-- Name: reviews_reviewrequestdraft; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft (
    id integer NOT NULL,
    description text NOT NULL,
    description_rich_text boolean NOT NULL,
    testing_done text NOT NULL,
    testing_done_rich_text boolean NOT NULL,
    bugs_closed character varying(300) NOT NULL,
    branch character varying(300) NOT NULL,
    commit_id character varying(64),
    extra_data text,
    rich_text boolean NOT NULL,
    summary character varying(300) NOT NULL,
    owner_id integer,
    review_request_id integer NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    diffset_id integer,
    changedesc_id integer,
    screenshots_count integer,
    inactive_screenshots_count integer,
    file_attachments_count integer,
    inactive_file_attachments_count integer
);


ALTER TABLE public.reviews_reviewrequestdraft OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_depends_on; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_depends_on (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    reviewrequest_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_depends_on OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_depends_on_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_depends_on_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_depends_on_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_depends_on_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_depends_on_id_seq OWNED BY public.reviews_reviewrequestdraft_depends_on.id;


--
-- Name: reviews_reviewrequestdraft_file_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_file_attachments (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    fileattachment_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_file_attachments OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_file_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_file_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_file_attachments_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_file_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_file_attachments_id_seq OWNED BY public.reviews_reviewrequestdraft_file_attachments.id;


--
-- Name: reviews_reviewrequestdraft_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_id_seq OWNED BY public.reviews_reviewrequestdraft.id;


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_inactive_file_attachments (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    fileattachment_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_inactive_file_attachments OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_inactive_file_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_inactive_file_attachments_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_inactive_file_attachments_id_seq OWNED BY public.reviews_reviewrequestdraft_inactive_file_attachments.id;


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_inactive_screenshots (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    screenshot_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_inactive_screenshots OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_inactive_screenshots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_inactive_screenshots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_inactive_screenshots_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_inactive_screenshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_inactive_screenshots_id_seq OWNED BY public.reviews_reviewrequestdraft_inactive_screenshots.id;


--
-- Name: reviews_reviewrequestdraft_screenshots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_screenshots (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    screenshot_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_screenshots OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_screenshots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_screenshots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_screenshots_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_screenshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_screenshots_id_seq OWNED BY public.reviews_reviewrequestdraft_screenshots.id;


--
-- Name: reviews_reviewrequestdraft_target_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_target_groups (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_target_groups OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_target_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_target_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_target_groups_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_target_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_target_groups_id_seq OWNED BY public.reviews_reviewrequestdraft_target_groups.id;


--
-- Name: reviews_reviewrequestdraft_target_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_target_people (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_target_people OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_target_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_target_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_target_people_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_target_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_target_people_id_seq OWNED BY public.reviews_reviewrequestdraft_target_people.id;


--
-- Name: reviews_screenshot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_screenshot (
    id integer NOT NULL,
    caption character varying(256) NOT NULL,
    draft_caption character varying(256) NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.reviews_screenshot OWNER TO postgres;

--
-- Name: reviews_screenshot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_screenshot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_screenshot_id_seq OWNER TO postgres;

--
-- Name: reviews_screenshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_screenshot_id_seq OWNED BY public.reviews_screenshot.id;


--
-- Name: reviews_screenshotcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_screenshotcomment (
    id integer NOT NULL,
    issue_opened boolean NOT NULL,
    issue_status character varying(1),
    reply_to_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    text text NOT NULL,
    rich_text boolean NOT NULL,
    extra_data text,
    screenshot_id integer NOT NULL,
    x smallint,
    y smallint NOT NULL,
    w smallint NOT NULL,
    h smallint NOT NULL,
    CONSTRAINT reviews_screenshotcomment_h_check CHECK ((h >= 0)),
    CONSTRAINT reviews_screenshotcomment_w_check CHECK ((w >= 0)),
    CONSTRAINT reviews_screenshotcomment_x_check CHECK ((x >= 0)),
    CONSTRAINT reviews_screenshotcomment_y_check CHECK ((y >= 0))
);


ALTER TABLE public.reviews_screenshotcomment OWNER TO postgres;

--
-- Name: reviews_screenshotcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_screenshotcomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_screenshotcomment_id_seq OWNER TO postgres;

--
-- Name: reviews_screenshotcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_screenshotcomment_id_seq OWNED BY public.reviews_screenshotcomment.id;


--
-- Name: reviews_statusupdate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_statusupdate (
    id integer NOT NULL,
    service_id character varying(255) NOT NULL,
    user_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    summary character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    url_text character varying(64) NOT NULL,
    state character varying(1) NOT NULL,
    review_request_id integer NOT NULL,
    change_description_id integer,
    review_id integer,
    extra_data text,
    timeout integer
);


ALTER TABLE public.reviews_statusupdate OWNER TO postgres;

--
-- Name: reviews_statusupdate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_statusupdate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_statusupdate_id_seq OWNER TO postgres;

--
-- Name: reviews_statusupdate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_statusupdate_id_seq OWNED BY public.reviews_statusupdate.id;


--
-- Name: scmtools_repository; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scmtools_repository (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    mirror_path character varying(255) NOT NULL,
    raw_file_url character varying(255) NOT NULL,
    username character varying(32) NOT NULL,
    password character varying(128) NOT NULL,
    extra_data text,
    tool_id integer NOT NULL,
    hosting_account_id integer,
    bug_tracker character varying(256) NOT NULL,
    encoding character varying(32) NOT NULL,
    visible boolean NOT NULL,
    archived boolean NOT NULL,
    archived_timestamp timestamp with time zone,
    local_site_id integer,
    public boolean NOT NULL,
    hooks_uuid character varying(32)
);


ALTER TABLE public.scmtools_repository OWNER TO postgres;

--
-- Name: scmtools_repository_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scmtools_repository_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scmtools_repository_id_seq OWNER TO postgres;

--
-- Name: scmtools_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scmtools_repository_id_seq OWNED BY public.scmtools_repository.id;


--
-- Name: scmtools_repository_review_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scmtools_repository_review_groups (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.scmtools_repository_review_groups OWNER TO postgres;

--
-- Name: scmtools_repository_review_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scmtools_repository_review_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scmtools_repository_review_groups_id_seq OWNER TO postgres;

--
-- Name: scmtools_repository_review_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scmtools_repository_review_groups_id_seq OWNED BY public.scmtools_repository_review_groups.id;


--
-- Name: scmtools_repository_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scmtools_repository_users (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.scmtools_repository_users OWNER TO postgres;

--
-- Name: scmtools_repository_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scmtools_repository_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scmtools_repository_users_id_seq OWNER TO postgres;

--
-- Name: scmtools_repository_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scmtools_repository_users_id_seq OWNED BY public.scmtools_repository_users.id;


--
-- Name: scmtools_tool; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scmtools_tool (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    class_name character varying(128) NOT NULL
);


ALTER TABLE public.scmtools_tool OWNER TO postgres;

--
-- Name: scmtools_tool_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scmtools_tool_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scmtools_tool_id_seq OWNER TO postgres;

--
-- Name: scmtools_tool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scmtools_tool_id_seq OWNED BY public.scmtools_tool.id;


--
-- Name: site_localsite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_localsite (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    public boolean NOT NULL,
    extra_data text
);


ALTER TABLE public.site_localsite OWNER TO postgres;

--
-- Name: site_localsite_admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_localsite_admins (
    id integer NOT NULL,
    localsite_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.site_localsite_admins OWNER TO postgres;

--
-- Name: site_localsite_admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_localsite_admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_localsite_admins_id_seq OWNER TO postgres;

--
-- Name: site_localsite_admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_localsite_admins_id_seq OWNED BY public.site_localsite_admins.id;


--
-- Name: site_localsite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_localsite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_localsite_id_seq OWNER TO postgres;

--
-- Name: site_localsite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_localsite_id_seq OWNED BY public.site_localsite.id;


--
-- Name: site_localsite_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_localsite_users (
    id integer NOT NULL,
    localsite_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.site_localsite_users OWNER TO postgres;

--
-- Name: site_localsite_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_localsite_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_localsite_users_id_seq OWNER TO postgres;

--
-- Name: site_localsite_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_localsite_users_id_seq OWNED BY public.site_localsite_users.id;


--
-- Name: siteconfig_siteconfiguration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siteconfig_siteconfiguration (
    id integer NOT NULL,
    site_id integer NOT NULL,
    version character varying(20) NOT NULL,
    settings text NOT NULL
);


ALTER TABLE public.siteconfig_siteconfiguration OWNER TO postgres;

--
-- Name: siteconfig_siteconfiguration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.siteconfig_siteconfiguration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.siteconfig_siteconfiguration_id_seq OWNER TO postgres;

--
-- Name: siteconfig_siteconfiguration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.siteconfig_siteconfiguration_id_seq OWNED BY public.siteconfig_siteconfiguration.id;


--
-- Name: webapi_webapitoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webapi_webapitoken (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(40) NOT NULL,
    time_added timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    note text NOT NULL,
    policy text,
    extra_data text,
    local_site_id integer
);


ALTER TABLE public.webapi_webapitoken OWNER TO postgres;

--
-- Name: webapi_webapitoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webapi_webapitoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webapi_webapitoken_id_seq OWNER TO postgres;

--
-- Name: webapi_webapitoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webapi_webapitoken_id_seq OWNED BY public.webapi_webapitoken.id;


--
-- Name: accounts_localsiteprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_localsiteprofile_id_seq'::regclass);


--
-- Name: accounts_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile ALTER COLUMN id SET DEFAULT nextval('public.accounts_profile_id_seq'::regclass);


--
-- Name: accounts_profile_starred_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_profile_starred_groups_id_seq'::regclass);


--
-- Name: accounts_profile_starred_review_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_review_requests ALTER COLUMN id SET DEFAULT nextval('public.accounts_profile_starred_review_requests_id_seq'::regclass);


--
-- Name: accounts_reviewrequestvisit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reviewrequestvisit ALTER COLUMN id SET DEFAULT nextval('public.accounts_reviewrequestvisit_id_seq'::regclass);


--
-- Name: accounts_trophy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_trophy ALTER COLUMN id SET DEFAULT nextval('public.accounts_trophy_id_seq'::regclass);


--
-- Name: attachments_fileattachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment ALTER COLUMN id SET DEFAULT nextval('public.attachments_fileattachment_id_seq'::regclass);


--
-- Name: attachments_fileattachmenthistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachmenthistory ALTER COLUMN id SET DEFAULT nextval('public.attachments_fileattachmenthistory_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: changedescs_changedescription id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changedescs_changedescription ALTER COLUMN id SET DEFAULT nextval('public.changedescs_changedescription_id_seq'::regclass);


--
-- Name: corsheaders_corsmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corsheaders_corsmodel ALTER COLUMN id SET DEFAULT nextval('public.corsheaders_corsmodel_id_seq'::regclass);


--
-- Name: diffviewer_diffset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffset ALTER COLUMN id SET DEFAULT nextval('public.diffviewer_diffset_id_seq'::regclass);


--
-- Name: diffviewer_diffsethistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffsethistory ALTER COLUMN id SET DEFAULT nextval('public.diffviewer_diffsethistory_id_seq'::regclass);


--
-- Name: diffviewer_filediff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff ALTER COLUMN id SET DEFAULT nextval('public.diffviewer_filediff_id_seq'::regclass);


--
-- Name: diffviewer_rawfilediffdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_rawfilediffdata ALTER COLUMN id SET DEFAULT nextval('public.diffviewer_rawfilediffdata_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_evolution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_evolution ALTER COLUMN id SET DEFAULT nextval('public.django_evolution_id_seq'::regclass);


--
-- Name: django_project_version id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_project_version ALTER COLUMN id SET DEFAULT nextval('public.django_project_version_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: djblets_privacy_storedconsentdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djblets_privacy_storedconsentdata ALTER COLUMN id SET DEFAULT nextval('public.djblets_privacy_storedconsentdata_id_seq'::regclass);


--
-- Name: extensions_registeredextension id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extensions_registeredextension ALTER COLUMN id SET DEFAULT nextval('public.extensions_registeredextension_id_seq'::regclass);


--
-- Name: hostingsvcs_hostingserviceaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostingsvcs_hostingserviceaccount ALTER COLUMN id SET DEFAULT nextval('public.hostingsvcs_hostingserviceaccount_id_seq'::regclass);


--
-- Name: integrations_integrationconfig id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations_integrationconfig ALTER COLUMN id SET DEFAULT nextval('public.integrations_integrationconfig_id_seq'::regclass);


--
-- Name: notifications_webhooktarget id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget ALTER COLUMN id SET DEFAULT nextval('public.notifications_webhooktarget_id_seq'::regclass);


--
-- Name: notifications_webhooktarget_repositories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget_repositories ALTER COLUMN id SET DEFAULT nextval('public.notifications_webhooktarget_repositories_id_seq'::regclass);


--
-- Name: oauth2_provider_accesstoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: oauth2_provider_application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass);


--
-- Name: oauth2_provider_grant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass);


--
-- Name: oauth2_provider_refreshtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: reviewboard_oauth_application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application ALTER COLUMN id SET DEFAULT nextval('public.reviewboard_oauth_application_id_seq'::regclass);


--
-- Name: reviews_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment ALTER COLUMN id SET DEFAULT nextval('public.reviews_comment_id_seq'::regclass);


--
-- Name: reviews_defaultreviewer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer ALTER COLUMN id SET DEFAULT nextval('public.reviews_defaultreviewer_id_seq'::regclass);


--
-- Name: reviews_defaultreviewer_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_groups ALTER COLUMN id SET DEFAULT nextval('public.reviews_defaultreviewer_groups_id_seq'::regclass);


--
-- Name: reviews_defaultreviewer_people id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_people ALTER COLUMN id SET DEFAULT nextval('public.reviews_defaultreviewer_people_id_seq'::regclass);


--
-- Name: reviews_defaultreviewer_repository id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_repository ALTER COLUMN id SET DEFAULT nextval('public.reviews_defaultreviewer_repository_id_seq'::regclass);


--
-- Name: reviews_fileattachmentcomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_fileattachmentcomment ALTER COLUMN id SET DEFAULT nextval('public.reviews_fileattachmentcomment_id_seq'::regclass);


--
-- Name: reviews_generalcomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_generalcomment ALTER COLUMN id SET DEFAULT nextval('public.reviews_generalcomment_id_seq'::regclass);


--
-- Name: reviews_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group ALTER COLUMN id SET DEFAULT nextval('public.reviews_group_id_seq'::regclass);


--
-- Name: reviews_group_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group_users ALTER COLUMN id SET DEFAULT nextval('public.reviews_group_users_id_seq'::regclass);


--
-- Name: reviews_review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review ALTER COLUMN id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);


--
-- Name: reviews_review_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_comments ALTER COLUMN id SET DEFAULT nextval('public.reviews_review_comments_id_seq'::regclass);


--
-- Name: reviews_review_file_attachment_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_file_attachment_comments ALTER COLUMN id SET DEFAULT nextval('public.reviews_review_file_attachment_comments_id_seq'::regclass);


--
-- Name: reviews_review_general_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_general_comments ALTER COLUMN id SET DEFAULT nextval('public.reviews_review_general_comments_id_seq'::regclass);


--
-- Name: reviews_review_screenshot_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_screenshot_comments ALTER COLUMN id SET DEFAULT nextval('public.reviews_review_screenshot_comments_id_seq'::regclass);


--
-- Name: reviews_reviewrequest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_changedescs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_changedescs ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_changedescs_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_depends_on id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_depends_on ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_depends_on_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_file_attachment_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachment_histories ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_file_attachment_histories_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_file_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachments ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_file_attachments_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_inactive_file_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_file_attachments ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_inactive_file_attachments_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_inactive_screenshots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_screenshots ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_inactive_screenshots_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_screenshots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_screenshots ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_screenshots_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_target_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_groups ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_target_groups_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_target_people id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_people ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_target_people_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_depends_on id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_depends_on ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_depends_on_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_file_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_file_attachments ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_file_attachments_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_file_attachments ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_inactive_file_attachments_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_screenshots ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_inactive_screenshots_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_screenshots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_screenshots ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_screenshots_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_target_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_groups ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_target_groups_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_target_people id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_people ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_target_people_id_seq'::regclass);


--
-- Name: reviews_screenshot id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshot ALTER COLUMN id SET DEFAULT nextval('public.reviews_screenshot_id_seq'::regclass);


--
-- Name: reviews_screenshotcomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshotcomment ALTER COLUMN id SET DEFAULT nextval('public.reviews_screenshotcomment_id_seq'::regclass);


--
-- Name: reviews_statusupdate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate ALTER COLUMN id SET DEFAULT nextval('public.reviews_statusupdate_id_seq'::regclass);


--
-- Name: scmtools_repository id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository ALTER COLUMN id SET DEFAULT nextval('public.scmtools_repository_id_seq'::regclass);


--
-- Name: scmtools_repository_review_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_review_groups ALTER COLUMN id SET DEFAULT nextval('public.scmtools_repository_review_groups_id_seq'::regclass);


--
-- Name: scmtools_repository_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_users ALTER COLUMN id SET DEFAULT nextval('public.scmtools_repository_users_id_seq'::regclass);


--
-- Name: scmtools_tool id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_tool ALTER COLUMN id SET DEFAULT nextval('public.scmtools_tool_id_seq'::regclass);


--
-- Name: site_localsite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite ALTER COLUMN id SET DEFAULT nextval('public.site_localsite_id_seq'::regclass);


--
-- Name: site_localsite_admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_admins ALTER COLUMN id SET DEFAULT nextval('public.site_localsite_admins_id_seq'::regclass);


--
-- Name: site_localsite_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_users ALTER COLUMN id SET DEFAULT nextval('public.site_localsite_users_id_seq'::regclass);


--
-- Name: siteconfig_siteconfiguration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siteconfig_siteconfiguration ALTER COLUMN id SET DEFAULT nextval('public.siteconfig_siteconfiguration_id_seq'::regclass);


--
-- Name: webapi_webapitoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webapi_webapitoken ALTER COLUMN id SET DEFAULT nextval('public.webapi_webapitoken_id_seq'::regclass);


--
-- Data for Name: accounts_localsiteprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_localsiteprofile (id, user_id, profile_id, local_site_id, permissions, direct_incoming_request_count, total_incoming_request_count, pending_outgoing_request_count, total_outgoing_request_count, starred_public_request_count) FROM stdin;
\.


--
-- Data for Name: accounts_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_profile (id, user_id, first_time_setup_done, should_send_email, should_send_own_updates, collapsed_diffs, wordwrapped_diffs, syntax_highlighting, is_private, open_an_issue, default_use_rich_text, show_closed, sort_review_request_columns, sort_dashboard_columns, sort_submitter_columns, sort_group_columns, review_request_columns, dashboard_columns, submitter_columns, group_columns, timezone, settings, extra_data) FROM stdin;
\.


--
-- Data for Name: accounts_profile_starred_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_profile_starred_groups (id, profile_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_profile_starred_review_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_profile_starred_review_requests (id, profile_id, reviewrequest_id) FROM stdin;
\.


--
-- Data for Name: accounts_reviewrequestvisit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_reviewrequestvisit (id, user_id, review_request_id, "timestamp", visibility) FROM stdin;
\.


--
-- Data for Name: accounts_trophy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_trophy (id, category, received_date, review_request_id, local_site_id, user_id) FROM stdin;
\.


--
-- Data for Name: attachments_fileattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachments_fileattachment (id, caption, draft_caption, orig_filename, user_id, local_site_id, uuid, file, mimetype, repo_path, repo_revision, repository_id, added_in_filediff_id, attachment_history_id, attachment_revision) FROM stdin;
\.


--
-- Data for Name: attachments_fileattachmenthistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachments_fileattachmenthistory (id, display_position, latest_revision) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add cors model	1	add_corsmodel
2	Can change cors model	1	change_corsmodel
3	Can delete cors model	1	delete_corsmodel
4	Can add log entry	2	add_logentry
5	Can change log entry	2	change_logentry
6	Can delete log entry	2	delete_logentry
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add user	5	add_user
14	Can change user	5	change_user
15	Can delete user	5	delete_user
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add session	8	add_session
23	Can change session	8	change_session
24	Can delete session	8	delete_session
25	Can add registered extension	9	add_registeredextension
26	Can change registered extension	9	change_registeredextension
27	Can delete registered extension	9	delete_registeredextension
28	Can add Integration Configuration	10	add_integrationconfig
29	Can change Integration Configuration	10	change_integrationconfig
30	Can delete Integration Configuration	10	delete_integrationconfig
31	Can add Stored consent data	11	add_storedconsentdata
32	Can change Stored consent data	11	change_storedconsentdata
33	Can delete Stored consent data	11	delete_storedconsentdata
34	Can add site configuration	12	add_siteconfiguration
35	Can change site configuration	12	change_siteconfiguration
36	Can delete site configuration	12	delete_siteconfiguration
37	Can add application	13	add_application
38	Can change application	13	change_application
39	Can delete application	13	delete_application
40	Can add grant	14	add_grant
41	Can change grant	14	change_grant
42	Can delete grant	14	delete_grant
43	Can add access token	15	add_accesstoken
44	Can change access token	15	change_accesstoken
45	Can delete access token	15	delete_accesstoken
46	Can add refresh token	16	add_refreshtoken
47	Can change refresh token	16	change_refreshtoken
48	Can delete refresh token	16	delete_refreshtoken
49	Can add Review Request Visit	17	add_reviewrequestvisit
50	Can change Review Request Visit	17	change_reviewrequestvisit
51	Can delete Review Request Visit	17	delete_reviewrequestvisit
52	Can add Profile	18	add_profile
53	Can change Profile	18	change_profile
54	Can delete Profile	18	delete_profile
55	Can add Local Site Profile	19	add_localsiteprofile
56	Can change Local Site Profile	19	change_localsiteprofile
57	Can delete Local Site Profile	19	delete_localsiteprofile
58	Can add Trophy	20	add_trophy
59	Can change Trophy	20	change_trophy
60	Can delete Trophy	20	delete_trophy
61	Can add File Attachment History	21	add_fileattachmenthistory
62	Can change File Attachment History	21	change_fileattachmenthistory
63	Can delete File Attachment History	21	delete_fileattachmenthistory
64	Can add File Attachment	22	add_fileattachment
65	Can change File Attachment	22	change_fileattachment
66	Can delete File Attachment	22	delete_fileattachment
67	Can add Change Description	23	add_changedescription
68	Can change Change Description	23	change_changedescription
69	Can delete Change Description	23	delete_changedescription
70	Can add Legacy File Diff Data	24	add_legacyfilediffdata
71	Can change Legacy File Diff Data	24	change_legacyfilediffdata
72	Can delete Legacy File Diff Data	24	delete_legacyfilediffdata
73	Can add Raw File Diff Data	25	add_rawfilediffdata
74	Can change Raw File Diff Data	25	change_rawfilediffdata
75	Can delete Raw File Diff Data	25	delete_rawfilediffdata
76	Can add File Diff	26	add_filediff
77	Can change File Diff	26	change_filediff
78	Can delete File Diff	26	delete_filediff
79	Can add Diff Set	27	add_diffset
80	Can change Diff Set	27	change_diffset
81	Can delete Diff Set	27	delete_diffset
82	Can add Diff Set History	28	add_diffsethistory
83	Can change Diff Set History	28	change_diffsethistory
84	Can delete Diff Set History	28	delete_diffsethistory
85	Can add Hosting Service Account	29	add_hostingserviceaccount
86	Can change Hosting Service Account	29	change_hostingserviceaccount
87	Can delete Hosting Service Account	29	delete_hostingserviceaccount
88	Can add Webhook	30	add_webhooktarget
89	Can change Webhook	30	change_webhooktarget
90	Can delete Webhook	30	delete_webhooktarget
91	Can add OAuth Application	31	add_application
92	Can change OAuth Application	31	change_application
93	Can delete OAuth Application	31	delete_application
94	Can add Review Group	32	add_group
95	Can change Review Group	32	change_group
96	Can delete Review Group	32	delete_group
97	Can view invite-only Groups	32	can_view_invite_only_groups
98	Can add Default Reviewer	33	add_defaultreviewer
99	Can change Default Reviewer	33	change_defaultreviewer
100	Can delete Default Reviewer	33	delete_defaultreviewer
101	Can add Diff Comment	34	add_comment
102	Can change Diff Comment	34	change_comment
103	Can delete Diff Comment	34	delete_comment
104	Can add File Attachment Comment	35	add_fileattachmentcomment
105	Can change File Attachment Comment	35	change_fileattachmentcomment
106	Can delete File Attachment Comment	35	delete_fileattachmentcomment
107	Can add General Comment	36	add_generalcomment
108	Can change General Comment	36	change_generalcomment
109	Can delete General Comment	36	delete_generalcomment
110	Can add Screenshot	37	add_screenshot
111	Can change Screenshot	37	change_screenshot
112	Can delete Screenshot	37	delete_screenshot
113	Can add Review Request	38	add_reviewrequest
114	Can change Review Request	38	change_reviewrequest
115	Can delete Review Request	38	delete_reviewrequest
116	Can change status	38	can_change_status
117	Can submit as another user	38	can_submit_as_another_user
118	Can edit review request	38	can_edit_reviewrequest
119	Can add Screenshot Comment	39	add_screenshotcomment
120	Can change Screenshot Comment	39	change_screenshotcomment
121	Can delete Screenshot Comment	39	delete_screenshotcomment
122	Can add Review	40	add_review
123	Can change Review	40	change_review
124	Can delete Review	40	delete_review
125	Can add Review Request Draft	41	add_reviewrequestdraft
126	Can change Review Request Draft	41	change_reviewrequestdraft
127	Can delete Review Request Draft	41	delete_reviewrequestdraft
128	Can add Status Update	42	add_statusupdate
129	Can change Status Update	42	change_statusupdate
130	Can delete Status Update	42	delete_statusupdate
131	Can add Tool	43	add_tool
132	Can change Tool	43	change_tool
133	Can delete Tool	43	delete_tool
134	Can add Repository	44	add_repository
135	Can change Repository	44	change_repository
136	Can delete Repository	44	delete_repository
137	Can add Local Site	45	add_localsite
138	Can change Local Site	45	change_localsite
139	Can delete Local Site	45	delete_localsite
140	Can add Web API Token	46	add_webapitoken
141	Can change Web API Token	46	change_webapitoken
142	Can delete Web API Token	46	delete_webapitoken
143	Can add version	47	add_version
144	Can change version	47	change_version
145	Can delete version	47	delete_version
146	Can add evolution	48	add_evolution
147	Can change evolution	48	change_evolution
148	Can delete evolution	48	delete_evolution
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: changedescs_changedescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.changedescs_changedescription (id, user_id, "timestamp", public, text, rich_text, fields_changed) FROM stdin;
\.


--
-- Data for Name: corsheaders_corsmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.corsheaders_corsmodel (id, cors) FROM stdin;
\.


--
-- Data for Name: diffviewer_diffset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_diffset (id, name, revision, "timestamp", basedir, history_id, repository_id, diffcompat, base_commit_id, extra_data) FROM stdin;
\.


--
-- Data for Name: diffviewer_diffsethistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_diffsethistory (id, name, "timestamp", last_diff_updated, extra_data) FROM stdin;
\.


--
-- Data for Name: diffviewer_filediff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_filediff (id, diffset_id, source_file, dest_file, source_revision, dest_detail, "binary", status, diff_base64, diff_hash_id, raw_diff_hash_id, parent_diff_base64, parent_diff_hash_id, raw_parent_diff_hash_id, extra_data) FROM stdin;
\.


--
-- Data for Name: diffviewer_filediffdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_filediffdata (binary_hash, "binary", extra_data) FROM stdin;
\.


--
-- Data for Name: diffviewer_rawfilediffdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_rawfilediffdata (id, binary_hash, "binary", compression, extra_data) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, name, app_label, model) FROM stdin;
1	cors model	corsheaders	corsmodel
2	log entry	admin	logentry
3	permission	auth	permission
4	group	auth	group
5	user	auth	user
6	content type	contenttypes	contenttype
7	site	sites	site
8	session	sessions	session
9	registered extension	extensions	registeredextension
10	Integration Configuration	integrations	integrationconfig
11	Stored consent data	privacy	storedconsentdata
12	site configuration	siteconfig	siteconfiguration
13	application	oauth2_provider	application
14	grant	oauth2_provider	grant
15	access token	oauth2_provider	accesstoken
16	refresh token	oauth2_provider	refreshtoken
17	Review Request Visit	accounts	reviewrequestvisit
18	Profile	accounts	profile
19	Local Site Profile	accounts	localsiteprofile
20	Trophy	accounts	trophy
21	File Attachment History	attachments	fileattachmenthistory
22	File Attachment	attachments	fileattachment
23	Change Description	changedescs	changedescription
24	Legacy File Diff Data	diffviewer	legacyfilediffdata
25	Raw File Diff Data	diffviewer	rawfilediffdata
26	File Diff	diffviewer	filediff
27	Diff Set	diffviewer	diffset
28	Diff Set History	diffviewer	diffsethistory
29	Hosting Service Account	hostingsvcs	hostingserviceaccount
30	Webhook	notifications	webhooktarget
31	OAuth Application	oauth	application
32	Review Group	reviews	group
33	Default Reviewer	reviews	defaultreviewer
34	Diff Comment	reviews	comment
35	File Attachment Comment	reviews	fileattachmentcomment
36	General Comment	reviews	generalcomment
37	Screenshot	reviews	screenshot
38	Review Request	reviews	reviewrequest
39	Screenshot Comment	reviews	screenshotcomment
40	Review	reviews	review
41	Review Request Draft	reviews	reviewrequestdraft
42	Status Update	reviews	statusupdate
43	Tool	scmtools	tool
44	Repository	scmtools	repository
45	Local Site	site	localsite
46	Web API Token	webapi	webapitoken
47	version	django_evolution	version
48	evolution	django_evolution	evolution
\.


--
-- Data for Name: django_evolution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_evolution (id, version_id, app_label, label) FROM stdin;
1	1	auth	auth_delete_message
2	1	auth	auth_unique_together_baseline
3	1	contenttypes	contenttypes_unique_together_baseline
4	1	sessions	session_expire_date_db_index
5	1	extensions	update_app_label
6	1	privacy	audit_indentifier
7	1	siteconfig	update_app_label
8	1	accounts	is_private
9	1	accounts	timezone
10	1	accounts	open_an_issue
11	1	accounts	extra_data
12	1	accounts	timezone_length_30
13	1	accounts	localsiteprofile_permissions
14	1	accounts	unique_together_baseline
15	1	accounts	profile_show_closed
16	1	accounts	profile_should_send_email
17	1	accounts	profile_should_send_own_updates
18	1	accounts	profile_default_use_rich_text
19	1	accounts	reviewrequestvisit_visibility
20	1	accounts	profile_settings
21	1	attachments	file_attachment_orig_filename
22	1	attachments	file_attachment_file_max_length_512
23	1	attachments	file_attachment_repo_info
24	1	attachments	file_attachment_repo_path_no_index
25	1	attachments	file_attachment_repo_revision_max_length_64
26	1	attachments	file_attachment_revision
27	1	attachments	file_attachment_ownership
28	1	attachments	file_attachment_uuid
29	1	changedescs	rich_text
30	1	changedescs	changedesc_user
31	1	diffviewer	add_parent_diffs
32	1	diffviewer	filediff_filenames_1024_chars
33	1	diffviewer	diffset_basedir
34	1	diffviewer	filediff_status
35	1	diffviewer	add_diff_hash
36	1	diffviewer	diffsethistory_diff_updated
37	1	diffviewer	filediffdata_line_counts
38	1	diffviewer	diffset_base_commit_id
39	1	diffviewer	filediffdata_extra_data
40	1	diffviewer	all_extra_data
41	1	diffviewer	raw_diff_file_data
42	1	hostingsvcs	account_hosting_url
43	1	hostingsvcs	account_hosting_url_max_length_255
44	1	hostingsvcs	account_unique_together_baseline
45	1	notifications	webhooktarget_extra_state
46	1	notifications	webhooktarget_extra_data_null
47	1	oauth	disabled_for_security
48	1	reviews	change_descriptions
49	1	reviews	last_review_timestamp
50	1	reviews	shipit_count
51	1	reviews	default_reviewer_repositories
52	1	reviews	null_repository
53	1	reviews	localsite
54	1	reviews	group_incoming_request_count
55	1	reviews	group_invite_only
56	1	reviews	group_visible
57	1	reviews	default_reviewer_local_site
58	1	reviews	add_issues_to_comments
59	1	reviews	file_attachments
60	1	reviews	file_attachment_comment_extra_data
61	1	reviews	review_request_last_review_activity_timestamp
62	1	reviews	review_request_depends_on
63	1	reviews	commit_id
64	1	reviews	file_attachment_comment_diff_id
65	1	reviews	rich_text
66	1	reviews	base_comment_extra_data
67	1	reviews	unique_together_baseline
68	1	reviews	extra_data
69	1	reviews	review_request_issue_counts
70	1	reviews	group_mailing_list_charfield
71	1	reviews	review_request_draft_commit_id
72	1	reviews	group_email_list_only
73	1	reviews	review_request_file_attachment_histories
74	1	reviews	review_request_summary_index
75	1	reviews	review_request_summary_index_manual
76	1	reviews	split_rich_text
77	1	reviews	is_default_group
78	1	reviews	general_comments
79	1	reviews	add_owner_to_draft
80	1	reviews	status_update_timeout
81	1	reviews	comment_issue_verification
82	1	reviews	review_request_screenshot_attachment_counters
83	1	scmtools	bugzilla_url_charfield
84	1	scmtools	repository_raw_file_url
85	1	scmtools	repository_visible
86	1	scmtools	repository_path_length_255
87	1	scmtools	localsite
88	1	scmtools	repository_access_control
89	1	scmtools	group_site
90	1	scmtools	repository_hosting_accounts
91	1	scmtools	repository_extra_data_null
92	1	scmtools	unique_together_baseline
93	1	scmtools	repository_archive
94	1	scmtools	repository_hooks_uuid
95	1	scmtools	repository_raw_password
96	1	scmtools	repository_name_length_255
97	1	site	localsite_public
98	1	site	localsite_extra_data
99	1	webapi	webapitoken_jsonfield_null
\.


--
-- Data for Name: django_project_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_project_version (id, signature, "when") FROM stdin;
1	(dp1\nS'changedescs'\np2\nccopy_reg\n_reconstructor\np3\n(cdjango.utils.datastructures\nSortedDict\np4\nc__builtin__\ndict\np5\n(dp6\nS'ChangeDescription'\np7\n(dp8\nS'fields'\np9\n(dp10\nS'timestamp'\np11\n(dp12\nS'field_type'\np13\ncdjango.db.models.fields\nDateTimeField\np14\nssS'rich_text'\np15\n(dp16\ng13\ncdjango.db.models.fields\nBooleanField\np17\nssS'fields_changed'\np18\n(dp19\ng13\ncdjblets.db.fields.json_field\nJSONField\np20\nssS'user'\np21\n(dp22\ng13\ncdjango.db.models.fields.related\nForeignKey\np23\nsS'null'\np24\nI01\nsS'related_model'\np25\nS'auth.User'\np26\nssS'text'\np27\n(dp28\ng13\ncdjango.db.models.fields\nTextField\np29\nssS'id'\np30\n(dp31\ng13\ncdjango.db.models.fields\nAutoField\np32\nsS'primary_key'\np33\nI01\nssS'public'\np34\n(dp35\ng13\ng17\nsssS'meta'\np36\n(dp37\nS'unique_together'\np38\n(lp39\nsS'pk_column'\np40\nS'id'\np41\nsS'index_together'\np42\n(lp43\nsS'db_table'\np44\nVchangedescs_changedescription\np45\nsS'db_tablespace'\np46\nS''\nsS'__unique_together_applied'\np47\nI01\nssstRp48\n(dp49\nS'keyOrder'\np50\n(lp51\ng7\nasbsS'attachments'\np52\ng3\n(g4\ng5\n(dp53\nS'FileAttachmentHistory'\np54\n(dp55\ng9\n(dp56\nS'display_position'\np57\n(dp58\ng13\ncdjango.db.models.fields\nIntegerField\np59\nssS'latest_revision'\np60\n(dp61\ng13\ncdjblets.db.fields.relation_counter_field\nRelationCounterField\np62\nsg24\nI01\nssS'id'\np63\n(dp64\ng13\ng32\nsg33\nI01\nsssg36\n(dp65\ng38\n(lp66\nsg40\nS'id'\np67\nsg42\n(lp68\nsg44\nVattachments_fileattachmenthistory\np69\nsg46\nS''\nsg47\nI01\nsssS'FileAttachment'\np70\n(dp71\ng9\n(dp72\nS'orig_filename'\np73\n(dp74\nS'max_length'\np75\nI256\nsg13\ncdjango.db.models.fields\nCharField\np76\nsg24\nI01\nssS'mimetype'\np77\n(dp78\ng13\ng76\nsg75\nI256\nssS'added_in_filediff'\np79\n(dp80\ng13\ng23\nsg24\nI01\nsg25\nS'diffviewer.FileDiff'\np81\nssS'attachment_revision'\np82\n(dp83\ng13\ng59\nssS'uuid'\np84\n(dp85\ng13\ng76\nsg75\nI255\nssS'repository'\np86\n(dp87\ng13\ng23\nsg24\nI01\nsg25\nS'scmtools.Repository'\np88\nssS'local_site'\np89\n(dp90\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np91\nssS'repo_revision'\np92\n(dp93\ng75\nI64\nsg13\ng76\nsg24\nI01\nsS'db_index'\np94\nI01\nssS'draft_caption'\np95\n(dp96\ng13\ng76\nsg75\nI256\nssS'caption'\np97\n(dp98\ng13\ng76\nsg75\nI256\nssg21\n(dp99\ng13\ng23\nsg24\nI01\nsg25\nS'auth.User'\np100\nssS'file'\np101\n(dp102\ng75\nI512\nsg13\ncdjango.db.models.fields.files\nFileField\np103\nsg24\nI01\nssS'attachment_history'\np104\n(dp105\ng13\ng23\nsg24\nI01\nsg25\nS'attachments.FileAttachmentHistory'\np106\nssS'id'\np107\n(dp108\ng13\ng32\nsg33\nI01\nssS'repo_path'\np109\n(dp110\ng75\nI1024\nsg13\ng76\nsg24\nI01\nsssg36\n(dp111\ng38\n(lp112\nsg40\nS'id'\np113\nsg42\n(lp114\nsg44\nVattachments_fileattachment\np115\nsg46\nS''\nsg47\nI01\nssstRp116\n(dp117\ng50\n(lp118\ng54\nag70\nasbsS'hostingsvcs'\np119\ng3\n(g4\ng5\n(dp120\nS'HostingServiceAccount'\np121\n(dp122\ng9\n(dp123\nS'username'\np124\n(dp125\ng13\ng76\nsg75\nI128\nssg89\n(dp126\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np127\nssS'service_name'\np128\n(dp129\ng13\ng76\nsg75\nI128\nssS'visible'\np130\n(dp131\ng13\ng17\nssS'hosting_url'\np132\n(dp133\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS'data'\np134\n(dp135\ng13\ng20\nssS'id'\np136\n(dp137\ng13\ng32\nsg33\nI01\nsssg36\n(dp138\ng38\n(lp139\nsg40\nS'id'\np140\nsg42\n(lp141\nsg44\nVhostingsvcs_hostingserviceaccount\np142\nsg46\nS''\nsg47\nI01\nssstRp143\n(dp144\ng50\n(lp145\ng121\nasbsS'integrations'\np146\ng3\n(g4\ng5\n(dp147\nS'IntegrationConfig'\np148\n(dp149\ng9\n(dp150\nS'integration_id'\np151\n(dp152\ng13\ng76\nsg75\nI255\nsg94\nI01\nssS'last_updated'\np153\n(dp154\ng13\ng14\nssS'name'\np155\n(dp156\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS'settings'\np157\n(dp158\ng13\ng20\nssg89\n(dp159\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np160\nssS'enabled'\np161\n(dp162\ng13\ng17\nsg94\nI01\nssS'time_added'\np163\n(dp164\ng13\ng14\nssS'extra_data'\np165\n(dp166\ng13\ng20\nssS'id'\np167\n(dp168\ng13\ng32\nsg33\nI01\nsssg36\n(dp169\ng38\n(lp170\nsg40\nS'id'\np171\nsg42\n(lp172\nsg44\nVintegrations_integrationconfig\np173\nsg46\nS''\nsg47\nI01\nssstRp174\n(dp175\ng50\n(lp176\ng148\nasbsS'accounts'\np177\ng3\n(g4\ng5\n(dp178\nS'Profile'\np179\n(dp180\ng9\n(dp181\nS'review_request_columns'\np182\n(dp183\ng13\ng76\nsg75\nI256\nssS'dashboard_columns'\np184\n(dp185\ng13\ng76\nsg75\nI256\nssS'starred_review_requests'\np186\n(dp187\ng13\ncdjango.db.models.fields.related\nManyToManyField\np188\nsg25\nS'reviews.ReviewRequest'\np189\nssS'default_use_rich_text'\np190\n(dp191\ng13\ncdjango.db.models.fields\nNullBooleanField\np192\nsg24\nI01\nssS'should_send_email'\np193\n(dp194\ng13\ng17\nssS'timezone'\np195\n(dp196\ng13\ng76\nsg75\nI30\nssS'open_an_issue'\np197\n(dp198\ng13\ng17\nssS'id'\np199\n(dp200\ng13\ng32\nsg33\nI01\nssS'sort_group_columns'\np201\n(dp202\ng13\ng76\nsg75\nI256\nssS'starred_groups'\np203\n(dp204\ng13\ng188\nsg25\nS'reviews.Group'\np205\nssS'submitter_columns'\np206\n(dp207\ng13\ng76\nsg75\nI256\nssS'collapsed_diffs'\np208\n(dp209\ng13\ng17\nssS'first_time_setup_done'\np210\n(dp211\ng13\ng17\nssS'wordwrapped_diffs'\np212\n(dp213\ng13\ng17\nssg165\n(dp214\ng13\ng20\nsg24\nI01\nssS'sort_review_request_columns'\np215\n(dp216\ng13\ng76\nsg75\nI256\nssS'show_closed'\np217\n(dp218\ng13\ng17\nssS'sort_dashboard_columns'\np219\n(dp220\ng13\ng76\nsg75\nI256\nssg21\n(dp221\ng13\ng23\nsS'unique'\np222\nI01\nsg25\nS'auth.User'\np223\nssS'should_send_own_updates'\np224\n(dp225\ng13\ng17\nssS'is_private'\np226\n(dp227\ng13\ng17\nssS'syntax_highlighting'\np228\n(dp229\ng13\ng17\nssg157\n(dp230\ng13\ng20\nsg24\nI01\nssS'sort_submitter_columns'\np231\n(dp232\ng13\ng76\nsg75\nI256\nssS'group_columns'\np233\n(dp234\ng13\ng76\nsg75\nI256\nsssg36\n(dp235\ng38\n(lp236\nsg40\nS'id'\np237\nsg42\n(lp238\nsg44\nVaccounts_profile\np239\nsg46\nS''\nsg47\nI01\nsssS'Trophy'\np240\n(dp241\ng9\n(dp242\nS'category'\np243\n(dp244\ng13\ng76\nsg75\nI100\nssg89\n(dp245\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np246\nssg21\n(dp247\ng13\ng23\nsg25\nS'auth.User'\np248\nssS'review_request'\np249\n(dp250\ng13\ng23\nsg25\nS'reviews.ReviewRequest'\np251\nssS'id'\np252\n(dp253\ng13\ng32\nsg33\nI01\nssS'received_date'\np254\n(dp255\ng13\ng14\nsssg36\n(dp256\ng38\n(lp257\nsg40\nS'id'\np258\nsg42\n(lp259\nsg44\nVaccounts_trophy\np260\nsg46\nS''\nsg47\nI01\nsssS'ReviewRequestVisit'\np261\n(dp262\ng9\n(dp263\ng11\n(dp264\ng13\ng14\nssg249\n(dp265\ng13\ng23\nsg25\nS'reviews.ReviewRequest'\np266\nssS'id'\np267\n(dp268\ng13\ng32\nsg33\nI01\nssS'visibility'\np269\n(dp270\ng13\ng76\nsg75\nI1\nssg21\n(dp271\ng13\ng23\nsg25\nS'auth.User'\np272\nsssg36\n(dp273\ng38\n((Vuser\nVreview_request\nttp274\nsg40\nS'id'\np275\nsg42\n(lp276\n(Vuser\nVvisibility\ntp277\nasg44\nVaccounts_reviewrequestvisit\np278\nsg46\nS''\nsg47\nI01\nsssS'LocalSiteProfile'\np279\n(dp280\ng9\n(dp281\nS'profile'\np282\n(dp283\ng13\ng23\nsg25\nS'accounts.Profile'\np284\nssS'direct_incoming_request_count'\np285\n(dp286\ng13\ncdjblets.db.fields.counter_field\nCounterField\np287\nsg24\nI01\nssg89\n(dp288\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np289\nssS'starred_public_request_count'\np290\n(dp291\ng13\ng287\nsg24\nI01\nssS'total_outgoing_request_count'\np292\n(dp293\ng13\ng287\nsg24\nI01\nssS'pending_outgoing_request_count'\np294\n(dp295\ng13\ng287\nsg24\nI01\nssg21\n(dp296\ng13\ng23\nsg25\nS'auth.User'\np297\nssS'total_incoming_request_count'\np298\n(dp299\ng13\ng287\nsg24\nI01\nssS'id'\np300\n(dp301\ng13\ng32\nsg33\nI01\nssS'permissions'\np302\n(dp303\ng13\ng20\nsg24\nI01\nsssg36\n(dp304\ng38\n((Vuser\nVlocal_site\nt(Vprofile\nVlocal_site\nttp305\nsg40\nS'id'\np306\nsg42\n(lp307\nsg44\nVaccounts_localsiteprofile\np308\nsg46\nS''\nsg47\nI01\nssstRp309\n(dp310\ng50\n(lp311\ng261\nag179\nag279\nag240\nasbsS'diffviewer'\np312\ng3\n(g4\ng5\n(dp313\nS'LegacyFileDiffData'\np314\n(dp315\ng9\n(dp316\nS'binary'\np317\n(dp318\ng13\ncdjblets.db.fields.base64_field\nBase64Field\np319\nssg165\n(dp320\ng13\ng20\nsg24\nI01\nssS'binary_hash'\np321\n(dp322\ng13\ng76\nsg75\nI40\nsg33\nI01\nsssg36\n(dp323\ng38\n(lp324\nsg40\ng321\nsg42\n(lp325\nsg44\nVdiffviewer_filediffdata\np326\nsg46\nS''\nsg47\nI01\nsssS'DiffSet'\np327\n(dp328\ng9\n(dp329\nS'base_commit_id'\np330\n(dp331\ng75\nI64\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssg155\n(dp332\ng13\ng76\nsg75\nI256\nssg86\n(dp333\ng13\ng23\nsg25\nS'scmtools.Repository'\np334\nssg11\n(dp335\ng13\ng14\nssS'basedir'\np336\n(dp337\ng13\ng76\nsg75\nI256\nssS'diffcompat'\np338\n(dp339\ng13\ng59\nssg165\n(dp340\ng13\ng20\nsg24\nI01\nssS'history'\np341\n(dp342\ng13\ng23\nsg24\nI01\nsg25\nS'diffviewer.DiffSetHistory'\np343\nssS'id'\np344\n(dp345\ng13\ng32\nsg33\nI01\nssS'revision'\np346\n(dp347\ng13\ng59\nsssg36\n(dp348\ng38\n(lp349\nsg40\nS'id'\np350\nsg42\n(lp351\nsg44\nVdiffviewer_diffset\np352\nsg46\nS''\nsg47\nI01\nsssS'RawFileDiffData'\np353\n(dp354\ng9\n(dp355\ng317\n(dp356\ng13\ncdjango.db.models.fields\nBinaryField\np357\nssS'compression'\np358\n(dp359\ng75\nI1\nsg13\ng76\nsg24\nI01\nssS'id'\np360\n(dp361\ng13\ng32\nsg33\nI01\nssg165\n(dp362\ng13\ng20\nsg24\nI01\nssg321\n(dp363\ng75\nI40\nsg13\ng76\nsg222\nI01\nsssg36\n(dp364\ng38\n(lp365\nsg40\nS'id'\np366\nsg42\n(lp367\nsg44\nVdiffviewer_rawfilediffdata\np368\nsg46\nS''\nsg47\nI01\nsssS'DiffSetHistory'\np369\n(dp370\ng9\n(dp371\ng11\n(dp372\ng13\ng14\nssS'last_diff_updated'\np373\n(dp374\ng13\ng14\nsg24\nI01\nssS'id'\np375\n(dp376\ng13\ng32\nsg33\nI01\nssg165\n(dp377\ng13\ng20\nsg24\nI01\nssg155\n(dp378\ng13\ng76\nsg75\nI256\nsssg36\n(dp379\ng38\n(lp380\nsg40\nS'id'\np381\nsg42\n(lp382\nsg44\nVdiffviewer_diffsethistory\np383\nsg46\nS''\nsg47\nI01\nsssS'FileDiff'\np384\n(dp385\ng9\n(dp386\nS'status'\np387\n(dp388\ng13\ng76\nsg75\nI1\nssg317\n(dp389\ng13\ng17\nssS'diff_hash'\np390\n(dp391\ng13\ng23\nsg24\nI01\nsg25\nS'diffviewer.RawFileDiffData'\np392\nsS'db_column'\np393\nVraw_diff_hash_id\np394\nssS'diffset'\np395\n(dp396\ng13\ng23\nsg25\nS'diffviewer.DiffSet'\np397\nssS'dest_detail'\np398\n(dp399\ng13\ng76\nsg75\nI512\nssS'parent_diff_hash'\np400\n(dp401\ng13\ng23\nsg24\nI01\nsg25\nS'diffviewer.RawFileDiffData'\np402\nsg393\nVraw_parent_diff_hash_id\np403\nssS'diff64'\np404\n(dp405\ng13\ng319\nsg393\nVdiff_base64\np406\nssS'source_revision'\np407\n(dp408\ng13\ng76\nsg75\nI512\nssS'source_file'\np409\n(dp410\ng13\ng76\nsg75\nI1024\nssS'dest_file'\np411\n(dp412\ng13\ng76\nsg75\nI1024\nssS'parent_diff64'\np413\n(dp414\ng13\ng319\nsg393\nVparent_diff_base64\np415\nssS'legacy_diff_hash'\np416\n(dp417\ng13\ng23\nsg24\nI01\nsg25\nS'diffviewer.LegacyFileDiffData'\np418\nsg393\nVdiff_hash_id\np419\nssS'legacy_parent_diff_hash'\np420\n(dp421\ng13\ng23\nsg24\nI01\nsg25\nS'diffviewer.LegacyFileDiffData'\np422\nsg393\nVparent_diff_hash_id\np423\nssg165\n(dp424\ng13\ng20\nsg24\nI01\nssS'id'\np425\n(dp426\ng13\ng32\nsg33\nI01\nsssg36\n(dp427\ng38\n(lp428\nsg40\nS'id'\np429\nsg42\n(lp430\nsg44\nVdiffviewer_filediff\np431\nsg46\nS''\nsg47\nI01\nssstRp432\n(dp433\ng50\n(lp434\ng314\nag353\nag384\nag327\nag369\nasbsS'corsheaders'\np435\ng3\n(g4\ng5\n(dp436\nS'CorsModel'\np437\n(dp438\ng9\n(dp439\nS'id'\np440\n(dp441\ng13\ng32\nsg33\nI01\nssS'cors'\np442\n(dp443\ng13\ng76\nsg75\nI255\nsssg36\n(dp444\ng38\n(lp445\nsg40\nS'id'\np446\nsg42\n(lp447\nsg44\nVcorsheaders_corsmodel\np448\nsg46\nS''\nsg47\nI01\nssstRp449\n(dp450\ng50\n(lp451\ng437\nasbsS'privacy'\np452\ng3\n(g4\ng5\n(dp453\nS'StoredConsentData'\np454\n(dp455\ng9\n(dp456\ng153\n(dp457\ng13\ng14\nssS'consent_grants'\np458\n(dp459\ng13\ng20\nssS'audit_trail'\np460\n(dp461\ng13\ng20\nssS'audit_identifier'\np462\n(dp463\ng75\nI255\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssg21\n(dp464\ng13\ncdjango.db.models.fields.related\nOneToOneField\np465\nsg222\nI01\nsg24\nI01\nsg25\nS'auth.User'\np466\nssg163\n(dp467\ng13\ng14\nssS'id'\np468\n(dp469\ng13\ng32\nsg33\nI01\nsssg36\n(dp470\ng38\n(lp471\nsg40\nS'id'\np472\nsg42\n(lp473\nsg44\nVdjblets_privacy_storedconsentdata\np474\nsg46\nS''\nsg47\nI01\nssstRp475\n(dp476\ng50\n(lp477\ng454\nasbsS'sites'\np478\ng3\n(g4\ng5\n(dp479\nS'Site'\np480\n(dp481\ng9\n(dp482\nS'domain'\np483\n(dp484\ng13\ng76\nsg75\nI100\nssS'id'\np485\n(dp486\ng13\ng32\nsg33\nI01\nssg155\n(dp487\ng13\ng76\nsg75\nI50\nsssg36\n(dp488\ng38\n(lp489\nsg40\nS'id'\np490\nsg42\n(lp491\nsg44\nVdjango_site\np492\nsg46\nS''\nsg47\nI01\nssstRp493\n(dp494\ng50\n(lp495\ng480\nasbsS'scmtools'\np496\ng3\n(g4\ng5\n(dp497\nS'Tool'\np498\n(dp499\ng9\n(dp500\nS'class_name'\np501\n(dp502\ng75\nI128\nsg13\ng76\nsg222\nI01\nssS'id'\np503\n(dp504\ng13\ng32\nsg33\nI01\nssg155\n(dp505\ng75\nI32\nsg13\ng76\nsg222\nI01\nsssg36\n(dp506\ng38\n(lp507\nsg40\nS'id'\np508\nsg42\n(lp509\nsg44\nVscmtools_tool\np510\nsg46\nS''\nsg47\nI01\nsssS'Repository'\np511\n(dp512\ng9\n(dp513\ng124\n(dp514\ng13\ng76\nsg75\nI32\nssS'encrypted_password'\np515\n(dp516\ng13\ng76\nsg75\nI128\nsg393\nVpassword\np517\nssg89\n(dp518\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np519\nssg155\n(dp520\ng13\ng76\nsg75\nI255\nssS'review_groups'\np521\n(dp522\ng13\ng188\nsg25\nS'reviews.Group'\np523\nssS'encoding'\np524\n(dp525\ng13\ng76\nsg75\nI32\nssS'archived_timestamp'\np526\n(dp527\ng13\ng14\nsg24\nI01\nssS'mirror_path'\np528\n(dp529\ng13\ng76\nsg75\nI255\nssS'archived'\np530\n(dp531\ng13\ng17\nssS'tool'\np532\n(dp533\ng13\ng23\nsg25\nS'scmtools.Tool'\np534\nssS'hosting_account'\np535\n(dp536\ng13\ng23\nsg24\nI01\nsg25\nS'hostingsvcs.HostingServiceAccount'\np537\nssg34\n(dp538\ng13\ng17\nssg130\n(dp539\ng13\ng17\nssS'hooks_uuid'\np540\n(dp541\ng75\nI32\nsg13\ng76\nsg24\nI01\nssS'raw_file_url'\np542\n(dp543\ng13\ng76\nsg75\nI255\nssS'bug_tracker'\np544\n(dp545\ng13\ng76\nsg75\nI256\nssS'path'\np546\n(dp547\ng13\ng76\nsg75\nI255\nssg165\n(dp548\ng13\ng20\nsg24\nI01\nssS'id'\np549\n(dp550\ng13\ng32\nsg33\nI01\nssS'users'\np551\n(dp552\ng13\ng188\nsg25\nS'auth.User'\np553\nsssg36\n(dp554\ng38\n((Vname\nVlocal_site\nt(Varchived_timestamp\nVpath\nVlocal_site\nt(Vhooks_uuid\nVlocal_site\nttp555\nsg40\nS'id'\np556\nsg42\n(lp557\nsg44\nVscmtools_repository\np558\nsg46\nS''\nsg47\nI01\nssstRp559\n(dp560\ng50\n(lp561\ng498\nag511\nasbsS'contenttypes'\np562\ng3\n(g4\ng5\n(dp563\nS'ContentType'\np564\n(dp565\ng9\n(dp566\nS'model'\np567\n(dp568\ng13\ng76\nsg75\nI100\nssS'app_label'\np569\n(dp570\ng13\ng76\nsg75\nI100\nssS'id'\np571\n(dp572\ng13\ng32\nsg33\nI01\nssg155\n(dp573\ng13\ng76\nsg75\nI100\nsssg36\n(dp574\ng38\n((g569\ng567\nttp575\nsg40\nS'id'\np576\nsg42\n(lp577\nsg44\nS'django_content_type'\np578\nsg46\nS''\nsg47\nI01\nssstRp579\n(dp580\ng50\n(lp581\ng564\nasbsS'haystack'\np582\ng3\n(g4\ng5\n(dtRp583\n(dp584\ng50\n(lp585\nsbsS'__version__'\np586\nI1\nsS'webapi'\np587\ng3\n(g4\ng5\n(dp588\nS'WebAPIToken'\np589\n(dp590\ng9\n(dp591\ng153\n(dp592\ng13\ng14\nssg89\n(dp593\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np594\nssS'note'\np595\n(dp596\ng13\ng29\nssS'token'\np597\n(dp598\ng75\nI40\nsg13\ng76\nsg222\nI01\nssg21\n(dp599\ng13\ng23\nsg25\nS'auth.User'\np600\nssS'policy'\np601\n(dp602\ng13\ng20\nsg24\nI01\nssg163\n(dp603\ng13\ng14\nssg165\n(dp604\ng13\ng20\nsg24\nI01\nssS'id'\np605\n(dp606\ng13\ng32\nsg33\nI01\nsssg36\n(dp607\ng38\n(lp608\nsg40\nS'id'\np609\nsg42\n(lp610\nsg44\nVwebapi_webapitoken\np611\nsg46\nS''\nsg47\nI01\nssstRp612\n(dp613\ng50\n(lp614\ng589\nasbsS'sessions'\np615\ng3\n(g4\ng5\n(dp616\nS'Session'\np617\n(dp618\ng9\n(dp619\nS'session_key'\np620\n(dp621\ng13\ng76\nsg75\nI40\nsg33\nI01\nssS'expire_date'\np622\n(dp623\ng13\ng14\nsg94\nI01\nssS'session_data'\np624\n(dp625\ng13\ng29\nsssg36\n(dp626\ng38\n(lp627\nsg40\ng620\nsg42\n(lp628\nsg44\nS'django_session'\np629\nsg46\nS''\nsg47\nI01\nssstRp630\n(dp631\ng50\n(lp632\ng617\nasbsS'staticfiles'\np633\ng3\n(g4\ng5\n(dtRp634\n(dp635\ng50\n(lp636\nsbsS'auth'\np637\ng3\n(g4\ng5\n(dp638\nS'Group'\np639\n(dp640\ng9\n(dp641\ng302\n(dp642\ng13\ng188\nsg25\nS'auth.Permission'\np643\nssS'id'\np644\n(dp645\ng13\ng32\nsg33\nI01\nssg155\n(dp646\ng75\nI80\nsg13\ng76\nsg222\nI01\nsssg36\n(dp647\ng38\n(lp648\nsg40\nS'id'\np649\nsg42\n(lp650\nsg44\nVauth_group\np651\nsg46\nS''\nsg47\nI01\nsssS'User'\np652\n(dp653\ng9\n(dp654\ng124\n(dp655\ng75\nI30\nsg13\ng76\nsg222\nI01\nssS'first_name'\np656\n(dp657\ng13\ng76\nsg75\nI30\nssS'last_name'\np658\n(dp659\ng13\ng76\nsg75\nI30\nssS'is_active'\np660\n(dp661\ng13\ng17\nssS'email'\np662\n(dp663\ng13\ncdjango.db.models.fields\nEmailField\np664\nsg75\nI75\nssS'is_superuser'\np665\n(dp666\ng13\ng17\nssS'is_staff'\np667\n(dp668\ng13\ng17\nssS'last_login'\np669\n(dp670\ng13\ng14\nssS'groups'\np671\n(dp672\ng13\ng188\nsg25\nS'auth.Group'\np673\nssS'user_permissions'\np674\n(dp675\ng13\ng188\nsg25\nS'auth.Permission'\np676\nssS'password'\np677\n(dp678\ng13\ng76\nsg75\nI128\nssS'id'\np679\n(dp680\ng13\ng32\nsg33\nI01\nssS'date_joined'\np681\n(dp682\ng13\ng14\nsssg36\n(dp683\ng38\n(lp684\nsg40\nS'id'\np685\nsg42\n(lp686\nsg44\nVauth_user\np687\nsg46\nS''\nsg47\nI01\nsssS'Permission'\np688\n(dp689\ng9\n(dp690\nS'codename'\np691\n(dp692\ng13\ng76\nsg75\nI100\nssS'id'\np693\n(dp694\ng13\ng32\nsg33\nI01\nssS'content_type'\np695\n(dp696\ng13\ng23\nsg25\nS'contenttypes.ContentType'\np697\nssg155\n(dp698\ng13\ng76\nsg75\nI50\nsssg36\n(dp699\ng38\n((Vcontent_type\nVcodename\nttp700\nsg40\nS'id'\np701\nsg42\n(lp702\nsg44\nVauth_permission\np703\nsg46\nS''\nsg47\nI01\nssstRp704\n(dp705\ng50\n(lp706\ng688\nag639\nag652\nasbsS'site'\np707\ng3\n(g4\ng5\n(dp708\nS'LocalSite'\np709\n(dp710\ng9\n(dp711\ng551\n(dp712\ng13\ng188\nsg25\nS'auth.User'\np713\nssS'id'\np714\n(dp715\ng13\ng32\nsg33\nI01\nssS'admins'\np716\n(dp717\ng13\ng188\nsg25\nS'auth.User'\np718\nssg165\n(dp719\ng13\ng20\nsg24\nI01\nssg34\n(dp720\ng13\ng17\nssg155\n(dp721\ng75\nI32\nsg13\ncdjango.db.models.fields\nSlugField\np722\nsg222\nI01\nsg94\nI01\nsssg36\n(dp723\ng38\n(lp724\nsg40\nS'id'\np725\nsg42\n(lp726\nsg44\nVsite_localsite\np727\nsg46\nS''\nsg47\nI01\nssstRp728\n(dp729\ng50\n(lp730\ng709\nasbsS'notifications'\np731\ng3\n(g4\ng5\n(dp732\nS'WebHookTarget'\np733\n(dp734\ng9\n(dp735\ng89\n(dp736\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np737\nssg524\n(dp738\ng13\ng76\nsg75\nI40\nssS'url'\np739\n(dp740\ng13\ncdjango.db.models.fields\nURLField\np741\nsg75\nI200\nssS'repositories'\np742\n(dp743\ng13\ng188\nsg24\nI01\nsg25\nS'scmtools.Repository'\np744\nssS'custom_content'\np745\n(dp746\ng13\ng29\nsg24\nI01\nssg161\n(dp747\ng13\ng17\nssS'events'\np748\n(dp749\ng13\ncmultiselectfield.db.fields\nMultiSelectField\np750\nsg75\nI105\nssS'secret'\np751\n(dp752\ng13\ng76\nsg75\nI128\nssS'use_custom_content'\np753\n(dp754\ng13\ng17\nssS'apply_to'\np755\n(dp756\ng13\ng76\nsg75\nI1\nssg165\n(dp757\ng13\ng20\nsg24\nI01\nssS'id'\np758\n(dp759\ng13\ng32\nsg33\nI01\nsssg36\n(dp760\ng38\n(lp761\nsg40\nS'id'\np762\nsg42\n(lp763\nsg44\nVnotifications_webhooktarget\np764\nsg46\nS''\nsg47\nI01\nssstRp765\n(dp766\ng50\n(lp767\ng733\nasbsS'oauth'\np768\ng3\n(g4\ng5\n(dp769\nS'Application'\np770\n(dp771\ng9\n(dp772\nS'redirect_uris'\np773\n(dp774\ng13\ng29\nssg155\n(dp775\ng13\ng76\nsg75\nI255\nssg89\n(dp776\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np777\nssg161\n(dp778\ng13\ng17\nssS'client_type'\np779\n(dp780\ng13\ng76\nsg75\nI32\nssg21\n(dp781\ng13\ng23\nsg25\nS'auth.User'\np782\nssS'client_id'\np783\n(dp784\ng75\nI100\nsg13\ng76\nsg222\nI01\nsg94\nI01\nssS'skip_authorization'\np785\n(dp786\ng13\ng17\nssS'client_secret'\np787\n(dp788\ng13\ng76\nsg75\nI255\nsg94\nI01\nssg165\n(dp789\ng13\ng20\nsg24\nI01\nssS'original_user'\np790\n(dp791\ng13\ng23\nsg24\nI01\nsg25\nS'auth.User'\np792\nssS'id'\np793\n(dp794\ng13\ng32\nsg33\nI01\nssS'authorization_grant_type'\np795\n(dp796\ng13\ng76\nsg75\nI32\nsssg36\n(dp797\ng38\n(lp798\nsg40\nS'id'\np799\nsg42\n(lp800\nsg44\nVreviewboard_oauth_application\np801\nsg46\nS''\nsg47\nI01\nssstRp802\n(dp803\ng50\n(lp804\ng770\nasbsS'oauth2_provider'\np805\ng3\n(g4\ng5\n(dp806\ng770\n(dp807\ng9\n(dp808\ng773\n(dp809\ng13\ng29\nssg155\n(dp810\ng13\ng76\nsg75\nI255\nssg779\n(dp811\ng13\ng76\nsg75\nI32\nssg21\n(dp812\ng13\ng23\nsg25\nS'auth.User'\np813\nssg783\n(dp814\ng75\nI100\nsg13\ng76\nsg222\nI01\nsg94\nI01\nssg785\n(dp815\ng13\ng17\nssg787\n(dp816\ng13\ng76\nsg75\nI255\nsg94\nI01\nssS'id'\np817\n(dp818\ng13\ng32\nsg33\nI01\nssg795\n(dp819\ng13\ng76\nsg75\nI32\nsssg36\n(dp820\ng38\n(lp821\nsg40\nS'id'\np822\nsg42\n(lp823\nsg44\nVoauth2_provider_application\np824\nsg46\nS''\nsg47\nI01\nsssS'RefreshToken'\np825\n(dp826\ng9\n(dp827\nS'access_token'\np828\n(dp829\ng13\ng465\nsg222\nI01\nsg25\nS'oauth2_provider.AccessToken'\np830\nssS'application'\np831\n(dp832\ng13\ng23\nsg25\nS'oauth.Application'\np833\nssg597\n(dp834\ng13\ng76\nsg75\nI255\nsg94\nI01\nssS'id'\np835\n(dp836\ng13\ng32\nsg33\nI01\nssg21\n(dp837\ng13\ng23\nsg25\nS'auth.User'\np838\nsssg36\n(dp839\ng38\n(lp840\nsg40\nS'id'\np841\nsg42\n(lp842\nsg44\nVoauth2_provider_refreshtoken\np843\nsg46\nS''\nsg47\nI01\nsssS'AccessToken'\np844\n(dp845\ng9\n(dp846\nS'expires'\np847\n(dp848\ng13\ng14\nssg831\n(dp849\ng13\ng23\nsg25\nS'oauth.Application'\np850\nssg597\n(dp851\ng13\ng76\nsg75\nI255\nsg94\nI01\nssg21\n(dp852\ng13\ng23\nsg24\nI01\nsg25\nS'auth.User'\np853\nssS'scope'\np854\n(dp855\ng13\ng29\nssS'id'\np856\n(dp857\ng13\ng32\nsg33\nI01\nsssg36\n(dp858\ng38\n(lp859\nsg40\nS'id'\np860\nsg42\n(lp861\nsg44\nVoauth2_provider_accesstoken\np862\nsg46\nS''\nsg47\nI01\nsssS'Grant'\np863\n(dp864\ng9\n(dp865\nS'code'\np866\n(dp867\ng13\ng76\nsg75\nI255\nsg94\nI01\nssg847\n(dp868\ng13\ng14\nssg831\n(dp869\ng13\ng23\nsg25\nS'oauth.Application'\np870\nssS'redirect_uri'\np871\n(dp872\ng13\ng76\nsg75\nI255\nssg21\n(dp873\ng13\ng23\nsg25\nS'auth.User'\np874\nssg854\n(dp875\ng13\ng29\nssS'id'\np876\n(dp877\ng13\ng32\nsg33\nI01\nsssg36\n(dp878\ng38\n(lp879\nsg40\nS'id'\np880\nsg42\n(lp881\nsg44\nVoauth2_provider_grant\np882\nsg46\nS''\nsg47\nI01\nssstRp883\n(dp884\ng50\n(lp885\ng770\nag863\nag844\nag825\nasbsS'admin'\np886\ng3\n(g4\ng5\n(dp887\nS'LogEntry'\np888\n(dp889\ng9\n(dp890\nS'action_flag'\np891\n(dp892\ng13\ncdjango.db.models.fields\nPositiveSmallIntegerField\np893\nssS'action_time'\np894\n(dp895\ng13\ng14\nssS'object_repr'\np896\n(dp897\ng13\ng76\nsg75\nI200\nssS'object_id'\np898\n(dp899\ng13\ng29\nsg24\nI01\nssS'change_message'\np900\n(dp901\ng13\ng29\nssg21\n(dp902\ng13\ng23\nsg25\nS'auth.User'\np903\nssg695\n(dp904\ng13\ng23\nsg24\nI01\nsg25\nS'contenttypes.ContentType'\np905\nssS'id'\np906\n(dp907\ng13\ng32\nsg33\nI01\nsssg36\n(dp908\ng38\n(lp909\nsg40\nS'id'\np910\nsg42\n(lp911\nsg44\nVdjango_admin_log\np912\nsg46\nS''\nsg47\nI01\nssstRp913\n(dp914\ng50\n(lp915\ng888\nasbsS'siteconfig'\np916\ng3\n(g4\ng5\n(dp917\nS'SiteConfiguration'\np918\n(dp919\ng9\n(dp920\nS'version'\np921\n(dp922\ng13\ng76\nsg75\nI20\nssS'id'\np923\n(dp924\ng13\ng32\nsg33\nI01\nssg157\n(dp925\ng13\ng20\nssS'site'\np926\n(dp927\ng13\ng23\nsg25\nS'sites.Site'\np928\nsssg36\n(dp929\ng38\n(lp930\nsg40\nS'id'\np931\nsg42\n(lp932\nsg44\nVsiteconfig_siteconfiguration\np933\nsg46\nS''\nsg47\nI01\nssstRp934\n(dp935\ng50\n(lp936\ng918\nasbsS'reviews'\np937\ng3\n(g4\ng5\n(dp938\nS'Comment'\np939\n(dp940\ng9\n(dp941\nS'issue_opened'\np942\n(dp943\ng13\ng17\nssS'interfilediff'\np944\n(dp945\ng13\ng23\nsg24\nI01\nsg25\nS'diffviewer.FileDiff'\np946\nssS'num_lines'\np947\n(dp948\ng13\ncdjango.db.models.fields\nPositiveIntegerField\np949\nsg24\nI01\nssg11\n(dp950\ng13\ng14\nssg15\n(dp951\ng13\ng17\nssg27\n(dp952\ng13\ng29\nssS'reply_to'\np953\n(dp954\ng13\ng23\nsg24\nI01\nsg25\nS'reviews.Comment'\np955\nssS'first_line'\np956\n(dp957\ng13\ng949\nsg24\nI01\nssg165\n(dp958\ng13\ng20\nsg24\nI01\nssS'id'\np959\n(dp960\ng13\ng32\nsg33\nI01\nssS'issue_status'\np961\n(dp962\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssS'filediff'\np963\n(dp964\ng13\ng23\nsg25\nS'diffviewer.FileDiff'\np965\nsssg36\n(dp966\ng38\n(lp967\nsg40\nS'id'\np968\nsg42\n(lp969\nsg44\nVreviews_comment\np970\nsg46\nS''\nsg47\nI01\nsssg639\n(dp971\ng9\n(dp972\ng165\n(dp973\ng13\ng20\nsg24\nI01\nssS'display_name'\np974\n(dp975\ng13\ng76\nsg75\nI64\nssg155\n(dp976\ng13\ng722\nsg75\nI64\nsg94\nI01\nssg89\n(dp977\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np978\nssS'incoming_request_count'\np979\n(dp980\ng13\ng287\nsg24\nI01\nssS'is_default_group'\np981\n(dp982\ng13\ng17\nssg130\n(dp983\ng13\ng17\nssS'invite_only'\np984\n(dp985\ng13\ng17\nssS'email_list_only'\np986\n(dp987\ng13\ng17\nssS'id'\np988\n(dp989\ng13\ng32\nsg33\nI01\nssS'mailing_list'\np990\n(dp991\ng13\ng76\nsg75\nI254\nssg551\n(dp992\ng13\ng188\nsg25\nS'auth.User'\np993\nsssg36\n(dp994\ng38\n((Vname\nVlocal_site\nttp995\nsg40\nS'id'\np996\nsg42\n(lp997\nsg44\nVreviews_group\np998\nsg46\nS''\nsg47\nI01\nsssS'Screenshot'\np999\n(dp1000\ng9\n(dp1001\ng97\n(dp1002\ng13\ng76\nsg75\nI256\nssS'image'\np1003\n(dp1004\ng13\ncdjango.db.models.fields.files\nImageField\np1005\nsg75\nI100\nssS'id'\np1006\n(dp1007\ng13\ng32\nsg33\nI01\nssg95\n(dp1008\ng13\ng76\nsg75\nI256\nsssg36\n(dp1009\ng38\n(lp1010\nsg40\nS'id'\np1011\nsg42\n(lp1012\nsg44\nVreviews_screenshot\np1013\nsg46\nS''\nsg47\nI01\nsssS'FileAttachmentComment'\np1014\n(dp1015\ng9\n(dp1016\ng942\n(dp1017\ng13\ng17\nssg11\n(dp1018\ng13\ng14\nssS'diff_against_file_attachment'\np1019\n(dp1020\ng13\ng23\nsg24\nI01\nsg25\nS'attachments.FileAttachment'\np1021\nssg15\n(dp1022\ng13\ng17\nssS'file_attachment'\np1023\n(dp1024\ng13\ng23\nsg25\nS'attachments.FileAttachment'\np1025\nssg27\n(dp1026\ng13\ng29\nssg953\n(dp1027\ng13\ng23\nsg24\nI01\nsg25\nS'reviews.FileAttachmentComment'\np1028\nssg165\n(dp1029\ng13\ng20\nsg24\nI01\nssS'id'\np1030\n(dp1031\ng13\ng32\nsg33\nI01\nssg961\n(dp1032\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nsssg36\n(dp1033\ng38\n(lp1034\nsg40\nS'id'\np1035\nsg42\n(lp1036\nsg44\nVreviews_fileattachmentcomment\np1037\nsg46\nS''\nsg47\nI01\nsssS'Review'\np1038\n(dp1039\ng9\n(dp1040\nS'ship_it'\np1041\n(dp1042\ng13\ng17\nssS'base_reply_to'\np1043\n(dp1044\ng13\ng23\nsg24\nI01\nsg25\nS'reviews.Review'\np1045\nssS'email_message_id'\np1046\n(dp1047\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS'id'\np1048\n(dp1049\ng13\ng32\nsg33\nI01\nssS'body_top_rich_text'\np1050\n(dp1051\ng13\ng17\nssS'comments'\np1052\n(dp1053\ng13\ng188\nsg25\nS'reviews.Comment'\np1054\nssS'reviewed_diffset'\np1055\n(dp1056\ng13\ng23\nsg24\nI01\nsg25\nS'diffviewer.DiffSet'\np1057\nssg165\n(dp1058\ng13\ng20\nsg24\nI01\nssg249\n(dp1059\ng13\ng23\nsg25\nS'reviews.ReviewRequest'\np1060\nssg15\n(dp1061\ng13\ng17\nssS'file_attachment_comments'\np1062\n(dp1063\ng13\ng188\nsg25\nS'reviews.FileAttachmentComment'\np1064\nssg11\n(dp1065\ng13\ng14\nssS'general_comments'\np1066\n(dp1067\ng13\ng188\nsg25\nS'reviews.GeneralComment'\np1068\nssS'screenshot_comments'\np1069\n(dp1070\ng13\ng188\nsg25\nS'reviews.ScreenshotComment'\np1071\nssg21\n(dp1072\ng13\ng23\nsg25\nS'auth.User'\np1073\nssS'time_emailed'\np1074\n(dp1075\ng13\ng14\nsg24\nI01\nssS'body_bottom_reply_to'\np1076\n(dp1077\ng13\ng23\nsg24\nI01\nsg25\nS'reviews.Review'\np1078\nssS'body_top'\np1079\n(dp1080\ng13\ng29\nssS'body_bottom_rich_text'\np1081\n(dp1082\ng13\ng17\nssg34\n(dp1083\ng13\ng17\nssS'body_bottom'\np1084\n(dp1085\ng13\ng29\nssS'body_top_reply_to'\np1086\n(dp1087\ng13\ng23\nsg24\nI01\nsg25\nS'reviews.Review'\np1088\nsssg36\n(dp1089\ng38\n(lp1090\nsg40\nS'id'\np1091\nsg42\n(lp1092\nsg44\nVreviews_review\np1093\nsg46\nS''\nsg47\nI01\nsssS'ReviewRequestDraft'\np1094\n(dp1095\ng9\n(dp1096\ng153\n(dp1097\ng13\ncdjblets.db.fields.modification_timestamp_field\nModificationTimestampField\np1098\nssS'target_people'\np1099\n(dp1100\ng13\ng188\nsg25\nS'auth.User'\np1101\nssS'inactive_screenshots'\np1102\n(dp1103\ng13\ng188\nsg25\nS'reviews.Screenshot'\np1104\nssS'file_attachments'\np1105\n(dp1106\ng13\ng188\nsg25\nS'attachments.FileAttachment'\np1107\nssS'owner'\np1108\n(dp1109\ng13\ng23\nsg24\nI01\nsg25\nS'auth.User'\np1110\nssS'changedesc'\np1111\n(dp1112\ng13\ng23\nsg24\nI01\nsg25\nS'changedescs.ChangeDescription'\np1113\nssS'screenshots'\np1114\n(dp1115\ng13\ng188\nsg25\nS'reviews.Screenshot'\np1116\nssS'id'\np1117\n(dp1118\ng13\ng32\nsg33\nI01\nssS'inactive_file_attachments_count'\np1119\n(dp1120\ng13\ng62\nsg24\nI01\nssS'bugs_closed'\np1121\n(dp1122\ng13\ng76\nsg75\nI300\nssS'testing_done'\np1123\n(dp1124\ng13\ng29\nssS'description_rich_text'\np1125\n(dp1126\ng13\ng17\nssS'depends_on'\np1127\n(dp1128\ng13\ng188\nsg24\nI01\nsg25\nS'reviews.ReviewRequest'\np1129\nssg165\n(dp1130\ng13\ng20\nsg24\nI01\nssg249\n(dp1131\ng13\ng23\nsg222\nI01\nsg25\nS'reviews.ReviewRequest'\np1132\nssg15\n(dp1133\ng13\ng17\nssS'commit_id'\np1134\n(dp1135\ng75\nI64\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssS'file_attachments_count'\np1136\n(dp1137\ng13\ng62\nsg24\nI01\nssS'description'\np1138\n(dp1139\ng13\ng29\nssS'inactive_screenshots_count'\np1140\n(dp1141\ng13\ng62\nsg24\nI01\nssS'inactive_file_attachments'\np1142\n(dp1143\ng13\ng188\nsg25\nS'attachments.FileAttachment'\np1144\nssS'branch'\np1145\n(dp1146\ng13\ng76\nsg75\nI300\nssS'testing_done_rich_text'\np1147\n(dp1148\ng13\ng17\nssg395\n(dp1149\ng13\ng23\nsg24\nI01\nsg25\nS'diffviewer.DiffSet'\np1150\nssS'target_groups'\np1151\n(dp1152\ng13\ng188\nsg25\nS'reviews.Group'\np1153\nssS'summary'\np1154\n(dp1155\ng13\ng76\nsg75\nI300\nssS'screenshots_count'\np1156\n(dp1157\ng13\ng62\nsg24\nI01\nsssg36\n(dp1158\ng38\n(lp1159\nsg40\nS'id'\np1160\nsg42\n(lp1161\nsg44\nVreviews_reviewrequestdraft\np1162\nsg46\nS''\nsg47\nI01\nsssS'GeneralComment'\np1163\n(dp1164\ng9\n(dp1165\ng942\n(dp1166\ng13\ng17\nssg11\n(dp1167\ng13\ng14\nssg15\n(dp1168\ng13\ng17\nssg27\n(dp1169\ng13\ng29\nssg953\n(dp1170\ng13\ng23\nsg24\nI01\nsg25\nS'reviews.GeneralComment'\np1171\nssg165\n(dp1172\ng13\ng20\nsg24\nI01\nssS'id'\np1173\n(dp1174\ng13\ng32\nsg33\nI01\nssg961\n(dp1175\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nsssg36\n(dp1176\ng38\n(lp1177\nsg40\nS'id'\np1178\nsg42\n(lp1179\nsg44\nVreviews_generalcomment\np1180\nsg46\nS''\nsg47\nI01\nsssS'ReviewRequest'\np1181\n(dp1182\ng9\n(dp1183\nS'issue_verifying_count'\np1184\n(dp1185\ng13\ng287\nsg24\nI01\nssg387\n(dp1186\ng13\ng76\nsg75\nI1\nsg94\nI01\nssg153\n(dp1187\ng13\ng1098\nssg1099\n(dp1188\ng13\ng188\nsg25\nS'auth.User'\np1189\nssS'changedescs'\np1190\n(dp1191\ng13\ng188\nsg25\nS'changedescs.ChangeDescription'\np1192\nssg1102\n(dp1193\ng13\ng188\nsg25\nS'reviews.Screenshot'\np1194\nssg1046\n(dp1195\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS'last_review_activity_timestamp'\np1196\n(dp1197\ng13\ng14\nsg24\nI01\nsg393\nVlast_review_timestamp\np1198\nssS'diffset_history'\np1199\n(dp1200\ng13\ng23\nsg25\nS'diffviewer.DiffSetHistory'\np1201\nssg1114\n(dp1202\ng13\ng188\nsg25\nS'reviews.Screenshot'\np1203\nssS'id'\np1204\n(dp1205\ng13\ng32\nsg33\nI01\nssS'issue_dropped_count'\np1206\n(dp1207\ng13\ng287\nsg24\nI01\nssg1119\n(dp1208\ng13\ng62\nsg24\nI01\nssg1121\n(dp1209\ng13\ng76\nsg75\nI300\nssg1123\n(dp1210\ng13\ng29\nssg1125\n(dp1211\ng13\ng17\nssg1127\n(dp1212\ng13\ng188\nsg24\nI01\nsg25\nS'reviews.ReviewRequest'\np1213\nssg163\n(dp1214\ng13\ng14\nssg165\n(dp1215\ng13\ng20\nsg24\nI01\nssg34\n(dp1216\ng13\ng17\nssg1134\n(dp1217\ng75\nI64\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssS'shipit_count'\np1218\n(dp1219\ng13\ng287\nsg24\nI01\nssg1136\n(dp1220\ng13\ng62\nsg24\nI01\nssg1138\n(dp1221\ng13\ng29\nssg86\n(dp1222\ng13\ng23\nsg24\nI01\nsg25\nS'scmtools.Repository'\np1223\nssg1140\n(dp1224\ng13\ng62\nsg24\nI01\nssS'issue_resolved_count'\np1225\n(dp1226\ng13\ng287\nsg24\nI01\nssS'issue_open_count'\np1227\n(dp1228\ng13\ng287\nsg24\nI01\nssg1142\n(dp1229\ng13\ng188\nsg25\nS'attachments.FileAttachment'\np1230\nssg1145\n(dp1231\ng13\ng76\nsg75\nI300\nssS'file_attachment_histories'\np1232\n(dp1233\ng13\ng188\nsg25\nS'attachments.FileAttachmentHistory'\np1234\nssg1147\n(dp1235\ng13\ng17\nssg89\n(dp1236\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np1237\nssg1151\n(dp1238\ng13\ng188\nsg25\nS'reviews.Group'\np1239\nssg1154\n(dp1240\ng13\ng76\nsg75\nI300\nssS'changenum'\np1241\n(dp1242\ng13\ng949\nsg24\nI01\nsg94\nI01\nssS'local_id'\np1243\n(dp1244\ng13\ng59\nsg24\nI01\nssS'submitter'\np1245\n(dp1246\ng13\ng23\nsg25\nS'auth.User'\np1247\nssg1074\n(dp1248\ng13\ng14\nsg24\nI01\nssg15\n(dp1249\ng13\ng17\nssg1156\n(dp1250\ng13\ng62\nsg24\nI01\nssg1105\n(dp1251\ng13\ng188\nsg25\nS'attachments.FileAttachment'\np1252\nsssg36\n(dp1253\ng38\n((Vcommit_id\nVrepository\nt(Vchangenum\nVrepository\nt(Vlocal_site\nVlocal_id\nttp1254\nsg40\nS'id'\np1255\nsg42\n(lp1256\nsg44\nVreviews_reviewrequest\np1257\nsg46\nS''\nsg47\nI01\nsssS'StatusUpdate'\np1258\n(dp1259\ng9\n(dp1260\nS'change_description'\np1261\n(dp1262\ng13\ng23\nsg24\nI01\nsg25\nS'changedescs.ChangeDescription'\np1263\nssS'url_text'\np1264\n(dp1265\ng13\ng76\nsg75\nI64\nssg1138\n(dp1266\ng13\ng76\nsg75\nI255\nssg739\n(dp1267\ng13\ng741\nsg75\nI255\nssg11\n(dp1268\ng13\ng14\nssS'review'\np1269\n(dp1270\ng13\ng465\nsg222\nI01\nsg24\nI01\nsg25\nS'reviews.Review'\np1271\nssg1154\n(dp1272\ng13\ng76\nsg75\nI255\nssS'state'\np1273\n(dp1274\ng13\ng76\nsg75\nI1\nssg21\n(dp1275\ng13\ng23\nsg24\nI01\nsg25\nS'auth.User'\np1276\nssS'timeout'\np1277\n(dp1278\ng13\ng59\nsg24\nI01\nssS'service_id'\np1279\n(dp1280\ng13\ng76\nsg75\nI255\nssg165\n(dp1281\ng13\ng20\nsg24\nI01\nssg249\n(dp1282\ng13\ng23\nsg25\nS'reviews.ReviewRequest'\np1283\nssS'id'\np1284\n(dp1285\ng13\ng32\nsg33\nI01\nsssg36\n(dp1286\ng38\n(lp1287\nsg40\nS'id'\np1288\nsg42\n(lp1289\nsg44\nVreviews_statusupdate\np1290\nsg46\nS''\nsg47\nI01\nsssS'DefaultReviewer'\np1291\n(dp1292\ng9\n(dp1293\nS'file_regex'\np1294\n(dp1295\ng13\ng76\nsg75\nI256\nssg155\n(dp1296\ng13\ng76\nsg75\nI64\nssg86\n(dp1297\ng13\ng188\nsg25\nS'scmtools.Repository'\np1298\nssg89\n(dp1299\ng13\ng23\nsg24\nI01\nsg25\nS'site.LocalSite'\np1300\nssS'people'\np1301\n(dp1302\ng13\ng188\nsg25\nS'auth.User'\np1303\nssg671\n(dp1304\ng13\ng188\nsg25\nS'reviews.Group'\np1305\nssS'id'\np1306\n(dp1307\ng13\ng32\nsg33\nI01\nsssg36\n(dp1308\ng38\n(lp1309\nsg40\nS'id'\np1310\nsg42\n(lp1311\nsg44\nVreviews_defaultreviewer\np1312\nsg46\nS''\nsg47\nI01\nsssS'ScreenshotComment'\np1313\n(dp1314\ng9\n(dp1315\ng942\n(dp1316\ng13\ng17\nssS'screenshot'\np1317\n(dp1318\ng13\ng23\nsg25\nS'reviews.Screenshot'\np1319\nssg11\n(dp1320\ng13\ng14\nssg15\n(dp1321\ng13\ng17\nssS'y'\n(dp1322\ng13\ng893\nssS'h'\n(dp1323\ng13\ng893\nssS'w'\n(dp1324\ng13\ng893\nssg27\n(dp1325\ng13\ng29\nssg953\n(dp1326\ng13\ng23\nsg24\nI01\nsg25\nS'reviews.ScreenshotComment'\np1327\nssS'x'\n(dp1328\ng13\ng893\nsg24\nI01\nssg165\n(dp1329\ng13\ng20\nsg24\nI01\nssS'id'\np1330\n(dp1331\ng13\ng32\nsg33\nI01\nssg961\n(dp1332\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nsssg36\n(dp1333\ng38\n(lp1334\nsg40\nS'id'\np1335\nsg42\n(lp1336\nsg44\nVreviews_screenshotcomment\np1337\nsg46\nS''\nsg47\nI01\nssstRp1338\n(dp1339\ng50\n(lp1340\ng639\nag1291\nag939\nag1014\nag1163\nag999\nag1181\nag1313\nag1038\nag1094\nag1258\nasbsS'extensions'\np1341\ng3\n(g4\ng5\n(dp1342\nS'RegisteredExtension'\np1343\n(dp1344\ng9\n(dp1345\ng155\n(dp1346\ng13\ng76\nsg75\nI32\nssg157\n(dp1347\ng13\ng20\nssg501\n(dp1348\ng75\nI128\nsg13\ng76\nsg222\nI01\nssg161\n(dp1349\ng13\ng17\nssS'installed'\np1350\n(dp1351\ng13\ng17\nssS'id'\np1352\n(dp1353\ng13\ng32\nsg33\nI01\nsssg36\n(dp1354\ng38\n(lp1355\nsg40\nS'id'\np1356\nsg42\n(lp1357\nsg44\nVextensions_registeredextension\np1358\nsg46\nS''\nsg47\nI01\nssstRp1359\n(dp1360\ng50\n(lp1361\ng1343\nasbsS'django_evolution'\np1362\ng3\n(g4\ng5\n(dp1363\nS'Evolution'\np1364\n(dp1365\ng9\n(dp1366\nS'label'\np1367\n(dp1368\ng13\ng76\nsg75\nI100\nssg921\n(dp1369\ng13\ng23\nsg25\nS'django_evolution.Version'\np1370\nssS'id'\np1371\n(dp1372\ng13\ng32\nsg33\nI01\nssg569\n(dp1373\ng13\ng76\nsg75\nI200\nsssg36\n(dp1374\ng38\n(lp1375\nsg40\nS'id'\np1376\nsg42\n(lp1377\nsg44\nS'django_evolution'\np1378\nsg46\nS''\nsg47\nI01\nsssS'Version'\np1379\n(dp1380\ng9\n(dp1381\nS'when'\np1382\n(dp1383\ng13\ng14\nssS'id'\np1384\n(dp1385\ng13\ng32\nsg33\nI01\nssS'signature'\np1386\n(dp1387\ng13\ng29\nsssg36\n(dp1388\ng38\n(lp1389\nsg40\nS'id'\np1390\nsg42\n(lp1391\nsg44\nS'django_project_version'\np1392\nsg46\nS''\nsg47\nI01\nssstRp1393\n(dp1394\ng50\n(lp1395\ng1379\nag1364\nasbs.	2022-05-16 00:47:57.870922+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: djblets_privacy_storedconsentdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.djblets_privacy_storedconsentdata (id, user_id, audit_identifier, time_added, last_updated, consent_grants, audit_trail) FROM stdin;
\.


--
-- Data for Name: extensions_registeredextension; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extensions_registeredextension (id, class_name, name, enabled, installed, settings) FROM stdin;
\.


--
-- Data for Name: hostingsvcs_hostingserviceaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hostingsvcs_hostingserviceaccount (id, service_name, hosting_url, username, data, visible, local_site_id) FROM stdin;
\.


--
-- Data for Name: integrations_integrationconfig; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.integrations_integrationconfig (id, integration_id, time_added, last_updated, name, enabled, settings, extra_data, local_site_id) FROM stdin;
\.


--
-- Data for Name: notifications_webhooktarget; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications_webhooktarget (id, enabled, events, url, encoding, use_custom_content, custom_content, secret, apply_to, local_site_id, extra_data) FROM stdin;
\.


--
-- Data for Name: notifications_webhooktarget_repositories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications_webhooktarget_repositories (id, webhooktarget_id, repository_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_accesstoken (id, user_id, token, application_id, expires, scope) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_application (id, client_id, user_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, skip_authorization) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_grant (id, user_id, code, application_id, expires, redirect_uri, scope) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_refreshtoken (id, user_id, token, application_id, access_token_id) FROM stdin;
\.


--
-- Data for Name: reviewboard_oauth_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviewboard_oauth_application (id, client_id, user_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, skip_authorization, enabled, original_user_id, local_site_id, extra_data) FROM stdin;
\.


--
-- Data for Name: reviews_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_comment (id, issue_opened, issue_status, reply_to_id, "timestamp", text, rich_text, extra_data, filediff_id, interfilediff_id, first_line, num_lines) FROM stdin;
\.


--
-- Data for Name: reviews_defaultreviewer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_defaultreviewer (id, name, file_regex, local_site_id) FROM stdin;
\.


--
-- Data for Name: reviews_defaultreviewer_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_defaultreviewer_groups (id, defaultreviewer_id, group_id) FROM stdin;
\.


--
-- Data for Name: reviews_defaultreviewer_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_defaultreviewer_people (id, defaultreviewer_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviews_defaultreviewer_repository; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_defaultreviewer_repository (id, defaultreviewer_id, repository_id) FROM stdin;
\.


--
-- Data for Name: reviews_fileattachmentcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_fileattachmentcomment (id, issue_opened, issue_status, reply_to_id, "timestamp", text, rich_text, extra_data, file_attachment_id, diff_against_file_attachment_id) FROM stdin;
\.


--
-- Data for Name: reviews_generalcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_generalcomment (id, issue_opened, issue_status, reply_to_id, "timestamp", text, rich_text, extra_data) FROM stdin;
\.


--
-- Data for Name: reviews_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_group (id, name, display_name, mailing_list, email_list_only, local_site_id, is_default_group, incoming_request_count, invite_only, visible, extra_data) FROM stdin;
\.


--
-- Data for Name: reviews_group_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_group_users (id, group_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviews_review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review (id, review_request_id, user_id, "timestamp", public, ship_it, base_reply_to_id, email_message_id, time_emailed, body_top, body_top_rich_text, body_bottom, body_bottom_rich_text, body_top_reply_to_id, body_bottom_reply_to_id, extra_data, rich_text, reviewed_diffset_id) FROM stdin;
\.


--
-- Data for Name: reviews_review_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review_comments (id, review_id, comment_id) FROM stdin;
\.


--
-- Data for Name: reviews_review_file_attachment_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review_file_attachment_comments (id, review_id, fileattachmentcomment_id) FROM stdin;
\.


--
-- Data for Name: reviews_review_general_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review_general_comments (id, review_id, generalcomment_id) FROM stdin;
\.


--
-- Data for Name: reviews_review_screenshot_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review_screenshot_comments (id, review_id, screenshotcomment_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest (id, description, description_rich_text, testing_done, testing_done_rich_text, bugs_closed, branch, commit_id, extra_data, rich_text, summary, submitter_id, time_added, last_updated, status, public, changenum, repository_id, email_message_id, time_emailed, diffset_history_id, last_review_timestamp, shipit_count, issue_open_count, issue_resolved_count, issue_dropped_count, issue_verifying_count, screenshots_count, inactive_screenshots_count, file_attachments_count, inactive_file_attachments_count, local_site_id, local_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_changedescs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_changedescs (id, reviewrequest_id, changedescription_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_depends_on; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_depends_on (id, from_reviewrequest_id, to_reviewrequest_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_file_attachment_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_file_attachment_histories (id, reviewrequest_id, fileattachmenthistory_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_file_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_file_attachments (id, reviewrequest_id, fileattachment_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_inactive_file_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_inactive_file_attachments (id, reviewrequest_id, fileattachment_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_inactive_screenshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_inactive_screenshots (id, reviewrequest_id, screenshot_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_screenshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_screenshots (id, reviewrequest_id, screenshot_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_target_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_target_groups (id, reviewrequest_id, group_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_target_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_target_people (id, reviewrequest_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft (id, description, description_rich_text, testing_done, testing_done_rich_text, bugs_closed, branch, commit_id, extra_data, rich_text, summary, owner_id, review_request_id, last_updated, diffset_id, changedesc_id, screenshots_count, inactive_screenshots_count, file_attachments_count, inactive_file_attachments_count) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_depends_on; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_depends_on (id, reviewrequestdraft_id, reviewrequest_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_file_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_file_attachments (id, reviewrequestdraft_id, fileattachment_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_inactive_file_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_inactive_file_attachments (id, reviewrequestdraft_id, fileattachment_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_inactive_screenshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_inactive_screenshots (id, reviewrequestdraft_id, screenshot_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_screenshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_screenshots (id, reviewrequestdraft_id, screenshot_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_target_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_target_groups (id, reviewrequestdraft_id, group_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_target_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_target_people (id, reviewrequestdraft_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviews_screenshot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_screenshot (id, caption, draft_caption, image) FROM stdin;
\.


--
-- Data for Name: reviews_screenshotcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_screenshotcomment (id, issue_opened, issue_status, reply_to_id, "timestamp", text, rich_text, extra_data, screenshot_id, x, y, w, h) FROM stdin;
\.


--
-- Data for Name: reviews_statusupdate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_statusupdate (id, service_id, user_id, "timestamp", summary, description, url, url_text, state, review_request_id, change_description_id, review_id, extra_data, timeout) FROM stdin;
\.


--
-- Data for Name: scmtools_repository; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scmtools_repository (id, name, path, mirror_path, raw_file_url, username, password, extra_data, tool_id, hosting_account_id, bug_tracker, encoding, visible, archived, archived_timestamp, local_site_id, public, hooks_uuid) FROM stdin;
\.


--
-- Data for Name: scmtools_repository_review_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scmtools_repository_review_groups (id, repository_id, group_id) FROM stdin;
\.


--
-- Data for Name: scmtools_repository_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scmtools_repository_users (id, repository_id, user_id) FROM stdin;
\.


--
-- Data for Name: scmtools_tool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scmtools_tool (id, name, class_name) FROM stdin;
1	Subversion	reviewboard.scmtools.svn.SVNTool
2	Git	reviewboard.scmtools.git.GitTool
3	Bazaar	reviewboard.scmtools.bzr.BZRTool
4	CVS	reviewboard.scmtools.cvs.CVSTool
5	Perforce	reviewboard.scmtools.perforce.PerforceTool
6	Plastic SCM	reviewboard.scmtools.plastic.PlasticTool
7	ClearCase	reviewboard.scmtools.clearcase.ClearCaseTool
8	Mercurial	reviewboard.scmtools.hg.HgTool
9	Team Foundation Server	rbpowerpack.scmtools.tfs.TFSTool
10	Team Foundation Server (git)	rbpowerpack.scmtools.tfs_git.TFSGitTool
\.


--
-- Data for Name: site_localsite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_localsite (id, name, public, extra_data) FROM stdin;
\.


--
-- Data for Name: site_localsite_admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_localsite_admins (id, localsite_id, user_id) FROM stdin;
\.


--
-- Data for Name: site_localsite_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_localsite_users (id, localsite_id, user_id) FROM stdin;
\.


--
-- Data for Name: siteconfig_siteconfiguration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siteconfig_siteconfiguration (id, site_id, version, settings) FROM stdin;
1	1	3.0.24	{"auth_ad_domain_controller": null, "auth_ad_domain_name": null, "auth_ad_find_dc_from_dns": null, "auth_ad_group_name": null, "auth_ad_ou_name": null, "auth_ad_recursion_depth": null, "auth_ad_search_root": null, "auth_ad_use_tls": null, "auth_backend": "builtin", "auth_digest_file_location": null, "auth_digest_realm": null, "auth_ldap_anon_bind_passwd": "", "auth_ldap_anon_bind_uid": "", "auth_ldap_base_dn": null, "auth_ldap_email_attribute": null, "auth_ldap_email_domain": "", "auth_ldap_full_name_attribute": null, "auth_ldap_given_name_attribute": null, "auth_ldap_surname_attribute": null, "auth_ldap_tls": false, "auth_ldap_uid": "uid", "auth_ldap_uid_mask": "", "auth_ldap_uri": "", "auth_nis_email_domain": "", "auth_require_sitewide_login": false, "auth_x509_autocreate_users": false, "auth_x509_custom_username_field": null, "auth_x509_username_field": "SSL_CLIENT_S_DN_CN", "auth_x509_username_regex": "", "aws_access_key_id": "", "aws_calling_format": 2, "aws_default_acl": "public-read", "aws_headers": {}, "aws_querystring_active": false, "aws_querystring_auth": false, "aws_querystring_expire": 60, "aws_s3_bucket_name": "", "aws_s3_secure_urls": false, "aws_secret_access_key": "", "cache_backend": {"default": {"BACKEND": "djblets.cache.forwarding_backend.ForwardingCacheBackend", "LOCATION": "forwarded_backend"}, "forwarded_backend": {"BACKEND": "django.core.cache.backends.locmem.LocMemCache", "LOCATION": "reviewboard"}, "staticfiles": {"BACKEND": "django.core.cache.backends.locmem.LocMemCache", "LOCATION": "staticfiles-filehashes"}}, "cache_expiration_time": 2592000, "couchdb_default_server": "", "couchdb_storage_options": {}, "diffviewer_context_num_lines": 5, "diffviewer_include_space_patterns": [], "diffviewer_paginate_by": 20, "diffviewer_paginate_orphans": 10, "diffviewer_syntax_highlighting": true, "locale_date_format": "N j, Y", "locale_datetime_format": "N j, Y, P", "locale_default_charset": "utf-8", "locale_language_code": "en-us", "locale_month_day_format": "F j", "locale_time_format": "P", "locale_timezone": "UTC", "locale_year_month_format": "F Y", "logging_allow_profiling": false, "logging_directory": null, "logging_enabled": true, "logging_level": "DEBUG", "mail_default_from": "webmaster@localhost", "mail_host": "localhost", "mail_host_password": "", "mail_host_user": "", "mail_port": 25, "mail_send_review_mail": false, "mail_server_address": "root@localhost", "mail_use_tls": false, "recaptcha_private_key": null, "recaptcha_public_key": null, "search_enable": false, "search_index_file": null, "site_admin_email": "admin@example.com", "site_admin_name": "Example Admin", "site_domain_method": "http", "site_media_root": "/tmp/sitedir/htdocs/media", "site_media_url": "/media/", "site_prepend_www": false, "site_static_root": "/tmp/sitedir/htdocs/static", "site_static_url": "/static/", "site_upload_max_memory_size": 2621440, "site_upload_temp_dir": null, "swift_auth_url": "", "swift_auth_version": "1", "swift_container_name": "", "swift_key": "", "swift_username": ""}
\.


--
-- Data for Name: webapi_webapitoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webapi_webapitoken (id, user_id, token, time_added, last_updated, note, policy, extra_data, local_site_id) FROM stdin;
\.


--
-- Name: accounts_localsiteprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_localsiteprofile_id_seq', 1, false);


--
-- Name: accounts_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_profile_id_seq', 1, false);


--
-- Name: accounts_profile_starred_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_profile_starred_groups_id_seq', 1, false);


--
-- Name: accounts_profile_starred_review_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_profile_starred_review_requests_id_seq', 1, false);


--
-- Name: accounts_reviewrequestvisit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_reviewrequestvisit_id_seq', 1, false);


--
-- Name: accounts_trophy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_trophy_id_seq', 1, false);


--
-- Name: attachments_fileattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_fileattachment_id_seq', 1, false);


--
-- Name: attachments_fileattachmenthistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_fileattachmenthistory_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 148, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: changedescs_changedescription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.changedescs_changedescription_id_seq', 1, false);


--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.corsheaders_corsmodel_id_seq', 1, false);


--
-- Name: diffviewer_diffset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diffviewer_diffset_id_seq', 1, false);


--
-- Name: diffviewer_diffsethistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diffviewer_diffsethistory_id_seq', 1, false);


--
-- Name: diffviewer_filediff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diffviewer_filediff_id_seq', 1, false);


--
-- Name: diffviewer_rawfilediffdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diffviewer_rawfilediffdata_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 48, true);


--
-- Name: django_evolution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_evolution_id_seq', 99, true);


--
-- Name: django_project_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_project_version_id_seq', 1, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: djblets_privacy_storedconsentdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.djblets_privacy_storedconsentdata_id_seq', 1, false);


--
-- Name: extensions_registeredextension_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.extensions_registeredextension_id_seq', 1, false);


--
-- Name: hostingsvcs_hostingserviceaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hostingsvcs_hostingserviceaccount_id_seq', 1, false);


--
-- Name: integrations_integrationconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.integrations_integrationconfig_id_seq', 1, false);


--
-- Name: notifications_webhooktarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_webhooktarget_id_seq', 1, false);


--
-- Name: notifications_webhooktarget_repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_webhooktarget_repositories_id_seq', 1, false);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 1, false);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: reviewboard_oauth_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviewboard_oauth_application_id_seq', 1, false);


--
-- Name: reviews_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_comment_id_seq', 1, false);


--
-- Name: reviews_defaultreviewer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_defaultreviewer_groups_id_seq', 1, false);


--
-- Name: reviews_defaultreviewer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_defaultreviewer_id_seq', 1, false);


--
-- Name: reviews_defaultreviewer_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_defaultreviewer_people_id_seq', 1, false);


--
-- Name: reviews_defaultreviewer_repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_defaultreviewer_repository_id_seq', 1, false);


--
-- Name: reviews_fileattachmentcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_fileattachmentcomment_id_seq', 1, false);


--
-- Name: reviews_generalcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_generalcomment_id_seq', 1, false);


--
-- Name: reviews_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_group_id_seq', 1, false);


--
-- Name: reviews_group_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_group_users_id_seq', 1, false);


--
-- Name: reviews_review_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_comments_id_seq', 1, false);


--
-- Name: reviews_review_file_attachment_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_file_attachment_comments_id_seq', 1, false);


--
-- Name: reviews_review_general_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_general_comments_id_seq', 1, false);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 1, false);


--
-- Name: reviews_review_screenshot_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_screenshot_comments_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_changedescs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_changedescs_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_depends_on_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_depends_on_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_file_attachment_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_file_attachment_histories_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_file_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_file_attachments_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_inactive_file_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_inactive_file_attachments_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_inactive_screenshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_inactive_screenshots_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_screenshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_screenshots_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_target_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_target_groups_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_target_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_target_people_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_depends_on_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_depends_on_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_file_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_file_attachments_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_inactive_file_attachments_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_inactive_screenshots_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_screenshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_screenshots_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_target_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_target_groups_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_target_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_target_people_id_seq', 1, false);


--
-- Name: reviews_screenshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_screenshot_id_seq', 1, false);


--
-- Name: reviews_screenshotcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_screenshotcomment_id_seq', 1, false);


--
-- Name: reviews_statusupdate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_statusupdate_id_seq', 1, false);


--
-- Name: scmtools_repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scmtools_repository_id_seq', 1, false);


--
-- Name: scmtools_repository_review_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scmtools_repository_review_groups_id_seq', 1, false);


--
-- Name: scmtools_repository_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scmtools_repository_users_id_seq', 1, false);


--
-- Name: scmtools_tool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scmtools_tool_id_seq', 10, true);


--
-- Name: site_localsite_admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_localsite_admins_id_seq', 1, false);


--
-- Name: site_localsite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_localsite_id_seq', 1, false);


--
-- Name: site_localsite_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_localsite_users_id_seq', 1, false);


--
-- Name: siteconfig_siteconfiguration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.siteconfig_siteconfiguration_id_seq', 1, true);


--
-- Name: webapi_webapitoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webapi_webapitoken_id_seq', 1, false);


--
-- Name: accounts_localsiteprofile accounts_localsiteprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsiteprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_localsiteprofile accounts_localsiteprofile_profile_id_local_site_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsiteprofile_profile_id_local_site_id_key UNIQUE (profile_id, local_site_id);


--
-- Name: accounts_localsiteprofile accounts_localsiteprofile_user_id_local_site_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsiteprofile_user_id_local_site_id_key UNIQUE (user_id, local_site_id);


--
-- Name: accounts_profile accounts_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile_starred_groups accounts_profile_starred_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_groups
    ADD CONSTRAINT accounts_profile_starred_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile_starred_groups accounts_profile_starred_groups_profile_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_groups
    ADD CONSTRAINT accounts_profile_starred_groups_profile_id_group_id_key UNIQUE (profile_id, group_id);


--
-- Name: accounts_profile_starred_review_requests accounts_profile_starred_review_profile_id_reviewrequest_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_review_requests
    ADD CONSTRAINT accounts_profile_starred_review_profile_id_reviewrequest_id_key UNIQUE (profile_id, reviewrequest_id);


--
-- Name: accounts_profile_starred_review_requests accounts_profile_starred_review_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_review_requests
    ADD CONSTRAINT accounts_profile_starred_review_requests_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile accounts_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_key UNIQUE (user_id);


--
-- Name: accounts_reviewrequestvisit accounts_reviewrequestvisit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reviewrequestvisit
    ADD CONSTRAINT accounts_reviewrequestvisit_pkey PRIMARY KEY (id);


--
-- Name: accounts_reviewrequestvisit accounts_reviewrequestvisit_user_id_review_request_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reviewrequestvisit
    ADD CONSTRAINT accounts_reviewrequestvisit_user_id_review_request_id_key UNIQUE (user_id, review_request_id);


--
-- Name: accounts_trophy accounts_trophy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_trophy
    ADD CONSTRAINT accounts_trophy_pkey PRIMARY KEY (id);


--
-- Name: attachments_fileattachment attachments_fileattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT attachments_fileattachment_pkey PRIMARY KEY (id);


--
-- Name: attachments_fileattachmenthistory attachments_fileattachmenthistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachmenthistory
    ADD CONSTRAINT attachments_fileattachmenthistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: changedescs_changedescription changedescs_changedescription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changedescs_changedescription
    ADD CONSTRAINT changedescs_changedescription_pkey PRIMARY KEY (id);


--
-- Name: corsheaders_corsmodel corsheaders_corsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corsheaders_corsmodel
    ADD CONSTRAINT corsheaders_corsmodel_pkey PRIMARY KEY (id);


--
-- Name: diffviewer_diffset diffviewer_diffset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffset
    ADD CONSTRAINT diffviewer_diffset_pkey PRIMARY KEY (id);


--
-- Name: diffviewer_diffsethistory diffviewer_diffsethistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffsethistory
    ADD CONSTRAINT diffviewer_diffsethistory_pkey PRIMARY KEY (id);


--
-- Name: diffviewer_filediff diffviewer_filediff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_pkey PRIMARY KEY (id);


--
-- Name: diffviewer_filediffdata diffviewer_filediffdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediffdata
    ADD CONSTRAINT diffviewer_filediffdata_pkey PRIMARY KEY (binary_hash);


--
-- Name: diffviewer_rawfilediffdata diffviewer_rawfilediffdata_binary_hash_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_rawfilediffdata
    ADD CONSTRAINT diffviewer_rawfilediffdata_binary_hash_key UNIQUE (binary_hash);


--
-- Name: diffviewer_rawfilediffdata diffviewer_rawfilediffdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_rawfilediffdata
    ADD CONSTRAINT diffviewer_rawfilediffdata_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_evolution django_evolution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_evolution
    ADD CONSTRAINT django_evolution_pkey PRIMARY KEY (id);


--
-- Name: django_project_version django_project_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_project_version
    ADD CONSTRAINT django_project_version_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djblets_privacy_storedconsentdata djblets_privacy_storedconsentdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djblets_privacy_storedconsentdata
    ADD CONSTRAINT djblets_privacy_storedconsentdata_pkey PRIMARY KEY (id);


--
-- Name: djblets_privacy_storedconsentdata djblets_privacy_storedconsentdata_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djblets_privacy_storedconsentdata
    ADD CONSTRAINT djblets_privacy_storedconsentdata_user_id_key UNIQUE (user_id);


--
-- Name: extensions_registeredextension extensions_registeredextension_class_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extensions_registeredextension
    ADD CONSTRAINT extensions_registeredextension_class_name_key UNIQUE (class_name);


--
-- Name: extensions_registeredextension extensions_registeredextension_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extensions_registeredextension
    ADD CONSTRAINT extensions_registeredextension_pkey PRIMARY KEY (id);


--
-- Name: hostingsvcs_hostingserviceaccount hostingsvcs_hostingserviceaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostingsvcs_hostingserviceaccount
    ADD CONSTRAINT hostingsvcs_hostingserviceaccount_pkey PRIMARY KEY (id);


--
-- Name: integrations_integrationconfig integrations_integrationconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations_integrationconfig
    ADD CONSTRAINT integrations_integrationconfig_pkey PRIMARY KEY (id);


--
-- Name: notifications_webhooktarget notifications_webhooktarget_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget
    ADD CONSTRAINT notifications_webhooktarget_pkey PRIMARY KEY (id);


--
-- Name: notifications_webhooktarget_repositories notifications_webhooktarget_r_webhooktarget_id_repository_i_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget_repositories
    ADD CONSTRAINT notifications_webhooktarget_r_webhooktarget_id_repository_i_key UNIQUE (webhooktarget_id, repository_id);


--
-- Name: notifications_webhooktarget_repositories notifications_webhooktarget_repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget_repositories
    ADD CONSTRAINT notifications_webhooktarget_repositories_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: reviewboard_oauth_application reviewboard_oauth_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application
    ADD CONSTRAINT reviewboard_oauth_application_client_id_key UNIQUE (client_id);


--
-- Name: reviewboard_oauth_application reviewboard_oauth_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application
    ADD CONSTRAINT reviewboard_oauth_application_pkey PRIMARY KEY (id);


--
-- Name: reviews_comment reviews_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_pkey PRIMARY KEY (id);


--
-- Name: reviews_defaultreviewer_groups reviews_defaultreviewer_groups_defaultreviewer_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_groups
    ADD CONSTRAINT reviews_defaultreviewer_groups_defaultreviewer_id_group_id_key UNIQUE (defaultreviewer_id, group_id);


--
-- Name: reviews_defaultreviewer_groups reviews_defaultreviewer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_groups
    ADD CONSTRAINT reviews_defaultreviewer_groups_pkey PRIMARY KEY (id);


--
-- Name: reviews_defaultreviewer_people reviews_defaultreviewer_people_defaultreviewer_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_people
    ADD CONSTRAINT reviews_defaultreviewer_people_defaultreviewer_id_user_id_key UNIQUE (defaultreviewer_id, user_id);


--
-- Name: reviews_defaultreviewer_people reviews_defaultreviewer_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_people
    ADD CONSTRAINT reviews_defaultreviewer_people_pkey PRIMARY KEY (id);


--
-- Name: reviews_defaultreviewer reviews_defaultreviewer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer
    ADD CONSTRAINT reviews_defaultreviewer_pkey PRIMARY KEY (id);


--
-- Name: reviews_defaultreviewer_repository reviews_defaultreviewer_repos_defaultreviewer_id_repository_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_repository
    ADD CONSTRAINT reviews_defaultreviewer_repos_defaultreviewer_id_repository_key UNIQUE (defaultreviewer_id, repository_id);


--
-- Name: reviews_defaultreviewer_repository reviews_defaultreviewer_repository_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_repository
    ADD CONSTRAINT reviews_defaultreviewer_repository_pkey PRIMARY KEY (id);


--
-- Name: reviews_fileattachmentcomment reviews_fileattachmentcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_fileattachmentcomment
    ADD CONSTRAINT reviews_fileattachmentcomment_pkey PRIMARY KEY (id);


--
-- Name: reviews_generalcomment reviews_generalcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_generalcomment
    ADD CONSTRAINT reviews_generalcomment_pkey PRIMARY KEY (id);


--
-- Name: reviews_group reviews_group_name_local_site_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group
    ADD CONSTRAINT reviews_group_name_local_site_id_key UNIQUE (name, local_site_id);


--
-- Name: reviews_group reviews_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group
    ADD CONSTRAINT reviews_group_pkey PRIMARY KEY (id);


--
-- Name: reviews_group_users reviews_group_users_group_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group_users
    ADD CONSTRAINT reviews_group_users_group_id_user_id_key UNIQUE (group_id, user_id);


--
-- Name: reviews_group_users reviews_group_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group_users
    ADD CONSTRAINT reviews_group_users_pkey PRIMARY KEY (id);


--
-- Name: reviews_review_comments reviews_review_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_comments
    ADD CONSTRAINT reviews_review_comments_pkey PRIMARY KEY (id);


--
-- Name: reviews_review_comments reviews_review_comments_review_id_comment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_comments
    ADD CONSTRAINT reviews_review_comments_review_id_comment_id_key UNIQUE (review_id, comment_id);


--
-- Name: reviews_review_file_attachment_comments reviews_review_file_attachmen_review_id_fileattachmentcomme_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_file_attachment_comments
    ADD CONSTRAINT reviews_review_file_attachmen_review_id_fileattachmentcomme_key UNIQUE (review_id, fileattachmentcomment_id);


--
-- Name: reviews_review_file_attachment_comments reviews_review_file_attachment_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_file_attachment_comments
    ADD CONSTRAINT reviews_review_file_attachment_comments_pkey PRIMARY KEY (id);


--
-- Name: reviews_review_general_comments reviews_review_general_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_general_comments
    ADD CONSTRAINT reviews_review_general_comments_pkey PRIMARY KEY (id);


--
-- Name: reviews_review_general_comments reviews_review_general_comments_review_id_generalcomment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_general_comments
    ADD CONSTRAINT reviews_review_general_comments_review_id_generalcomment_id_key UNIQUE (review_id, generalcomment_id);


--
-- Name: reviews_review reviews_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_pkey PRIMARY KEY (id);


--
-- Name: reviews_review_screenshot_comments reviews_review_screenshot_com_review_id_screenshotcomment_i_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_screenshot_comments
    ADD CONSTRAINT reviews_review_screenshot_com_review_id_screenshotcomment_i_key UNIQUE (review_id, screenshotcomment_id);


--
-- Name: reviews_review_screenshot_comments reviews_review_screenshot_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_screenshot_comments
    ADD CONSTRAINT reviews_review_screenshot_comments_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_changedescs reviews_reviewrequest_changed_reviewrequest_id_changedescri_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_changedescs
    ADD CONSTRAINT reviews_reviewrequest_changed_reviewrequest_id_changedescri_key UNIQUE (reviewrequest_id, changedescription_id);


--
-- Name: reviews_reviewrequest_changedescs reviews_reviewrequest_changedescs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_changedescs
    ADD CONSTRAINT reviews_reviewrequest_changedescs_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest reviews_reviewrequest_changenum_repository_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_changenum_repository_id_key UNIQUE (changenum, repository_id);


--
-- Name: reviews_reviewrequest reviews_reviewrequest_commit_id_repository_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_commit_id_repository_id_key UNIQUE (commit_id, repository_id);


--
-- Name: reviews_reviewrequest_depends_on reviews_reviewrequest_depends_from_reviewrequest_id_to_revi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_depends_on
    ADD CONSTRAINT reviews_reviewrequest_depends_from_reviewrequest_id_to_revi_key UNIQUE (from_reviewrequest_id, to_reviewrequest_id);


--
-- Name: reviews_reviewrequest_depends_on reviews_reviewrequest_depends_on_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_depends_on
    ADD CONSTRAINT reviews_reviewrequest_depends_on_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_file_attachments reviews_reviewrequest_file_at_reviewrequest_id_fileattachm_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachments
    ADD CONSTRAINT reviews_reviewrequest_file_at_reviewrequest_id_fileattachm_key1 UNIQUE (reviewrequest_id, fileattachment_id);


--
-- Name: reviews_reviewrequest_file_attachment_histories reviews_reviewrequest_file_at_reviewrequest_id_fileattachme_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachment_histories
    ADD CONSTRAINT reviews_reviewrequest_file_at_reviewrequest_id_fileattachme_key UNIQUE (reviewrequest_id, fileattachmenthistory_id);


--
-- Name: reviews_reviewrequest_file_attachment_histories reviews_reviewrequest_file_attachment_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachment_histories
    ADD CONSTRAINT reviews_reviewrequest_file_attachment_histories_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_file_attachments reviews_reviewrequest_file_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachments
    ADD CONSTRAINT reviews_reviewrequest_file_attachments_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_inactive_file_attachments reviews_reviewrequest_inactiv_reviewrequest_id_fileattachme_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewrequest_inactiv_reviewrequest_id_fileattachme_key UNIQUE (reviewrequest_id, fileattachment_id);


--
-- Name: reviews_reviewrequest_inactive_screenshots reviews_reviewrequest_inactiv_reviewrequest_id_screenshot_i_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_screenshots
    ADD CONSTRAINT reviews_reviewrequest_inactiv_reviewrequest_id_screenshot_i_key UNIQUE (reviewrequest_id, screenshot_id);


--
-- Name: reviews_reviewrequest_inactive_file_attachments reviews_reviewrequest_inactive_file_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewrequest_inactive_file_attachments_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_inactive_screenshots reviews_reviewrequest_inactive_screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_screenshots
    ADD CONSTRAINT reviews_reviewrequest_inactive_screenshots_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest reviews_reviewrequest_local_site_id_local_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_local_site_id_local_id_key UNIQUE (local_site_id, local_id);


--
-- Name: reviews_reviewrequest reviews_reviewrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_screenshots reviews_reviewrequest_screens_reviewrequest_id_screenshot_i_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_screenshots
    ADD CONSTRAINT reviews_reviewrequest_screens_reviewrequest_id_screenshot_i_key UNIQUE (reviewrequest_id, screenshot_id);


--
-- Name: reviews_reviewrequest_screenshots reviews_reviewrequest_screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_screenshots
    ADD CONSTRAINT reviews_reviewrequest_screenshots_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_target_groups reviews_reviewrequest_target_grou_reviewrequest_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_groups
    ADD CONSTRAINT reviews_reviewrequest_target_grou_reviewrequest_id_group_id_key UNIQUE (reviewrequest_id, group_id);


--
-- Name: reviews_reviewrequest_target_groups reviews_reviewrequest_target_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_groups
    ADD CONSTRAINT reviews_reviewrequest_target_groups_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_target_people reviews_reviewrequest_target_peopl_reviewrequest_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_people
    ADD CONSTRAINT reviews_reviewrequest_target_peopl_reviewrequest_id_user_id_key UNIQUE (reviewrequest_id, user_id);


--
-- Name: reviews_reviewrequest_target_people reviews_reviewrequest_target_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_people
    ADD CONSTRAINT reviews_reviewrequest_target_people_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_depends_on reviews_reviewrequestdraft_de_reviewrequestdraft_id_reviewr_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_depends_on
    ADD CONSTRAINT reviews_reviewrequestdraft_de_reviewrequestdraft_id_reviewr_key UNIQUE (reviewrequestdraft_id, reviewrequest_id);


--
-- Name: reviews_reviewrequestdraft_depends_on reviews_reviewrequestdraft_depends_on_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_depends_on
    ADD CONSTRAINT reviews_reviewrequestdraft_depends_on_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_file_attachments reviews_reviewrequestdraft_fi_reviewrequestdraft_id_fileatt_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_file_attachments
    ADD CONSTRAINT reviews_reviewrequestdraft_fi_reviewrequestdraft_id_fileatt_key UNIQUE (reviewrequestdraft_id, fileattachment_id);


--
-- Name: reviews_reviewrequestdraft_file_attachments reviews_reviewrequestdraft_file_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_file_attachments
    ADD CONSTRAINT reviews_reviewrequestdraft_file_attachments_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments reviews_reviewrequestdraft_in_reviewrequestdraft_id_fileatt_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewrequestdraft_in_reviewrequestdraft_id_fileatt_key UNIQUE (reviewrequestdraft_id, fileattachment_id);


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots reviews_reviewrequestdraft_in_reviewrequestdraft_id_screens_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_screenshots
    ADD CONSTRAINT reviews_reviewrequestdraft_in_reviewrequestdraft_id_screens_key UNIQUE (reviewrequestdraft_id, screenshot_id);


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments reviews_reviewrequestdraft_inactive_file_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewrequestdraft_inactive_file_attachments_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots reviews_reviewrequestdraft_inactive_screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_screenshots
    ADD CONSTRAINT reviews_reviewrequestdraft_inactive_screenshots_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft reviews_reviewrequestdraft_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewrequestdraft_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft reviews_reviewrequestdraft_review_request_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewrequestdraft_review_request_id_key UNIQUE (review_request_id);


--
-- Name: reviews_reviewrequestdraft_screenshots reviews_reviewrequestdraft_sc_reviewrequestdraft_id_screens_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_screenshots
    ADD CONSTRAINT reviews_reviewrequestdraft_sc_reviewrequestdraft_id_screens_key UNIQUE (reviewrequestdraft_id, screenshot_id);


--
-- Name: reviews_reviewrequestdraft_screenshots reviews_reviewrequestdraft_screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_screenshots
    ADD CONSTRAINT reviews_reviewrequestdraft_screenshots_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_target_groups reviews_reviewrequestdraft_ta_reviewrequestdraft_id_group_i_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_groups
    ADD CONSTRAINT reviews_reviewrequestdraft_ta_reviewrequestdraft_id_group_i_key UNIQUE (reviewrequestdraft_id, group_id);


--
-- Name: reviews_reviewrequestdraft_target_people reviews_reviewrequestdraft_ta_reviewrequestdraft_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_people
    ADD CONSTRAINT reviews_reviewrequestdraft_ta_reviewrequestdraft_id_user_id_key UNIQUE (reviewrequestdraft_id, user_id);


--
-- Name: reviews_reviewrequestdraft_target_groups reviews_reviewrequestdraft_target_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_groups
    ADD CONSTRAINT reviews_reviewrequestdraft_target_groups_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_target_people reviews_reviewrequestdraft_target_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_people
    ADD CONSTRAINT reviews_reviewrequestdraft_target_people_pkey PRIMARY KEY (id);


--
-- Name: reviews_screenshot reviews_screenshot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshot
    ADD CONSTRAINT reviews_screenshot_pkey PRIMARY KEY (id);


--
-- Name: reviews_screenshotcomment reviews_screenshotcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshotcomment
    ADD CONSTRAINT reviews_screenshotcomment_pkey PRIMARY KEY (id);


--
-- Name: reviews_statusupdate reviews_statusupdate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_pkey PRIMARY KEY (id);


--
-- Name: reviews_statusupdate reviews_statusupdate_review_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_review_id_key UNIQUE (review_id);


--
-- Name: scmtools_repository scmtools_repository_archived_timestamp_path_local_site_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_archived_timestamp_path_local_site_id_key UNIQUE (archived_timestamp, path, local_site_id);


--
-- Name: scmtools_repository scmtools_repository_hooks_uuid_local_site_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_hooks_uuid_local_site_id_key UNIQUE (hooks_uuid, local_site_id);


--
-- Name: scmtools_repository scmtools_repository_name_local_site_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_name_local_site_id_key UNIQUE (name, local_site_id);


--
-- Name: scmtools_repository scmtools_repository_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_pkey PRIMARY KEY (id);


--
-- Name: scmtools_repository_review_groups scmtools_repository_review_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_review_groups
    ADD CONSTRAINT scmtools_repository_review_groups_pkey PRIMARY KEY (id);


--
-- Name: scmtools_repository_review_groups scmtools_repository_review_groups_repository_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_review_groups
    ADD CONSTRAINT scmtools_repository_review_groups_repository_id_group_id_key UNIQUE (repository_id, group_id);


--
-- Name: scmtools_repository_users scmtools_repository_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_users
    ADD CONSTRAINT scmtools_repository_users_pkey PRIMARY KEY (id);


--
-- Name: scmtools_repository_users scmtools_repository_users_repository_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_users
    ADD CONSTRAINT scmtools_repository_users_repository_id_user_id_key UNIQUE (repository_id, user_id);


--
-- Name: scmtools_tool scmtools_tool_class_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_tool
    ADD CONSTRAINT scmtools_tool_class_name_key UNIQUE (class_name);


--
-- Name: scmtools_tool scmtools_tool_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_tool
    ADD CONSTRAINT scmtools_tool_name_key UNIQUE (name);


--
-- Name: scmtools_tool scmtools_tool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_tool
    ADD CONSTRAINT scmtools_tool_pkey PRIMARY KEY (id);


--
-- Name: site_localsite_admins site_localsite_admins_localsite_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_admins
    ADD CONSTRAINT site_localsite_admins_localsite_id_user_id_key UNIQUE (localsite_id, user_id);


--
-- Name: site_localsite_admins site_localsite_admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_admins
    ADD CONSTRAINT site_localsite_admins_pkey PRIMARY KEY (id);


--
-- Name: site_localsite site_localsite_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite
    ADD CONSTRAINT site_localsite_name_key UNIQUE (name);


--
-- Name: site_localsite site_localsite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite
    ADD CONSTRAINT site_localsite_pkey PRIMARY KEY (id);


--
-- Name: site_localsite_users site_localsite_users_localsite_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_users
    ADD CONSTRAINT site_localsite_users_localsite_id_user_id_key UNIQUE (localsite_id, user_id);


--
-- Name: site_localsite_users site_localsite_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_users
    ADD CONSTRAINT site_localsite_users_pkey PRIMARY KEY (id);


--
-- Name: siteconfig_siteconfiguration siteconfig_siteconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siteconfig_siteconfiguration
    ADD CONSTRAINT siteconfig_siteconfiguration_pkey PRIMARY KEY (id);


--
-- Name: webapi_webapitoken webapi_webapitoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webapi_webapitoken
    ADD CONSTRAINT webapi_webapitoken_pkey PRIMARY KEY (id);


--
-- Name: webapi_webapitoken webapi_webapitoken_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webapi_webapitoken
    ADD CONSTRAINT webapi_webapitoken_token_key UNIQUE (token);


--
-- Name: accounts_localsiteprofile_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_localsiteprofile_local_site_id ON public.accounts_localsiteprofile USING btree (local_site_id);


--
-- Name: accounts_localsiteprofile_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_localsiteprofile_profile_id ON public.accounts_localsiteprofile USING btree (profile_id);


--
-- Name: accounts_localsiteprofile_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_localsiteprofile_user_id ON public.accounts_localsiteprofile USING btree (user_id);


--
-- Name: accounts_profile_starred_groups_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_profile_starred_groups_group_id ON public.accounts_profile_starred_groups USING btree (group_id);


--
-- Name: accounts_profile_starred_groups_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_profile_starred_groups_profile_id ON public.accounts_profile_starred_groups USING btree (profile_id);


--
-- Name: accounts_profile_starred_review_requests_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_profile_starred_review_requests_profile_id ON public.accounts_profile_starred_review_requests USING btree (profile_id);


--
-- Name: accounts_profile_starred_review_requests_reviewrequest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_profile_starred_review_requests_reviewrequest_id ON public.accounts_profile_starred_review_requests USING btree (reviewrequest_id);


--
-- Name: accounts_reviewrequestvisit_23858d92; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_reviewrequestvisit_23858d92 ON public.accounts_reviewrequestvisit USING btree (user_id, visibility);


--
-- Name: accounts_reviewrequestvisit_review_request_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_reviewrequestvisit_review_request_id ON public.accounts_reviewrequestvisit USING btree (review_request_id);


--
-- Name: accounts_reviewrequestvisit_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_reviewrequestvisit_user_id ON public.accounts_reviewrequestvisit USING btree (user_id);


--
-- Name: accounts_trophy_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_trophy_local_site_id ON public.accounts_trophy USING btree (local_site_id);


--
-- Name: accounts_trophy_review_request_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_trophy_review_request_id ON public.accounts_trophy USING btree (review_request_id);


--
-- Name: accounts_trophy_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_trophy_user_id ON public.accounts_trophy USING btree (user_id);


--
-- Name: attachments_fileattachment_added_in_filediff_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_added_in_filediff_id ON public.attachments_fileattachment USING btree (added_in_filediff_id);


--
-- Name: attachments_fileattachment_attachment_history_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_attachment_history_id ON public.attachments_fileattachment USING btree (attachment_history_id);


--
-- Name: attachments_fileattachment_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_local_site_id ON public.attachments_fileattachment USING btree (local_site_id);


--
-- Name: attachments_fileattachment_repo_revision; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_repo_revision ON public.attachments_fileattachment USING btree (repo_revision);


--
-- Name: attachments_fileattachment_repo_revision_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_repo_revision_like ON public.attachments_fileattachment USING btree (repo_revision varchar_pattern_ops);


--
-- Name: attachments_fileattachment_repository_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_repository_id ON public.attachments_fileattachment USING btree (repository_id);


--
-- Name: attachments_fileattachment_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_user_id ON public.attachments_fileattachment USING btree (user_id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: changedescs_changedescription_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX changedescs_changedescription_user_id ON public.changedescs_changedescription USING btree (user_id);


--
-- Name: diffviewer_diffset_base_commit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_diffset_base_commit_id ON public.diffviewer_diffset USING btree (base_commit_id);


--
-- Name: diffviewer_diffset_base_commit_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_diffset_base_commit_id_like ON public.diffviewer_diffset USING btree (base_commit_id varchar_pattern_ops);


--
-- Name: diffviewer_diffset_history_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_diffset_history_id ON public.diffviewer_diffset USING btree (history_id);


--
-- Name: diffviewer_diffset_repository_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_diffset_repository_id ON public.diffviewer_diffset USING btree (repository_id);


--
-- Name: diffviewer_filediff_diff_hash_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_diff_hash_id ON public.diffviewer_filediff USING btree (diff_hash_id);


--
-- Name: diffviewer_filediff_diff_hash_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_diff_hash_id_like ON public.diffviewer_filediff USING btree (diff_hash_id varchar_pattern_ops);


--
-- Name: diffviewer_filediff_diffset_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_diffset_id ON public.diffviewer_filediff USING btree (diffset_id);


--
-- Name: diffviewer_filediff_parent_diff_hash_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_parent_diff_hash_id ON public.diffviewer_filediff USING btree (parent_diff_hash_id);


--
-- Name: diffviewer_filediff_parent_diff_hash_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_parent_diff_hash_id_like ON public.diffviewer_filediff USING btree (parent_diff_hash_id varchar_pattern_ops);


--
-- Name: diffviewer_filediff_raw_diff_hash_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_raw_diff_hash_id ON public.diffviewer_filediff USING btree (raw_diff_hash_id);


--
-- Name: diffviewer_filediff_raw_parent_diff_hash_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_raw_parent_diff_hash_id ON public.diffviewer_filediff USING btree (raw_parent_diff_hash_id);


--
-- Name: diffviewer_filediffdata_binary_hash_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediffdata_binary_hash_like ON public.diffviewer_filediffdata USING btree (binary_hash varchar_pattern_ops);


--
-- Name: diffviewer_rawfilediffdata_binary_hash_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_rawfilediffdata_binary_hash_like ON public.diffviewer_rawfilediffdata USING btree (binary_hash varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id ON public.django_admin_log USING btree (user_id);


--
-- Name: django_evolution_version_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_evolution_version_id ON public.django_evolution USING btree (version_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: djblets_privacy_storedconsentdata_audit_identifier; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djblets_privacy_storedconsentdata_audit_identifier ON public.djblets_privacy_storedconsentdata USING btree (audit_identifier);


--
-- Name: djblets_privacy_storedconsentdata_audit_identifier_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djblets_privacy_storedconsentdata_audit_identifier_like ON public.djblets_privacy_storedconsentdata USING btree (audit_identifier varchar_pattern_ops);


--
-- Name: extensions_registeredextension_class_name_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX extensions_registeredextension_class_name_like ON public.extensions_registeredextension USING btree (class_name varchar_pattern_ops);


--
-- Name: hostingsvcs_hostingserviceaccount_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hostingsvcs_hostingserviceaccount_local_site_id ON public.hostingsvcs_hostingserviceaccount USING btree (local_site_id);


--
-- Name: integrations_integrationconfig_enabled; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX integrations_integrationconfig_enabled ON public.integrations_integrationconfig USING btree (enabled);


--
-- Name: integrations_integrationconfig_integration_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX integrations_integrationconfig_integration_id ON public.integrations_integrationconfig USING btree (integration_id);


--
-- Name: integrations_integrationconfig_integration_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX integrations_integrationconfig_integration_id_like ON public.integrations_integrationconfig USING btree (integration_id varchar_pattern_ops);


--
-- Name: integrations_integrationconfig_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX integrations_integrationconfig_local_site_id ON public.integrations_integrationconfig USING btree (local_site_id);


--
-- Name: notifications_webhooktarget_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_webhooktarget_local_site_id ON public.notifications_webhooktarget USING btree (local_site_id);


--
-- Name: notifications_webhooktarget_repositories_repository_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_webhooktarget_repositories_repository_id ON public.notifications_webhooktarget_repositories USING btree (repository_id);


--
-- Name: notifications_webhooktarget_repositories_webhooktarget_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_webhooktarget_repositories_webhooktarget_id ON public.notifications_webhooktarget_repositories USING btree (webhooktarget_id);


--
-- Name: oauth2_provider_accesstoken_application_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_application_id ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_token ON public.oauth2_provider_accesstoken USING btree (token);


--
-- Name: oauth2_provider_accesstoken_token_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_token_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_user_id ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_id_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_user_id ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_application_id ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code ON public.oauth2_provider_grant USING btree (code);


--
-- Name: oauth2_provider_grant_code_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_user_id ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_application_id ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_token ON public.oauth2_provider_refreshtoken USING btree (token);


--
-- Name: oauth2_provider_refreshtoken_token_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_token_like ON public.oauth2_provider_refreshtoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_refreshtoken_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_user_id ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: reviewboard_oauth_application_client_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_client_id_like ON public.reviewboard_oauth_application USING btree (client_id varchar_pattern_ops);


--
-- Name: reviewboard_oauth_application_client_secret; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_client_secret ON public.reviewboard_oauth_application USING btree (client_secret);


--
-- Name: reviewboard_oauth_application_client_secret_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_client_secret_like ON public.reviewboard_oauth_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: reviewboard_oauth_application_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_local_site_id ON public.reviewboard_oauth_application USING btree (local_site_id);


--
-- Name: reviewboard_oauth_application_original_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_original_user_id ON public.reviewboard_oauth_application USING btree (original_user_id);


--
-- Name: reviewboard_oauth_application_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_user_id ON public.reviewboard_oauth_application USING btree (user_id);


--
-- Name: reviews_comment_filediff_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_filediff_id ON public.reviews_comment USING btree (filediff_id);


--
-- Name: reviews_comment_interfilediff_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_interfilediff_id ON public.reviews_comment USING btree (interfilediff_id);


--
-- Name: reviews_comment_issue_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_issue_status ON public.reviews_comment USING btree (issue_status);


--
-- Name: reviews_comment_issue_status_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_issue_status_like ON public.reviews_comment USING btree (issue_status varchar_pattern_ops);


--
-- Name: reviews_comment_reply_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_reply_to_id ON public.reviews_comment USING btree (reply_to_id);


--
-- Name: reviews_defaultreviewer_groups_defaultreviewer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_groups_defaultreviewer_id ON public.reviews_defaultreviewer_groups USING btree (defaultreviewer_id);


--
-- Name: reviews_defaultreviewer_groups_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_groups_group_id ON public.reviews_defaultreviewer_groups USING btree (group_id);


--
-- Name: reviews_defaultreviewer_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_local_site_id ON public.reviews_defaultreviewer USING btree (local_site_id);


--
-- Name: reviews_defaultreviewer_people_defaultreviewer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_people_defaultreviewer_id ON public.reviews_defaultreviewer_people USING btree (defaultreviewer_id);


--
-- Name: reviews_defaultreviewer_people_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_people_user_id ON public.reviews_defaultreviewer_people USING btree (user_id);


--
-- Name: reviews_defaultreviewer_repository_defaultreviewer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_repository_defaultreviewer_id ON public.reviews_defaultreviewer_repository USING btree (defaultreviewer_id);


--
-- Name: reviews_defaultreviewer_repository_repository_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_repository_repository_id ON public.reviews_defaultreviewer_repository USING btree (repository_id);


--
-- Name: reviews_fileattachmentcomment_diff_against_file_attachment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_fileattachmentcomment_diff_against_file_attachment_id ON public.reviews_fileattachmentcomment USING btree (diff_against_file_attachment_id);


--
-- Name: reviews_fileattachmentcomment_file_attachment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_fileattachmentcomment_file_attachment_id ON public.reviews_fileattachmentcomment USING btree (file_attachment_id);


--
-- Name: reviews_fileattachmentcomment_issue_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_fileattachmentcomment_issue_status ON public.reviews_fileattachmentcomment USING btree (issue_status);


--
-- Name: reviews_fileattachmentcomment_issue_status_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_fileattachmentcomment_issue_status_like ON public.reviews_fileattachmentcomment USING btree (issue_status varchar_pattern_ops);


--
-- Name: reviews_fileattachmentcomment_reply_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_fileattachmentcomment_reply_to_id ON public.reviews_fileattachmentcomment USING btree (reply_to_id);


--
-- Name: reviews_generalcomment_issue_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_generalcomment_issue_status ON public.reviews_generalcomment USING btree (issue_status);


--
-- Name: reviews_generalcomment_issue_status_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_generalcomment_issue_status_like ON public.reviews_generalcomment USING btree (issue_status varchar_pattern_ops);


--
-- Name: reviews_generalcomment_reply_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_generalcomment_reply_to_id ON public.reviews_generalcomment USING btree (reply_to_id);


--
-- Name: reviews_group_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_group_local_site_id ON public.reviews_group USING btree (local_site_id);


--
-- Name: reviews_group_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_group_name ON public.reviews_group USING btree (name);


--
-- Name: reviews_group_name_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_group_name_like ON public.reviews_group USING btree (name varchar_pattern_ops);


--
-- Name: reviews_group_users_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_group_users_group_id ON public.reviews_group_users USING btree (group_id);


--
-- Name: reviews_group_users_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_group_users_user_id ON public.reviews_group_users USING btree (user_id);


--
-- Name: reviews_review_base_reply_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_base_reply_to_id ON public.reviews_review USING btree (base_reply_to_id);


--
-- Name: reviews_review_body_bottom_reply_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_body_bottom_reply_to_id ON public.reviews_review USING btree (body_bottom_reply_to_id);


--
-- Name: reviews_review_body_top_reply_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_body_top_reply_to_id ON public.reviews_review USING btree (body_top_reply_to_id);


--
-- Name: reviews_review_comments_comment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_comments_comment_id ON public.reviews_review_comments USING btree (comment_id);


--
-- Name: reviews_review_comments_review_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_comments_review_id ON public.reviews_review_comments USING btree (review_id);


--
-- Name: reviews_review_file_attachment_comments_fileattachmentcommed7a7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_file_attachment_comments_fileattachmentcommed7a7 ON public.reviews_review_file_attachment_comments USING btree (fileattachmentcomment_id);


--
-- Name: reviews_review_file_attachment_comments_review_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_file_attachment_comments_review_id ON public.reviews_review_file_attachment_comments USING btree (review_id);


--
-- Name: reviews_review_general_comments_generalcomment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_general_comments_generalcomment_id ON public.reviews_review_general_comments USING btree (generalcomment_id);


--
-- Name: reviews_review_general_comments_review_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_general_comments_review_id ON public.reviews_review_general_comments USING btree (review_id);


--
-- Name: reviews_review_review_request_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_review_request_id ON public.reviews_review USING btree (review_request_id);


--
-- Name: reviews_review_reviewed_diffset_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_reviewed_diffset_id ON public.reviews_review USING btree (reviewed_diffset_id);


--
-- Name: reviews_review_screenshot_comments_review_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_screenshot_comments_review_id ON public.reviews_review_screenshot_comments USING btree (review_id);


--
-- Name: reviews_review_screenshot_comments_screenshotcomment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_screenshot_comments_screenshotcomment_id ON public.reviews_review_screenshot_comments USING btree (screenshotcomment_id);


--
-- Name: reviews_review_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_user_id ON public.reviews_review USING btree (user_id);


--
-- Name: reviews_reviewrequest_changedescs_changedescription_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_changedescs_changedescription_id ON public.reviews_reviewrequest_changedescs USING btree (changedescription_id);


--
-- Name: reviews_reviewrequest_changedescs_reviewrequest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_changedescs_reviewrequest_id ON public.reviews_reviewrequest_changedescs USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_changenum; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_changenum ON public.reviews_reviewrequest USING btree (changenum);


--
-- Name: reviews_reviewrequest_commit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_commit_id ON public.reviews_reviewrequest USING btree (commit_id);


--
-- Name: reviews_reviewrequest_commit_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_commit_id_like ON public.reviews_reviewrequest USING btree (commit_id varchar_pattern_ops);


--
-- Name: reviews_reviewrequest_depends_on_from_reviewrequest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_depends_on_from_reviewrequest_id ON public.reviews_reviewrequest_depends_on USING btree (from_reviewrequest_id);


--
-- Name: reviews_reviewrequest_depends_on_to_reviewrequest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_depends_on_to_reviewrequest_id ON public.reviews_reviewrequest_depends_on USING btree (to_reviewrequest_id);


--
-- Name: reviews_reviewrequest_diffset_history_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_diffset_history_id ON public.reviews_reviewrequest USING btree (diffset_history_id);


--
-- Name: reviews_reviewrequest_file_attachment_histories_fileattachmf0c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_file_attachment_histories_fileattachmf0c4 ON public.reviews_reviewrequest_file_attachment_histories USING btree (fileattachmenthistory_id);


--
-- Name: reviews_reviewrequest_file_attachment_histories_reviewrequeb7f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_file_attachment_histories_reviewrequeb7f0 ON public.reviews_reviewrequest_file_attachment_histories USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_file_attachments_fileattachment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_file_attachments_fileattachment_id ON public.reviews_reviewrequest_file_attachments USING btree (fileattachment_id);


--
-- Name: reviews_reviewrequest_file_attachments_reviewrequest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_file_attachments_reviewrequest_id ON public.reviews_reviewrequest_file_attachments USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_inactive_file_attachments_fileattachmf46e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_inactive_file_attachments_fileattachmf46e ON public.reviews_reviewrequest_inactive_file_attachments USING btree (fileattachment_id);


--
-- Name: reviews_reviewrequest_inactive_file_attachments_reviewreque7660; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_inactive_file_attachments_reviewreque7660 ON public.reviews_reviewrequest_inactive_file_attachments USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_inactive_screenshots_reviewrequest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_inactive_screenshots_reviewrequest_id ON public.reviews_reviewrequest_inactive_screenshots USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_inactive_screenshots_screenshot_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_inactive_screenshots_screenshot_id ON public.reviews_reviewrequest_inactive_screenshots USING btree (screenshot_id);


--
-- Name: reviews_reviewrequest_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_local_site_id ON public.reviews_reviewrequest USING btree (local_site_id);


--
-- Name: reviews_reviewrequest_repository_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_repository_id ON public.reviews_reviewrequest USING btree (repository_id);


--
-- Name: reviews_reviewrequest_screenshots_reviewrequest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_screenshots_reviewrequest_id ON public.reviews_reviewrequest_screenshots USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_screenshots_screenshot_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_screenshots_screenshot_id ON public.reviews_reviewrequest_screenshots USING btree (screenshot_id);


--
-- Name: reviews_reviewrequest_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_status ON public.reviews_reviewrequest USING btree (status);


--
-- Name: reviews_reviewrequest_status_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_status_like ON public.reviews_reviewrequest USING btree (status varchar_pattern_ops);


--
-- Name: reviews_reviewrequest_submitter_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_submitter_id ON public.reviews_reviewrequest USING btree (submitter_id);


--
-- Name: reviews_reviewrequest_summary; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_summary ON public.reviews_reviewrequest USING btree (summary);


--
-- Name: reviews_reviewrequest_target_groups_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_target_groups_group_id ON public.reviews_reviewrequest_target_groups USING btree (group_id);


--
-- Name: reviews_reviewrequest_target_groups_reviewrequest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_target_groups_reviewrequest_id ON public.reviews_reviewrequest_target_groups USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_target_people_reviewrequest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_target_people_reviewrequest_id ON public.reviews_reviewrequest_target_people USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_target_people_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_target_people_user_id ON public.reviews_reviewrequest_target_people USING btree (user_id);


--
-- Name: reviews_reviewrequestdraft_changedesc_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_changedesc_id ON public.reviews_reviewrequestdraft USING btree (changedesc_id);


--
-- Name: reviews_reviewrequestdraft_commit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_commit_id ON public.reviews_reviewrequestdraft USING btree (commit_id);


--
-- Name: reviews_reviewrequestdraft_commit_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_commit_id_like ON public.reviews_reviewrequestdraft USING btree (commit_id varchar_pattern_ops);


--
-- Name: reviews_reviewrequestdraft_depends_on_reviewrequest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_depends_on_reviewrequest_id ON public.reviews_reviewrequestdraft_depends_on USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequestdraft_depends_on_reviewrequestdraft_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_depends_on_reviewrequestdraft_id ON public.reviews_reviewrequestdraft_depends_on USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_diffset_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_diffset_id ON public.reviews_reviewrequestdraft USING btree (diffset_id);


--
-- Name: reviews_reviewrequestdraft_file_attachments_fileattachment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_file_attachments_fileattachment_id ON public.reviews_reviewrequestdraft_file_attachments USING btree (fileattachment_id);


--
-- Name: reviews_reviewrequestdraft_file_attachments_reviewrequestdr1385; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_file_attachments_reviewrequestdr1385 ON public.reviews_reviewrequestdraft_file_attachments USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments_fileatc4c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_inactive_file_attachments_fileatc4c9 ON public.reviews_reviewrequestdraft_inactive_file_attachments USING btree (fileattachment_id);


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments_review4ad1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_inactive_file_attachments_review4ad1 ON public.reviews_reviewrequestdraft_inactive_file_attachments USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots_reviewrequea4e7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_inactive_screenshots_reviewrequea4e7 ON public.reviews_reviewrequestdraft_inactive_screenshots USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots_screenshot_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_inactive_screenshots_screenshot_id ON public.reviews_reviewrequestdraft_inactive_screenshots USING btree (screenshot_id);


--
-- Name: reviews_reviewrequestdraft_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_owner_id ON public.reviews_reviewrequestdraft USING btree (owner_id);


--
-- Name: reviews_reviewrequestdraft_screenshots_reviewrequestdraft_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_screenshots_reviewrequestdraft_id ON public.reviews_reviewrequestdraft_screenshots USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_screenshots_screenshot_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_screenshots_screenshot_id ON public.reviews_reviewrequestdraft_screenshots USING btree (screenshot_id);


--
-- Name: reviews_reviewrequestdraft_target_groups_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_target_groups_group_id ON public.reviews_reviewrequestdraft_target_groups USING btree (group_id);


--
-- Name: reviews_reviewrequestdraft_target_groups_reviewrequestdraft_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_target_groups_reviewrequestdraft_id ON public.reviews_reviewrequestdraft_target_groups USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_target_people_reviewrequestdraft_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_target_people_reviewrequestdraft_id ON public.reviews_reviewrequestdraft_target_people USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_target_people_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_target_people_user_id ON public.reviews_reviewrequestdraft_target_people USING btree (user_id);


--
-- Name: reviews_screenshotcomment_issue_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_screenshotcomment_issue_status ON public.reviews_screenshotcomment USING btree (issue_status);


--
-- Name: reviews_screenshotcomment_issue_status_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_screenshotcomment_issue_status_like ON public.reviews_screenshotcomment USING btree (issue_status varchar_pattern_ops);


--
-- Name: reviews_screenshotcomment_reply_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_screenshotcomment_reply_to_id ON public.reviews_screenshotcomment USING btree (reply_to_id);


--
-- Name: reviews_screenshotcomment_screenshot_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_screenshotcomment_screenshot_id ON public.reviews_screenshotcomment USING btree (screenshot_id);


--
-- Name: reviews_statusupdate_change_description_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_statusupdate_change_description_id ON public.reviews_statusupdate USING btree (change_description_id);


--
-- Name: reviews_statusupdate_review_request_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_statusupdate_review_request_id ON public.reviews_statusupdate USING btree (review_request_id);


--
-- Name: reviews_statusupdate_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_statusupdate_user_id ON public.reviews_statusupdate USING btree (user_id);


--
-- Name: scmtools_repository_hosting_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_hosting_account_id ON public.scmtools_repository USING btree (hosting_account_id);


--
-- Name: scmtools_repository_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_local_site_id ON public.scmtools_repository USING btree (local_site_id);


--
-- Name: scmtools_repository_review_groups_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_review_groups_group_id ON public.scmtools_repository_review_groups USING btree (group_id);


--
-- Name: scmtools_repository_review_groups_repository_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_review_groups_repository_id ON public.scmtools_repository_review_groups USING btree (repository_id);


--
-- Name: scmtools_repository_tool_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_tool_id ON public.scmtools_repository USING btree (tool_id);


--
-- Name: scmtools_repository_users_repository_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_users_repository_id ON public.scmtools_repository_users USING btree (repository_id);


--
-- Name: scmtools_repository_users_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_users_user_id ON public.scmtools_repository_users USING btree (user_id);


--
-- Name: scmtools_tool_class_name_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_tool_class_name_like ON public.scmtools_tool USING btree (class_name varchar_pattern_ops);


--
-- Name: scmtools_tool_name_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_tool_name_like ON public.scmtools_tool USING btree (name varchar_pattern_ops);


--
-- Name: site_localsite_admins_localsite_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_localsite_admins_localsite_id ON public.site_localsite_admins USING btree (localsite_id);


--
-- Name: site_localsite_admins_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_localsite_admins_user_id ON public.site_localsite_admins USING btree (user_id);


--
-- Name: site_localsite_name_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_localsite_name_like ON public.site_localsite USING btree (name varchar_pattern_ops);


--
-- Name: site_localsite_users_localsite_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_localsite_users_localsite_id ON public.site_localsite_users USING btree (localsite_id);


--
-- Name: site_localsite_users_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_localsite_users_user_id ON public.site_localsite_users USING btree (user_id);


--
-- Name: siteconfig_siteconfiguration_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX siteconfig_siteconfiguration_site_id ON public.siteconfig_siteconfiguration USING btree (site_id);


--
-- Name: webapi_webapitoken_local_site_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapi_webapitoken_local_site_id ON public.webapi_webapitoken USING btree (local_site_id);


--
-- Name: webapi_webapitoken_token_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapi_webapitoken_token_like ON public.webapi_webapitoken USING btree (token varchar_pattern_ops);


--
-- Name: webapi_webapitoken_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapi_webapitoken_user_id ON public.webapi_webapitoken USING btree (user_id);


--
-- Name: accounts_localsiteprofile accounts_localsiteprofile_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsiteprofile_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_localsiteprofile accounts_localsiteprofile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsiteprofile_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile accounts_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_reviewrequestvisit accounts_reviewrequestvisit_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reviewrequestvisit
    ADD CONSTRAINT accounts_reviewrequestvisit_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_trophy accounts_trophy_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_trophy
    ADD CONSTRAINT accounts_trophy_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attachments_fileattachment added_in_filediff_id_refs_id_4b23a765; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT added_in_filediff_id_refs_id_4b23a765 FOREIGN KEY (added_in_filediff_id) REFERENCES public.diffviewer_filediff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant application_id_refs_id_46135b92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT application_id_refs_id_46135b92 FOREIGN KEY (application_id) REFERENCES public.reviewboard_oauth_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken application_id_refs_id_b5bbd547; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT application_id_refs_id_b5bbd547 FOREIGN KEY (application_id) REFERENCES public.reviewboard_oauth_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken application_id_refs_id_fe494fdb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT application_id_refs_id_fe494fdb FOREIGN KEY (application_id) REFERENCES public.reviewboard_oauth_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attachments_fileattachment attachments_fileattachment_attachment_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT attachments_fileattachment_attachment_history_id_fkey FOREIGN KEY (attachment_history_id) REFERENCES public.attachments_fileattachmenthistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attachments_fileattachment attachments_fileattachment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT attachments_fileattachment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: changedescs_changedescription changedescs_changedescription_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changedescs_changedescription
    ADD CONSTRAINT changedescs_changedescription_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_people defaultreviewer_id_refs_id_3bff5f07; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_people
    ADD CONSTRAINT defaultreviewer_id_refs_id_3bff5f07 FOREIGN KEY (defaultreviewer_id) REFERENCES public.reviews_defaultreviewer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_repository defaultreviewer_id_refs_id_b8151726; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_repository
    ADD CONSTRAINT defaultreviewer_id_refs_id_b8151726 FOREIGN KEY (defaultreviewer_id) REFERENCES public.reviews_defaultreviewer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_groups defaultreviewer_id_refs_id_cfe99890; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_groups
    ADD CONSTRAINT defaultreviewer_id_refs_id_cfe99890 FOREIGN KEY (defaultreviewer_id) REFERENCES public.reviews_defaultreviewer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffset_id_refs_id_c4a01a9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffset_id_refs_id_c4a01a9e FOREIGN KEY (diffset_id) REFERENCES public.diffviewer_diffset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffviewer_filediff_diff_hash_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_diff_hash_id_fkey FOREIGN KEY (diff_hash_id) REFERENCES public.diffviewer_filediffdata(binary_hash) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffviewer_filediff_parent_diff_hash_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_parent_diff_hash_id_fkey FOREIGN KEY (parent_diff_hash_id) REFERENCES public.diffviewer_filediffdata(binary_hash) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffviewer_filediff_raw_diff_hash_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_raw_diff_hash_id_fkey FOREIGN KEY (raw_diff_hash_id) REFERENCES public.diffviewer_rawfilediffdata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffviewer_filediff_raw_parent_diff_hash_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_raw_parent_diff_hash_id_fkey FOREIGN KEY (raw_parent_diff_hash_id) REFERENCES public.diffviewer_rawfilediffdata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_evolution django_evolution_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_evolution
    ADD CONSTRAINT django_evolution_version_id_fkey FOREIGN KEY (version_id) REFERENCES public.django_project_version(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djblets_privacy_storedconsentdata djblets_privacy_storedconsentdata_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djblets_privacy_storedconsentdata
    ADD CONSTRAINT djblets_privacy_storedconsentdata_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_depends_on from_reviewrequest_id_refs_id_623cfa96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_depends_on
    ADD CONSTRAINT from_reviewrequest_id_refs_id_623cfa96 FOREIGN KEY (from_reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_group_users group_id_refs_id_0f32ed01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group_users
    ADD CONSTRAINT group_id_refs_id_0f32ed01 FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile_starred_groups group_id_refs_id_b2b4d49b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_groups
    ADD CONSTRAINT group_id_refs_id_b2b4d49b FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_diffset history_id_refs_id_153db9d3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffset
    ADD CONSTRAINT history_id_refs_id_153db9d3 FOREIGN KEY (history_id) REFERENCES public.diffviewer_diffsethistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_localsiteprofile local_site_id_refs_id_02a402db; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT local_site_id_refs_id_02a402db FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviewboard_oauth_application local_site_id_refs_id_0f6c884f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application
    ADD CONSTRAINT local_site_id_refs_id_0f6c884f FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attachments_fileattachment local_site_id_refs_id_24157a94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT local_site_id_refs_id_24157a94 FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest local_site_id_refs_id_7b3d9679; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT local_site_id_refs_id_7b3d9679 FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository local_site_id_refs_id_a0854215; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT local_site_id_refs_id_a0854215 FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_group local_site_id_refs_id_a49a9c59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group
    ADD CONSTRAINT local_site_id_refs_id_a49a9c59 FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: integrations_integrationconfig local_site_id_refs_id_a6444871; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations_integrationconfig
    ADD CONSTRAINT local_site_id_refs_id_a6444871 FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hostingsvcs_hostingserviceaccount local_site_id_refs_id_a9322242; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostingsvcs_hostingserviceaccount
    ADD CONSTRAINT local_site_id_refs_id_a9322242 FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_trophy local_site_id_refs_id_babe9a5d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_trophy
    ADD CONSTRAINT local_site_id_refs_id_babe9a5d FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer local_site_id_refs_id_c0a6afc5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer
    ADD CONSTRAINT local_site_id_refs_id_c0a6afc5 FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_webhooktarget local_site_id_refs_id_fd45c4e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget
    ADD CONSTRAINT local_site_id_refs_id_fd45c4e8 FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_localsite_admins localsite_id_refs_id_0317c9fa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_admins
    ADD CONSTRAINT localsite_id_refs_id_0317c9fa FOREIGN KEY (localsite_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_localsite_users localsite_id_refs_id_d327526e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_users
    ADD CONSTRAINT localsite_id_refs_id_d327526e FOREIGN KEY (localsite_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_fkey FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile_starred_review_requests profile_id_refs_id_1728f51d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_review_requests
    ADD CONSTRAINT profile_id_refs_id_1728f51d FOREIGN KEY (profile_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile_starred_groups profile_id_refs_id_57362a69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_groups
    ADD CONSTRAINT profile_id_refs_id_57362a69 FOREIGN KEY (profile_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository_users repository_id_refs_id_1e758eaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_users
    ADD CONSTRAINT repository_id_refs_id_1e758eaa FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attachments_fileattachment repository_id_refs_id_3a88871a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT repository_id_refs_id_3a88871a FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_repository repository_id_refs_id_76c00819; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_repository
    ADD CONSTRAINT repository_id_refs_id_76c00819 FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_diffset repository_id_refs_id_76fa8bca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffset
    ADD CONSTRAINT repository_id_refs_id_76fa8bca FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest repository_id_refs_id_8da4cd22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT repository_id_refs_id_8da4cd22 FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository_review_groups repository_id_refs_id_9eb734d7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_review_groups
    ADD CONSTRAINT repository_id_refs_id_9eb734d7 FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_webhooktarget_repositories repository_id_refs_id_c926fd2a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget_repositories
    ADD CONSTRAINT repository_id_refs_id_c926fd2a FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_comments review_id_refs_id_20bad945; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_comments
    ADD CONSTRAINT review_id_refs_id_20bad945 FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_general_comments review_id_refs_id_54e01f08; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_general_comments
    ADD CONSTRAINT review_id_refs_id_54e01f08 FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_screenshot_comments review_id_refs_id_c422b4cf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_screenshot_comments
    ADD CONSTRAINT review_id_refs_id_c422b4cf FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_file_attachment_comments review_id_refs_id_e645043f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_file_attachment_comments
    ADD CONSTRAINT review_id_refs_id_e645043f FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_reviewrequestvisit review_request_id_refs_id_0943e99f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reviewrequestvisit
    ADD CONSTRAINT review_request_id_refs_id_0943e99f FOREIGN KEY (review_request_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_trophy review_request_id_refs_id_7fc332cd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_trophy
    ADD CONSTRAINT review_request_id_refs_id_7fc332cd FOREIGN KEY (review_request_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviewboard_oauth_application reviewboard_oauth_application_original_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application
    ADD CONSTRAINT reviewboard_oauth_application_original_user_id_fkey FOREIGN KEY (original_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviewboard_oauth_application reviewboard_oauth_application_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application
    ADD CONSTRAINT reviewboard_oauth_application_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_inactive_screenshots reviewrequest_id_refs_id_0ca731ad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_screenshots
    ADD CONSTRAINT reviewrequest_id_refs_id_0ca731ad FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_target_groups reviewrequest_id_refs_id_215d2d18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_groups
    ADD CONSTRAINT reviewrequest_id_refs_id_215d2d18 FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile_starred_review_requests reviewrequest_id_refs_id_342ff1ac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_review_requests
    ADD CONSTRAINT reviewrequest_id_refs_id_342ff1ac FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_file_attachments reviewrequest_id_refs_id_4d6f12c9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachments
    ADD CONSTRAINT reviewrequest_id_refs_id_4d6f12c9 FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_target_people reviewrequest_id_refs_id_6baad397; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_people
    ADD CONSTRAINT reviewrequest_id_refs_id_6baad397 FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_changedescs reviewrequest_id_refs_id_e3f9a257; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_changedescs
    ADD CONSTRAINT reviewrequest_id_refs_id_e3f9a257 FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_inactive_file_attachments reviewrequest_id_refs_id_eb423b91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_file_attachments
    ADD CONSTRAINT reviewrequest_id_refs_id_eb423b91 FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_screenshots reviewrequest_id_refs_id_fcf38833; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_screenshots
    ADD CONSTRAINT reviewrequest_id_refs_id_fcf38833 FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_file_attachment_histories reviewrequest_id_refs_id_fe050f91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachment_histories
    ADD CONSTRAINT reviewrequest_id_refs_id_fe050f91 FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_file_attachments reviewrequestdraft_id_refs_id_1aecf183; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_file_attachments
    ADD CONSTRAINT reviewrequestdraft_id_refs_id_1aecf183 FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_target_people reviewrequestdraft_id_refs_id_69da0005; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_people
    ADD CONSTRAINT reviewrequestdraft_id_refs_id_69da0005 FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments reviewrequestdraft_id_refs_id_7022aa5d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_file_attachments
    ADD CONSTRAINT reviewrequestdraft_id_refs_id_7022aa5d FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_target_groups reviewrequestdraft_id_refs_id_80e2fba0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_groups
    ADD CONSTRAINT reviewrequestdraft_id_refs_id_80e2fba0 FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_screenshots reviewrequestdraft_id_refs_id_a853fbb0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_screenshots
    ADD CONSTRAINT reviewrequestdraft_id_refs_id_a853fbb0 FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_depends_on reviewrequestdraft_id_refs_id_c4b4d8e7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_depends_on
    ADD CONSTRAINT reviewrequestdraft_id_refs_id_c4b4d8e7 FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots reviewrequestdraft_id_refs_id_f691e10f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_screenshots
    ADD CONSTRAINT reviewrequestdraft_id_refs_id_f691e10f FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_comment reviews_comment_filediff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_filediff_id_fkey FOREIGN KEY (filediff_id) REFERENCES public.diffviewer_filediff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_comment reviews_comment_interfilediff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_interfilediff_id_fkey FOREIGN KEY (interfilediff_id) REFERENCES public.diffviewer_filediff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_comment reviews_comment_reply_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_reply_to_id_fkey FOREIGN KEY (reply_to_id) REFERENCES public.reviews_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_groups reviews_defaultreviewer_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_groups
    ADD CONSTRAINT reviews_defaultreviewer_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_people reviews_defaultreviewer_people_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_people
    ADD CONSTRAINT reviews_defaultreviewer_people_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_fileattachmentcomment reviews_fileattachmentcomment_diff_against_file_attachment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_fileattachmentcomment
    ADD CONSTRAINT reviews_fileattachmentcomment_diff_against_file_attachment_fkey FOREIGN KEY (diff_against_file_attachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_fileattachmentcomment reviews_fileattachmentcomment_file_attachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_fileattachmentcomment
    ADD CONSTRAINT reviews_fileattachmentcomment_file_attachment_id_fkey FOREIGN KEY (file_attachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_fileattachmentcomment reviews_fileattachmentcomment_reply_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_fileattachmentcomment
    ADD CONSTRAINT reviews_fileattachmentcomment_reply_to_id_fkey FOREIGN KEY (reply_to_id) REFERENCES public.reviews_fileattachmentcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_generalcomment reviews_generalcomment_reply_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_generalcomment
    ADD CONSTRAINT reviews_generalcomment_reply_to_id_fkey FOREIGN KEY (reply_to_id) REFERENCES public.reviews_generalcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_group_users reviews_group_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group_users
    ADD CONSTRAINT reviews_group_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_base_reply_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_base_reply_to_id_fkey FOREIGN KEY (base_reply_to_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_body_bottom_reply_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_body_bottom_reply_to_id_fkey FOREIGN KEY (body_bottom_reply_to_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_body_top_reply_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_body_top_reply_to_id_fkey FOREIGN KEY (body_top_reply_to_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_comments reviews_review_comments_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_comments
    ADD CONSTRAINT reviews_review_comments_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.reviews_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_file_attachment_comments reviews_review_file_attachment_co_fileattachmentcomment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_file_attachment_comments
    ADD CONSTRAINT reviews_review_file_attachment_co_fileattachmentcomment_id_fkey FOREIGN KEY (fileattachmentcomment_id) REFERENCES public.reviews_fileattachmentcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_general_comments reviews_review_general_comments_generalcomment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_general_comments
    ADD CONSTRAINT reviews_review_general_comments_generalcomment_id_fkey FOREIGN KEY (generalcomment_id) REFERENCES public.reviews_generalcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_review_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_review_request_id_fkey FOREIGN KEY (review_request_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_reviewed_diffset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_reviewed_diffset_id_fkey FOREIGN KEY (reviewed_diffset_id) REFERENCES public.diffviewer_diffset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_screenshot_comments reviews_review_screenshot_comments_screenshotcomment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_screenshot_comments
    ADD CONSTRAINT reviews_review_screenshot_comments_screenshotcomment_id_fkey FOREIGN KEY (screenshotcomment_id) REFERENCES public.reviews_screenshotcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_changedescs reviews_reviewrequest_changedescs_changedescription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_changedescs
    ADD CONSTRAINT reviews_reviewrequest_changedescs_changedescription_id_fkey FOREIGN KEY (changedescription_id) REFERENCES public.changedescs_changedescription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest reviews_reviewrequest_diffset_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_diffset_history_id_fkey FOREIGN KEY (diffset_history_id) REFERENCES public.diffviewer_diffsethistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_file_attachment_histories reviews_reviewrequest_file_attach_fileattachmenthistory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachment_histories
    ADD CONSTRAINT reviews_reviewrequest_file_attach_fileattachmenthistory_id_fkey FOREIGN KEY (fileattachmenthistory_id) REFERENCES public.attachments_fileattachmenthistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_file_attachments reviews_reviewrequest_file_attachments_fileattachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachments
    ADD CONSTRAINT reviews_reviewrequest_file_attachments_fileattachment_id_fkey FOREIGN KEY (fileattachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_inactive_file_attachments reviews_reviewrequest_inactive_file_atta_fileattachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewrequest_inactive_file_atta_fileattachment_id_fkey FOREIGN KEY (fileattachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_inactive_screenshots reviews_reviewrequest_inactive_screenshots_screenshot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_screenshots
    ADD CONSTRAINT reviews_reviewrequest_inactive_screenshots_screenshot_id_fkey FOREIGN KEY (screenshot_id) REFERENCES public.reviews_screenshot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_screenshots reviews_reviewrequest_screenshots_screenshot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_screenshots
    ADD CONSTRAINT reviews_reviewrequest_screenshots_screenshot_id_fkey FOREIGN KEY (screenshot_id) REFERENCES public.reviews_screenshot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest reviews_reviewrequest_submitter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_submitter_id_fkey FOREIGN KEY (submitter_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_target_groups reviews_reviewrequest_target_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_groups
    ADD CONSTRAINT reviews_reviewrequest_target_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_target_people reviews_reviewrequest_target_people_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_people
    ADD CONSTRAINT reviews_reviewrequest_target_people_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft reviews_reviewrequestdraft_changedesc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewrequestdraft_changedesc_id_fkey FOREIGN KEY (changedesc_id) REFERENCES public.changedescs_changedescription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_depends_on reviews_reviewrequestdraft_depends_on_reviewrequest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_depends_on
    ADD CONSTRAINT reviews_reviewrequestdraft_depends_on_reviewrequest_id_fkey FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft reviews_reviewrequestdraft_diffset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewrequestdraft_diffset_id_fkey FOREIGN KEY (diffset_id) REFERENCES public.diffviewer_diffset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_file_attachments reviews_reviewrequestdraft_file_attachme_fileattachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_file_attachments
    ADD CONSTRAINT reviews_reviewrequestdraft_file_attachme_fileattachment_id_fkey FOREIGN KEY (fileattachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments reviews_reviewrequestdraft_inactive_file_fileattachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewrequestdraft_inactive_file_fileattachment_id_fkey FOREIGN KEY (fileattachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots reviews_reviewrequestdraft_inactive_screensh_screenshot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_screenshots
    ADD CONSTRAINT reviews_reviewrequestdraft_inactive_screensh_screenshot_id_fkey FOREIGN KEY (screenshot_id) REFERENCES public.reviews_screenshot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft reviews_reviewrequestdraft_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewrequestdraft_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft reviews_reviewrequestdraft_review_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewrequestdraft_review_request_id_fkey FOREIGN KEY (review_request_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_screenshots reviews_reviewrequestdraft_screenshots_screenshot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_screenshots
    ADD CONSTRAINT reviews_reviewrequestdraft_screenshots_screenshot_id_fkey FOREIGN KEY (screenshot_id) REFERENCES public.reviews_screenshot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_target_groups reviews_reviewrequestdraft_target_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_groups
    ADD CONSTRAINT reviews_reviewrequestdraft_target_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_target_people reviews_reviewrequestdraft_target_people_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_people
    ADD CONSTRAINT reviews_reviewrequestdraft_target_people_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_screenshotcomment reviews_screenshotcomment_reply_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshotcomment
    ADD CONSTRAINT reviews_screenshotcomment_reply_to_id_fkey FOREIGN KEY (reply_to_id) REFERENCES public.reviews_screenshotcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_screenshotcomment reviews_screenshotcomment_screenshot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshotcomment
    ADD CONSTRAINT reviews_screenshotcomment_screenshot_id_fkey FOREIGN KEY (screenshot_id) REFERENCES public.reviews_screenshot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_statusupdate reviews_statusupdate_change_description_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_change_description_id_fkey FOREIGN KEY (change_description_id) REFERENCES public.changedescs_changedescription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_statusupdate reviews_statusupdate_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_statusupdate reviews_statusupdate_review_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_review_request_id_fkey FOREIGN KEY (review_request_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_statusupdate reviews_statusupdate_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository scmtools_repository_hosting_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_hosting_account_id_fkey FOREIGN KEY (hosting_account_id) REFERENCES public.hostingsvcs_hostingserviceaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository_review_groups scmtools_repository_review_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_review_groups
    ADD CONSTRAINT scmtools_repository_review_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository scmtools_repository_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_tool_id_fkey FOREIGN KEY (tool_id) REFERENCES public.scmtools_tool(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository_users scmtools_repository_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_users
    ADD CONSTRAINT scmtools_repository_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_localsite_admins site_localsite_admins_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_admins
    ADD CONSTRAINT site_localsite_admins_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_localsite_users site_localsite_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_users
    ADD CONSTRAINT site_localsite_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: siteconfig_siteconfiguration siteconfig_siteconfiguration_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siteconfig_siteconfiguration
    ADD CONSTRAINT siteconfig_siteconfiguration_site_id_fkey FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_depends_on to_reviewrequest_id_refs_id_623cfa96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_depends_on
    ADD CONSTRAINT to_reviewrequest_id_refs_id_623cfa96 FOREIGN KEY (to_reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapi_webapitoken webapi_webapitoken_local_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webapi_webapitoken
    ADD CONSTRAINT webapi_webapitoken_local_site_id_fkey FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapi_webapitoken webapi_webapitoken_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webapi_webapitoken
    ADD CONSTRAINT webapi_webapitoken_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_webhooktarget_repositories webhooktarget_id_refs_id_d5ae3ed2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget_repositories
    ADD CONSTRAINT webhooktarget_id_refs_id_d5ae3ed2 FOREIGN KEY (webhooktarget_id) REFERENCES public.notifications_webhooktarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

