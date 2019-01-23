{
    "id": "2660ec59-535c-4bb4-9170-e49b8b8550bc",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "o_base_entity",
    "eventList": [
        {
            "id": "95b23824-e7c7-41dc-8c89-402cb9c30848",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 2,
            "eventtype": 3,
            "m_owner": "2660ec59-535c-4bb4-9170-e49b8b8550bc"
        },
        {
            "id": "90e6037a-8258-496f-90f5-e340b34f06dd",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "2660ec59-535c-4bb4-9170-e49b8b8550bc"
        },
        {
            "id": "90c29a4e-e637-4928-92c8-455ff32ebc37",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "2660ec59-535c-4bb4-9170-e49b8b8550bc"
        },
        {
            "id": "2a27d781-52b4-4185-9c3b-5598f06944dd",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 7,
            "eventtype": 7,
            "m_owner": "2660ec59-535c-4bb4-9170-e49b8b8550bc"
        },
        {
            "id": "2964c93e-a1a7-48ae-bcfe-1ef83af95ea3",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 8,
            "m_owner": "2660ec59-535c-4bb4-9170-e49b8b8550bc"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "00000000-0000-0000-0000-000000000000",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "31d98ac6-48d7-4ff6-abad-1413d976c1e5",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "false",
            "varName": "Player_Object",
            "varType": 3
        },
        {
            "id": "fb43701e-a207-4528-b359-7d543f5cc3d5",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "Enemy_Object",
            "varType": 3
        },
        {
            "id": "4600cd12-20d3-4ce8-8f27-fda77d4f3f72",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "Ally_Object",
            "varType": 3
        },
        {
            "id": "e6eaa933-edae-4471-b71a-9e9ba103b6ea",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "2000",
            "varName": "hp_max",
            "varType": 1
        },
        {
            "id": "5bed4370-32d4-40b6-a92e-27716094917c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1000",
            "varName": "poise_max",
            "varType": 0
        },
        {
            "id": "ce508f3c-f9b9-47ed-b7dc-cf39a5122f90",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "80",
            "varName": "poise_regain_max",
            "varType": 0
        },
        {
            "id": "3689fa26-aca1-4ca8-b775-4452963ffc22",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "40",
            "varName": "stun_delay_max",
            "varType": 0
        },
        {
            "id": "d1b50b80-ad95-4b58-8a21-2b5a4231e68a",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "500",
            "varName": "max_stun_time",
            "varType": 0
        },
        {
            "id": "3b419981-bafa-45f6-835d-f14a68ef6aa4",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "stun_recovery_rate",
            "varType": 0
        },
        {
            "id": "48b646d2-f49b-46ce-8f09-ab0eecab195e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "my_direction",
            "varType": 0
        },
        {
            "id": "ef0a96f6-d13a-4c4f-946d-3253b9def313",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0.3",
            "varName": "walk_sp",
            "varType": 0
        },
        {
            "id": "219ef471-6f3a-4095-ab60-04fa0783f323",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "3.3",
            "varName": "max_walk_sp",
            "varType": 0
        },
        {
            "id": "391a4c63-d4cd-42aa-aebf-8cc979e5fbe9",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "3.2",
            "varName": "max_air_sp",
            "varType": 0
        },
        {
            "id": "8e979e28-2365-4664-8770-881e38aea628",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "-8.5",
            "varName": "jump_height",
            "varType": 0
        },
        {
            "id": "1502cdfd-963a-40b4-9f77-d7893224ffac",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0.55",
            "varName": "weight",
            "varType": 0
        },
        {
            "id": "3bf0dfe9-1b6f-4a87-a5a0-5401c57e8696",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "gravity_resistance",
            "varType": 0
        },
        {
            "id": "77241466-f72d-401a-95ba-8bbe4437c364",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "max_slide_sp",
            "varType": 0
        },
        {
            "id": "fefb4280-8c76-4070-b0d5-f7e947eba05d",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "6",
            "varName": "dash_sp",
            "varType": 0
        },
        {
            "id": "4633f8d4-f557-4c0a-9b31-177dd41c0ec7",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "max_pulse_points",
            "varType": 0
        },
        {
            "id": "7ee09f70-2e1c-41ce-bb7a-f105456cf509",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "max_mana_points",
            "varType": 0
        },
        {
            "id": "13d36dfa-84e5-4614-bca6-cb818a14f8c1",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "idle_animation_01",
            "varType": 5
        },
        {
            "id": "f5f4e073-e94b-4021-94bb-4bc0db31359e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_airidle",
            "varName": "idle_animation_02",
            "varType": 5
        },
        {
            "id": "54c567ad-8791-4ccf-b78b-768053988f85",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "idle_animation_03",
            "varType": 5
        },
        {
            "id": "5846be60-bacc-4615-bd70-cff787335a57",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "run_animation",
            "varType": 5
        },
        {
            "id": "b7ff5324-01e1-4284-a870-2406b1c0cd76",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "stop_animation_01",
            "varType": 5
        },
        {
            "id": "ded4eb72-a3fa-4c3c-b518-fced30d10b7b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "anim_allow_stop",
            "varType": 3
        },
        {
            "id": "5b275a0f-2b2e-4a06-a6d7-7c7fc3e15fad",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "air_rise_animation",
            "varType": 5
        },
        {
            "id": "408a4a6f-440b-450f-97f6-05103177bc36",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "air_arc_animation",
            "varType": 5
        },
        {
            "id": "d4e578e1-d092-4a7a-80e4-d1cc56d46804",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "air_fall_animation",
            "varType": 5
        },
        {
            "id": "bab786af-8a16-4e37-9ed5-060522185bfa",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "anim_allow_arc",
            "varType": 3
        },
        {
            "id": "38615f68-dff4-4627-b5a0-d8730f2f1ef9",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "land_idle_animation",
            "varType": 5
        },
        {
            "id": "ba9502ce-0b76-400f-9108-b45bd37e6b75",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "anim_allow_land_idle",
            "varType": 3
        },
        {
            "id": "a35d93b5-b7b5-483d-980f-248a21c5e619",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "land_run_animation",
            "varType": 5
        },
        {
            "id": "2b7795f2-4da6-4279-8548-3cf3b0c5e62a",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "anim_allow_land_run",
            "varType": 3
        },
        {
            "id": "8a296d5a-eff9-4ee0-99a5-6b8192255438",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "turn_idle_animation",
            "varType": 5
        },
        {
            "id": "c49fc3d3-dbf7-4e3a-be3d-9126d41649f8",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "anim_allow_turn_idle",
            "varType": 3
        },
        {
            "id": "3cc11671-f74b-4179-9306-904551da8e19",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_idle",
            "varName": "turn_run_animation",
            "varType": 5
        },
        {
            "id": "e50e7c38-2a08-4c82-b8f4-0d3b620b51cd",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "anim_allow_turn_run",
            "varType": 3
        },
        {
            "id": "9b6f2d3f-c99b-404f-95d9-8ce9a5f875ec",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_stunned",
            "varName": "stun_animation",
            "varType": 5
        },
        {
            "id": "9154e5b1-f6d0-4ad3-bd63-df6fa584007e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_launch01",
            "varName": "launch_up_animation",
            "varType": 5
        },
        {
            "id": "3a5d11d1-5a11-4c40-87f4-d363cdcaeb86",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_launch01",
            "varName": "launch_side_animation",
            "varType": 5
        },
        {
            "id": "026c6140-6411-456c-a03d-fa01ab49c89d",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_launch02",
            "varName": "launch_down_animation",
            "varType": 5
        },
        {
            "id": "5a1066a2-231c-4489-b988-9ff27ca93a8b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_bounce01",
            "varName": "bounce_side_animation",
            "varType": 5
        },
        {
            "id": "2ef50ded-de52-4097-8317-4a9d9d833e98",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_bounce02",
            "varName": "bounce_floor_animation",
            "varType": 5
        },
        {
            "id": "e64cc576-a9c2-4149-aa1d-3ec290ac29e5",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_launch02",
            "varName": "bounce_fall_animation",
            "varType": 5
        },
        {
            "id": "a09a7493-6b28-4eca-b849-3c301a925e61",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_sleep",
            "varName": "sleep_animation",
            "varType": 5
        },
        {
            "id": "bf67333d-0522-4722-b644-450ba01b4407",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_e_george_wake",
            "varName": "wake_animation",
            "varType": 5
        },
        {
            "id": "ac4591d1-b9cd-4e3d-aebf-091293ab8c96",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_dive_start",
            "varName": "ground_pound_animation_01",
            "varType": 5
        },
        {
            "id": "9c192c9d-5f36-4504-a852-43cd381d120d",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_dive_fall",
            "varName": "ground_pound_animation_02",
            "varType": 5
        },
        {
            "id": "1b208dc1-8488-457a-a3e6-40d7a12958f3",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_dive_land",
            "varName": "ground_pound_animation_03",
            "varType": 5
        },
        {
            "id": "5599cca8-fec2-4a3a-84dc-55f7739eac0b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_slide_up",
            "varName": "slide_up_animation",
            "varType": 5
        },
        {
            "id": "eb8a2442-2bd3-4d41-b075-509e774a4c67",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_slide_down",
            "varName": "slide_down_animation",
            "varType": 5
        },
        {
            "id": "aacae429-99f6-4e45-bbf7-4be8c56fefbe",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_slide_normal",
            "varName": "slide_straight_animation",
            "varType": 5
        },
        {
            "id": "4a1a9d46-59ad-445c-ae5c-da94185137cf",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_stop",
            "varName": "slide_end_animation",
            "varType": 5
        },
        {
            "id": "a1f9cc69-4e10-40c3-beb9-536710254cb3",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_slide_jump",
            "varName": "slide_jump_animation_01",
            "varType": 5
        },
        {
            "id": "7c9a7782-ad12-40f8-b6ed-c92a9f9633bb",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_slide_highjump",
            "varName": "slide_jump_animation_02",
            "varType": 5
        },
        {
            "id": "efd40b4d-7f18-48c6-ab1e-69f575ba3764",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_ledge_grab",
            "varName": "ledge_grab_animation",
            "varType": 5
        },
        {
            "id": "e1ada7ff-2758-42ba-be24-fd6241855920",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_ledge_hold",
            "varName": "ledge_hold_animation",
            "varType": 5
        },
        {
            "id": "1922dd16-a72d-41e7-bc0d-fe58206405ca",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_ledge_getup",
            "varName": "ledge_climb_animation",
            "varType": 5
        },
        {
            "id": "485c7209-5951-4623-9f0b-e30e689cf7fd",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_airstep_jump",
            "varName": "airstep_spin_animation",
            "varType": 5
        },
        {
            "id": "1aefc2c7-e8e2-4bd6-af68-a54f2b29d3bb",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_airstep_enemy",
            "varName": "airstep_step_animation_01",
            "varType": 5
        },
        {
            "id": "859e29b9-1e41-4236-b65c-3c44d9e5908b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_airstep_wall",
            "varName": "airstep_step_animation_02",
            "varType": 5
        },
        {
            "id": "1d5774b0-1706-4ffd-b377-05c574601938",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_dash",
            "varName": "dash_animation",
            "varType": 5
        },
        {
            "id": "97edda97-eb31-43d6-bb36-a01d57fb627e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "s_player_dashstop",
            "varName": "dash_end_animation",
            "varType": 5
        }
    ],
    "solid": false,
    "spriteId": "d3465160-2906-4de1-97dc-5a0114663073",
    "visible": true
}