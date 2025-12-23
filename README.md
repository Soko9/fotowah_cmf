# fotowah_cmf
System App for Fotowat Al Aqsa

## SECTIONS
1. حلقات القرآن
2. رائدات
3. Smart Academy
4. رياضة
5. كشاف
6. القسم الاجتماعي
7. القسم الدعوي
8. قسم العلاقات

## DATA
### members
| KEY           | TYPE     |
|---------------|----------|
| id            | uuid     |
| full_name     | text     |
| gender        | bit      |
| date_of_birth | datetime |
| phone         | text     |
| address_id    | uuid     |
| nationality   | text     |
| joined_at     | datetime |
| is_active     | bool     |

### addressed
| KEY      | TYPE |
|----------|------|
| id       | uuid |
| city     | text |
| district | text |
| !address | text |

### roles
| KEY  | TYPE |
|------|------|
| id   | uuid |
| name | text |

[//]: # (ROLES)
[//]: # (* admin)
[//]: # (* section_manager)
[//]: # (* quran_manager)
[//]: # (* staff)
[//]: # (* kid)
[//]: # (* guardian)
[//]: # (* needy)
[//]: # (* supporter)

### permissions
| KEY  | TYPE |
|------|------|
| id   | uuid |
| name | text |

### role_permissions
| KEY           | TYPE |
|---------------|------|
| role_id       | uuid |
| permission_id | uuid |

### member_roles
| KEY       | TYPE |
|-----------|------|
| member_id | uuid |
| role_id   | uuid |

### section
| KEY                | TYPE |
|--------------------|------|
| id                 | uuid |
| name               | text |
| section_manager_id | uuid |

### quran_circles
| KEY              | TYPE       |
|------------------|------------|
| id               | uuid       |
| name             | text       |
| weeklyGatherings | datetime[] |
| quran_manager_id | uuid       |
| section_id       | uuid       |

### quran_circle_memebers
| KEY       | TYPE |
|-----------|------|
| circle_id | uuid |
| member_id | uuid |

### quran_circle_gathering
| KEY       | TYPE     |
|-----------|----------|
| id        | int      |
| datetime  | datetime |
| place     | text     |
| circle_id | uuid     |

### quran_circle_attendence
| KEY           | TYPE       |
|---------------|------------|
| gathering_id  | uuid       |
| member_id     | uuid       |
| status        | uuid       |
| score         | int        |
| !note         | text       |
| !quran_verses | (int, int) |
| !quality      | int        |

[//]: # (STATUSES)
[//]: # (* absent)
[//]: # (* present)
[//]: # (* excused)

### additional data
- monthly_attendance_view
- annual_progress_view
- section_growth_view
- auto_deactivating_members
- parent_aware_notification_system

---------------------------------------------
