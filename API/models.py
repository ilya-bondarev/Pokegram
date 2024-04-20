from sqlalchemy import Column, Integer, String, ForeignKey, Text, TIMESTAMP, Float
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Ability(Base):
    __tablename__ = 'abilities'
    ability_id = Column(Integer, primary_key=True)
    ability_name = Column(String, nullable=False)

    # Relationship (Assuming many-to-many with Pokémon)
    pokemons = relationship("Pokemon", secondary="pokemon_abilities", back_populates="abilities")

class PokemonAbility(Base):
    __tablename__ = 'pokemon_abilities'
    pokemon_id = Column(Integer, ForeignKey('pokemons.pokemon_id'), primary_key=True)
    ability_id = Column(Integer, ForeignKey('abilities.ability_id'), primary_key=True)

class PokemonDetail(Base):
    __tablename__ = 'pokemon_details'
    pokemon_id = Column(Integer, ForeignKey('pokemons.pokemon_id'), primary_key=True)
    pokemon_photo = Column(Text)
    pokemon_height = Column(Float)
    pokemon_weight = Column(Float)
    pokemon_breed_period = Column(Integer)
    pokemon_sex_ratio = Column(String)
    pokemon_total_amount = Column(Integer)
    pokemon_shine = Column(Integer)
    pokemon_rarity = Column(Float)

    pokemon = relationship("Pokemon", back_populates="details", uselist=False)

class PokemonStat(Base):
    __tablename__ = 'pokemon_stats'
    pokemon_id = Column(Integer, ForeignKey('pokemons.pokemon_id'), primary_key=True)
    pokemon_health = Column(Integer)
    pokemon_attack = Column(Integer)
    pokemon_defence = Column(Integer)
    pokemon_speed = Column(Integer)
    pokemon_special_attack = Column(Integer)
    pokemon_special_defence = Column(Integer)
    pokemon_total_sum = Column(Integer)

    pokemon = relationship("Pokemon", back_populates="stats", uselist=False)

class PokemonType(Base):
    __tablename__ = 'pokemon_types'
    type_id = Column(Integer, primary_key=True)
    type_title = Column(String, nullable=False)

    pokemons = relationship("Pokemon", back_populates="type")

class XpGroup(Base):
    __tablename__ = 'xp_groups'
    group_id = Column(Integer, primary_key=True)
    group_title = Column(String, nullable=False)

    pokemons = relationship("Pokemon", back_populates="xp_group")

class Pokemon(Base):
    __tablename__ = 'pokemons'
    pokemon_id = Column(Integer, primary_key=True)
    pokemon_title = Column(String, nullable=False)
    pokemon_name = Column(String, nullable=False)
    pokemon_type = Column(Integer, ForeignKey('pokemon_types.type_id'))
    pokemon_xp_group = Column(Integer, ForeignKey('xp_groups.group_id'))

    type = relationship("PokemonType", back_populates="pokemons")
    xp_group = relationship("XpGroup", back_populates="pokemons")
    details = relationship("PokemonDetail", back_populates="pokemon")
    stats = relationship("PokemonStat", back_populates="pokemon")
    abilities = relationship("Ability", secondary="pokemon_abilities", back_populates="pokemons")


class User(Base):
    __tablename__ = 'poke_users'
    
    user_id = Column(Integer, primary_key=True)
    user_name = Column(String, nullable=False)
    user_totem_pokemon = Column(Integer)
    user_password = Column(Text, nullable=False)
    user_role = Column(Integer, ForeignKey('roles.role_id'))
    
    role = relationship("Role", back_populates="users")
    activities = relationship("UserActivity", back_populates="user")

class Role(Base):
    __tablename__ = 'roles'
    
    role_id = Column(Integer, primary_key=True)
    role_title = Column(String, nullable=False)
    
    users = relationship("User", back_populates="role")

class UserActivity(Base):
    __tablename__ = 'user_activities'
    
    activity_id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey('poke_users.user_id'))
    activity = Column(String, nullable=False)
    timestamp = Column(TIMESTAMP, nullable=False)
    
    user = relationship("User", back_populates="activities")