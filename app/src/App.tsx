import { useState, useEffect } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

interface PunkVolumeData {
  // We'll define this based on the API response
  [key: string]: any
}

function App() {
  const [count, setCount] = useState(0)
  const [punkVolumeData, setPunkVolumeData] = useState<PunkVolumeData | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const fetchPunkVolumeData = async () => {
    setLoading(true)
    setError(null)
    
    try {
      const response = await fetch(
        'https://fe89cde530-3fca91b1fc.idx.sim.io/punk-volume?interval=day&api_key=sim_QYvahaISz1HLYCx4N4DFWjxJTbuYYAAF',
        {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          }
        }
      )

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`)
      }

      const data = await response.json()
      setPunkVolumeData(data)
      console.log('Punk Volume Data:', data)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred')
      console.error('Error fetching punk volume data:', err)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchPunkVolumeData()
  }, [])

  return (
    <>
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Punk Indexer</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      
      <div className="card">
        <h2>Punk Volume Data</h2>
        <button onClick={fetchPunkVolumeData} disabled={loading}>
          {loading ? 'Loading...' : 'Refresh Data'}
        </button>
        
        {loading && <p>Loading punk volume data...</p>}
        
        {error && (
          <div style={{ color: 'red', margin: '10px 0' }}>
            <p>Error: {error}</p>
          </div>
        )}
        
        {punkVolumeData && !loading && (
          <div style={{ textAlign: 'left', margin: '20px 0' }}>
            <h3>API Response:</h3>
            <pre style={{ 
              background: '#f5f5f5', 
              padding: '10px', 
              borderRadius: '4px',
              overflow: 'auto',
              maxHeight: '400px',
              fontSize: '12px'
            }}>
              {JSON.stringify(punkVolumeData, null, 2)}
            </pre>
          </div>
        )}
      </div>
      
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  )
}

export default App
