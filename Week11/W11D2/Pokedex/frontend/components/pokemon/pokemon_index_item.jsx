import React from 'react';
import PokemonIndex from './pokemon_index';
import { Link } from 'react-router-dom';

class PokemonIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
    <Link to={`/pokemon/${this.props.pokemon.id}`}> 
      <li>
        <div>
          {this.props.pokemon.name}
        </div>
        <div>
          <img src={this.props.pokemon.image_url} />
        </div>
      </li>
    </Link>
    )
  }
}

export default PokemonIndexItem;