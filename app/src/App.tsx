import { useState, useEffect } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  BarElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js'
import { Line, Bar } from 'react-chartjs-2'

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  BarElement,
  Title,
  Tooltip,
  Legend
)

interface PunkVolumeDataPoint {
  period: string
  total_sales: string
  total_volume_eth: number
  avg_price_eth: number
  min_price_eth: number
  max_price_eth: number
  percentile_25_eth: number
  percentile_50_eth: number
  percentile_75_eth: number
}

interface PunkVolumeData {
  interval: string
  data: PunkVolumeDataPoint[]
  total_records: number
}

type DataType = 'total_volume_eth' | 'total_sales' | 'avg_price_eth' | 'min_price_eth' | 'max_price_eth' | 'percentile_25_eth' | 'percentile_50_eth' | 'percentile_75_eth'
type TimeInterval = 'day' | 'week' | 'month'

function App() {
  const [count, setCount] = useState(0)
  const [punkVolumeData, setPunkVolumeData] = useState<PunkVolumeData | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [selectedDataType, setSelectedDataType] = useState<DataType>('total_volume_eth')
  const [selectedInterval, setSelectedInterval] = useState<TimeInterval>('month')

  // Helper function to get data label and unit
  const getDataLabel = (dataType: DataType) => {
    const labels = {
      total_volume_eth: 'Total Volume (ETH)',
      total_sales: 'Total Sales Count',
      avg_price_eth: 'Average Price (ETH)',
      min_price_eth: 'Minimum Price (ETH)',
      max_price_eth: 'Maximum Price (ETH)',
      percentile_25_eth: '25th Percentile Price (ETH)',
      percentile_50_eth: '50th Percentile Price (ETH)',
      percentile_75_eth: '75th Percentile Price (ETH)',
    };
    return labels[dataType];
  };

  // Helper function to prepare chart data
  const prepareChartData = () => {
    if (!punkVolumeData?.data) return null;

    // Sort data by date and take appropriate number of records based on interval
    const recordsToShow = selectedInterval === 'day' ? 30 : selectedInterval === 'week' ? 12 : 24;
    const sortedData = [...punkVolumeData.data]
      .sort((a, b) => new Date(a.period).getTime() - new Date(b.period).getTime())
      .slice(-recordsToShow);

    const labels = sortedData.map(item => {
      const date = new Date(item.period);
      if (selectedInterval === 'day') {
        return date.toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
      } else if (selectedInterval === 'week') {
        return date.toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
      } else {
        return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short' });
      }
    });

    // Get the data values based on selected type
    const getData = (item: PunkVolumeDataPoint) => {
      if (selectedDataType === 'total_sales') {
        return parseInt(item.total_sales);
      }
      return item[selectedDataType];
    };

    const isVolumeOrSales = selectedDataType === 'total_volume_eth' || selectedDataType === 'total_sales';
    
    return {
      labels,
      datasets: [
        {
          label: getDataLabel(selectedDataType),
          data: sortedData.map(getData),
          borderColor: isVolumeOrSales ? 'rgb(75, 192, 192)' : 'rgba(255, 99, 132, 1)',
          backgroundColor: isVolumeOrSales ? 'rgba(75, 192, 192, 0.2)' : 'rgba(255, 99, 132, 0.6)',
          tension: 0.1,
          borderWidth: 1,
        },
      ],
    };
  };

  const chartOptions = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top' as const,
      },
      title: {
        display: true,
        text: 'CryptoPunks Trading Data (Last 30 Days)',
      },
    },
    scales: {
      y: {
        beginAtZero: true,
      },
    },
  };

  const fetchPunkVolumeData = async () => {
    setLoading(true)
    setError(null)
    
    try {
      // Use proxy endpoint to avoid CORS issues
      let response = await fetch(
        `/api/punk-volume?interval=${selectedInterval}&api_key=sim_QYvahaISz1HLYCx4N4DFWjxJTbuYYAAF`,
        {
          method: 'GET',
          headers: {
            'Accept': 'application/json',
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
      setError(err instanceof Error ? err.message : 'An error occurred while fetching punk volume data')
      console.error('Error fetching punk volume data:', err)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchPunkVolumeData()
  }, [selectedInterval])

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
        
        <div style={{ display: 'flex', gap: '15px', marginBottom: '15px', flexWrap: 'wrap', alignItems: 'center' }}>
          <div>
            <label htmlFor="dataType" style={{ marginRight: '8px', fontWeight: 'bold' }}>Data Type:</label>
            <select 
              id="dataType"
              value={selectedDataType} 
              onChange={(e) => setSelectedDataType(e.target.value as DataType)}
              style={{ padding: '5px 10px', borderRadius: '4px', border: '1px solid #ccc' }}
            >
              <option value="total_volume_eth">Total Volume (ETH)</option>
              <option value="total_sales">Total Sales Count</option>
              <option value="avg_price_eth">Average Price (ETH)</option>
              <option value="min_price_eth">Minimum Price (ETH)</option>
              <option value="max_price_eth">Maximum Price (ETH)</option>
              <option value="percentile_25_eth">25th Percentile (ETH)</option>
              <option value="percentile_50_eth">50th Percentile (ETH)</option>
              <option value="percentile_75_eth">75th Percentile (ETH)</option>
            </select>
          </div>
          
          <div>
            <label htmlFor="timeInterval" style={{ marginRight: '8px', fontWeight: 'bold' }}>Time Interval:</label>
            <select 
              id="timeInterval"
              value={selectedInterval} 
              onChange={(e) => setSelectedInterval(e.target.value as TimeInterval)}
              style={{ padding: '5px 10px', borderRadius: '4px', border: '1px solid #ccc' }}
            >
              <option value="day">Daily</option>
              <option value="week">Weekly</option>
              <option value="month">Monthly</option>
            </select>
          </div>
          
          <button onClick={fetchPunkVolumeData} disabled={loading}>
            {loading ? 'Loading...' : 'Refresh Data'}
          </button>
        </div>
        
        {loading && <p>Loading punk volume data...</p>}
        
        {error && (
          <div style={{ color: 'red', margin: '10px 0', textAlign: 'left' }}>
            <p><strong>Error:</strong> {error}</p>
            <details style={{ marginTop: '10px' }}>
              <summary style={{ cursor: 'pointer', color: '#0066cc' }}>
                💡 How to fix this CORS issue
              </summary>
              <div style={{ marginTop: '10px', padding: '10px', backgroundColor: '#f8f9fa', borderRadius: '4px' }}>
                <p><strong>Option 1:</strong> Add a proxy to your Vite config:</p>
                <pre style={{ backgroundColor: '#e9ecef', padding: '8px', borderRadius: '3px', fontSize: '12px' }}>

                </pre>
                <p><strong>Option 2:</strong> Use a browser extension like "CORS Unblock" for development</p>
                <p><strong>Option 3:</strong> Test the API directly in a new tab: 
                  <a href="https://fe89cde530-4166ec59be.idx.sim.io/punk-volume?api_key=sim_QYvahaISz1HLYCx4N4DFWjxJTbuYYAAF" 
                     target="_blank" 
                     style={{ color: '#0066cc', textDecoration: 'underline' }}>
                    Open API URL
                  </a>
                </p>
              </div>
            </details>
          </div>
        )}
        
        {punkVolumeData && !loading && (
          <div style={{ margin: '20px 0' }}>
            <div style={{ marginBottom: '30px' }}>
              <h3>{getDataLabel(selectedDataType)} Chart</h3>
              {prepareChartData() && (
                <div style={{ height: '400px', marginBottom: '20px' }}>
                  {selectedDataType === 'total_sales' ? (
                    <Bar 
                      data={prepareChartData()!} 
                      options={{
                        ...chartOptions,
                        plugins: {
                          ...chartOptions.plugins,
                          title: {
                            display: true,
                            text: `${getDataLabel(selectedDataType)} - ${selectedInterval.charAt(0).toUpperCase() + selectedInterval.slice(1)}ly Data`
                          }
                        }
                      }} 
                    />
                  ) : (
                    <Line 
                      data={prepareChartData()!} 
                      options={{
                        ...chartOptions,
                        plugins: {
                          ...chartOptions.plugins,
                          title: {
                            display: true,
                            text: `${getDataLabel(selectedDataType)} - ${selectedInterval.charAt(0).toUpperCase() + selectedInterval.slice(1)}ly Data`
                          }
                        }
                      }} 
                    />
                  )}
                </div>
              )}
            </div>

            <div style={{ marginBottom: '20px' }}>
              <h3>Summary Statistics</h3>
              {punkVolumeData.data && (
                <div style={{ 
                  display: 'grid', 
                  gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))', 
                  gap: '15px',
                  textAlign: 'left'
                }}>
                  <div style={{ padding: '15px', backgroundColor: '#f8f9fa', borderRadius: '8px' }}>
                    <strong>Total Records:</strong> {punkVolumeData.total_records}
                  </div>
                  <div style={{ padding: '15px', backgroundColor: '#f8f9fa', borderRadius: '8px' }}>
                    <strong>Data Interval:</strong> {punkVolumeData.interval}
                  </div>
                  <div style={{ padding: '15px', backgroundColor: '#f8f9fa', borderRadius: '8px' }}>
                    <strong>Latest Volume:</strong> {punkVolumeData.data[0]?.total_volume_eth.toFixed(2)} ETH
                  </div>
                  <div style={{ padding: '15px', backgroundColor: '#f8f9fa', borderRadius: '8px' }}>
                    <strong>Latest Sales:</strong> {punkVolumeData.data[0]?.total_sales}
                  </div>
                </div>
              )}
            </div>

            <details style={{ marginTop: '20px' }}>
              <summary style={{ cursor: 'pointer', color: '#0066cc', marginBottom: '10px' }}>
                📊 View Raw Data
              </summary>
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
            </details>
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
