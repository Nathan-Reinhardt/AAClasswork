import React from "react";

class BenchIndex extends React.Component {
    componentDidMount() {
        this.props.fetchBenches();
    }
    
    render() {
        return (
            <div>
                <ul>
                    {Array.from(this.props.benches).map(bench => (
                        <li>{bench.description}, {bench.lat}, {bench.lng}</li>
                    ))}
                </ul>
            </div>
        )
    }
}

export default BenchIndex;